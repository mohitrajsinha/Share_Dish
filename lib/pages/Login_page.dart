
import 'package:share_dish/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/widgets/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool ChangeButton = false;
  final _formkey = GlobalKey<FormState>();

  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        ChangeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeroute);
      setState(() {
        ChangeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: [
              Image.network(
                "https://static.vecteezy.com/system/resources/previews/005/879/539/original/cloud-computing-modern-flat-concept-for-web-banner-design-man-enters-password-and-login-to-access-cloud-storage-for-uploading-and-processing-files-illustration-with-isolated-people-scene-free-vector.jpg",
                  
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter UserName",
                      labelText: "UserName",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "UserName cannot be empty";
                      }
                      return null;
                    },
                    onChanged: ((value) {
                      name = value;
                      setState(() {});
                    }),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Password length must be 6";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  Material(
                    borderRadius: BorderRadius.circular(ChangeButton ? 50 : 8),
                    color: MyTheme.lightBluishColor,
                    child: InkWell(
                      onTap: () => movetohome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: ChangeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: ChangeButton
                            ? const Icon(Icons.done, color: Colors.white)
                            : const Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeroute);
                  //   },
                  //   child: Text(
                  //     "Login",
                  //   ),
                  //   style: TextButton.styleFrom(minimumSize: Size(150, 50)),
                  // )
                ]),
              )
            ]),
          ),
        ));
  }
}
