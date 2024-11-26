import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Pages/Home.dart';
import 'package:test_app/provider.dart';
import 'package:test_app/routes.dart';
import '../services/api_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 150,
            top: 20,
          ),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/spcLOGO.png',
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CustomForm()],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  _CustomForm createState() => _CustomForm();
}

class _CustomForm extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  final emailController = TextEditingController();
  final studentIdController = TextEditingController();
  final passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<UserProvider>().isLoggedIn;

    if (isLoggedIn) {
      print(isLoggedIn);
      Future.microtask(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => HomePage()),
          (route) => false, // Removes all previous routes
        );
      });
    }
    return Form(
        key: _formKey,
        child: SizedBox(
          width: 250,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your Email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: studentIdController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: "Student No."),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your Student No.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                    labelText: "password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your password";
                  }
                  return null;
                },
                obscureText: isObscure,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () async {
                      final provider =
                          Provider.of<UserProvider>(context, listen: false);
                      try {
                        if (_formKey.currentState?.validate() ?? false) {
                          print(isLoggedIn);
                          await provider.login(
                              emailController.text, passwordController.text);
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      } catch (e) {
                        Fluttertoast.showToast(
                          msg: e.toString(),
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          backgroundColor: Colors.redAccent,
                          textColor: Colors.white,
                          fontSize: 18,
                          timeInSecForIosWeb: 1
                        );
                        // print("error: $e");
                      }
                    },
                    child: Text("Login")),
              )
            ],
          ),
        ));
  }
}
