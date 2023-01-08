// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'themes/app_theme.dart';
import 'views/screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const AuthExampleApp());
}

class AuthExampleApp extends StatefulWidget {
  const AuthExampleApp({Key? key}) : super(key: key);

  @override
  State<AuthExampleApp> createState() => _AuthExampleAppState();
}

class _AuthExampleAppState extends State<AuthExampleApp> {
  @override
  void initState() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in! \n User: $user');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppTheme.appName,
      home: const HomeScreen(),
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

// class FireBaseHelp extends StatelessWidget {
//   const FireBaseHelp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const Text("hii"),
//             ElevatedButton(
//               onPressed: () async {
//                 print("Clicked");
//                 try {
//                   await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                     email: "shady@gmail.com",
//                     password: "123456789",
//                   );
//                 } on FirebaseAuthException catch (e) {
//                   if (e.code == 'weak-password') {
//                     print('The password provided is too weak.');
//                   } else if (e.code == 'email-already-in-use') {
//                     print('The account already exists for that email.');
//                   }
//                 } catch (e) {
//                   print(e);
//                 }
//               },
//               child: const Text("Sign Up With Email"),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 print("signIn");
//                 try {
//                   final credential = await FirebaseAuth.instance
//                       .signInWithEmailAndPassword(
//                           email: "shady@gmail.com", password: "123sssssss45");
//                   print(credential);
//                 } on FirebaseAuthException catch (e) {
//                   if (e.code == 'user-not-found') {
//                     print('No user found for that email.');
//                   } else if (e.code == 'wrong-password') {
//                     print('Wrong password provided for that user.');
//                   }
//                 }
//               },
//               child: const Text("SignIn With Email"),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.signInAnonymously();
//                   print("Signed in with temporary account.");
//                 } on FirebaseAuthException catch (e) {
//                   switch (e.code) {
//                     case "operation-not-allowed":
//                       print(
//                           "Anonymous auth hasn't been enabled for this project.");
//                       break;
//                     default:
//                       print("Unknown error.");
//                       print(e);
//                   }
//                 }
//               },
//               child: const Text("signInAnonymously"),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.signOut();
//                   print("Sign Out");
//                 } on FirebaseAuthException catch (e) {
//                   switch (e.code) {
//                     case "operation-not-allowed":
//                       print(
//                           "Anonymous auth hasn't been enabled for this project.");
//                       break;
//                     default:
//                       print("Unknown error.");
//                       print(e);
//                   }
//                 }
//               },
//               child: const Text("Sign Out"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
