// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nectar_mac/data/Providers/product_provider.dart';

import 'data/Models/currency.dart';
import 'data/Models/department.dart';
import 'data/Models/product.dart';
import 'data/Providers/department_provider.dart';
import 'themes/app_theme.dart';
import 'views/screens/home/home_screen.dart';
import 'views/screens/product/product_details.dart';

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
      // home: const HomeScreen(),
      home: const ProductDetail(
        product: Product(
          name: "meet",
          image: "http://127.0.0.1:8000/media/images/Product/Beef_Bone.png",
          amount: 1,
          price: 5,
          currency: Currency(
            name: "D",
          ),
        ),
      ),
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

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Department>>(
            future: DepartmentApi().getAll(),
            builder: (context, snapshot) {
              print("snapshot.error : ${snapshot.error}");
              return Text(
                snapshot.data![0].name,
                style: const TextStyle(fontSize: 50),
              );
            }),
      ),
    );
  }
}
