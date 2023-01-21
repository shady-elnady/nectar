from typing import TYPE_CHECKING, Optional

from django.db.models.manager import Manager

if TYPE_CHECKING:
    from .models import Card 


class CartManager(Manager):

    def new_or_get(self, request):
        try:
            # First try to get the cart based off the authenticated
            # user.
            cart = self.get(user=request.user)
        except self.model.DoesNotExist:
            # This should fail if the user is not authenticated or if
            # the user doesn't have a cart associated with their
            # account.
            pass
        else:
            # Since there is no guarantee that the session id is set
            # correctly, set it.
            request.session['cart_id'] = cart.id

            # Return the cart that is already found. Nothing further
            # needs to be done.
            return cart, False

        try:
            # Try to get the cart based of the id variable stored in
            # the `request.session`.
            cart = self.get(id=request.session['cart_id'])
        except (self.model.DoesNotExist, KeyError):
            # This will fail if there is no `cart_id` in the session or
            # if no cart is found.
            pass
        else:
            # If there is no user on the cart and the user is
            # authenticated add the user to the cart.
            if not cart.user and request.user.is_authenticated:
                cart.user = request.user
                cart.save()

            # Again, return the cart that was found. Nother further
            # needs to be done.
            return cart, False

        # This point will be reached if no cart is found from either
        # the authenticated user or the session id. Create a new cart
        # and return it.
        cart = self.new(request.user)
        request.session['cart_id'] = cart.id
        return cart, True

    def new(self, user=None):
        # If the user is an `AnonymousUser` (boolean value of True, but
        # not authenticated) then just set the variable to `None`.
        if user and not user.is_authenticated:
            user = None
        return self.create(user=user)