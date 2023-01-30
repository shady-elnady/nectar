from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login, logout, authenticate

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.exceptions import AuthenticationFailed
from rest_framework_simplejwt.tokens import RefreshToken

from User.models import User
from User.Serializer import LogInSerialzer, UserSerializer

import jwt, datetime


# Create your views here.

class RegisterView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)


class LoginView(APIView):
    def post(self, request):
        email = request.data['email']
        password = request.data['password']

        user = User.objects.filter(email=email).first()

        if user is None:
            raise AuthenticationFailed('User not found!')

        if not user.check_password(password):
            raise AuthenticationFailed('Incorrect password!')

        payload = {
            'id': user.id,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=60),
            'iat': datetime.datetime.utcnow()
        }

        token = jwt.encode(payload, 'secret', algorithm='HS256').decode('utf-8')

        response = Response()

        response.set_cookie(key='jwt', value=token, httponly=True)
        response.data = {
            'jwt': token
        }
        return response


class UserView(APIView):

    def get(self, request):
        token = request.COOKIES.get('jwt')

        if not token:
            raise AuthenticationFailed('Unauthenticated!')

        try:
            payload = jwt.decode(token, 'secret', algorithm=['HS256'])
        except jwt.ExpiredSignatureError:
            raise AuthenticationFailed('Unauthenticated!')

        user = User.objects.filter(id=payload['id']).first()
        serializer = UserSerializer(user)
        return Response(serializer.data)


class LogoutView(APIView):
    def post(self, request):
        response = Response()
        response.delete_cookie('jwt')
        response.data = {
            'message': 'success'
        }
        logout() # Added
        return response


## Rest FramWork

class LogInApi(APIView):
    def post(self, request):
        try:
            data= request.data
            serialzer = LogInSerialzer(data= data)
            if serialzer.is_valid():
                email = serialzer.data["email"]
                password = serialzer.data["password"]
                user = authenticate(email= email, password= password) 
                if user is None:
                    return Response({
                        "status": 400,
                        "message": "Some Thing went Wrong",
                        "data": serialzer.errors,
                    })
                if user.is_verified is False:
                    return Response({
                        "status": 400,
                        "message": "Your Account is Not Verified Yeit",
                        "data": {},
                    })

                refresh = RefreshToken.for_user(user)
                return {
                    'refresh': str(refresh),
                    'access': str(refresh.access_token),
                }
            
            return Response({
                "status": 400,
                "message": "Some Thing went Wrong",
                "data": serialzer.errors,
            })
        
        except Exception as e:
            print(e)