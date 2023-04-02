import 'package:share_dish/pages/Signup_page.dart';
import 'package:share_dish/pages/cart_page.dart';
import 'package:share_dish/pages/home_page.dart';
import 'package:share_dish/pages/login_page.dart';
import 'package:share_dish/utils/routes.dart';
import 'package:share_dish/utils/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const myapp()));
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: MyTheme.LightTheme(context),
        darkTheme: MyTheme.DarkTheme(context),
        debugShowCheckedModeBanner: false,
        // initialRoute: "/signup",
        routes: {
          "/": ((context) => const SignupPage()),
          MyRoutes.homeroute: (context) => const HomePage(),
          MyRoutes.loginroute: (context) => const LoginPage(),
          MyRoutes.Cartroute: (context) => const CartPage(),
          MyRoutes.SignUProute: (context) => const SignupPage(),
        });
  }
}
