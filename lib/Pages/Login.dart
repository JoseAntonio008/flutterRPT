import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<UserProvider>().isLoggedIn;

    if (isLoggedIn) {
      print(isLoggedIn);
      Future.microtask(
          () => {Navigator.pushReplacementNamed(context, '/home')});
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 200),
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
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SizedBox(
          width: 350,
          child: Column(
            children: [
              TextFormField(
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
              SizedBox(height: 20),
              TextFormField(
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
                width: 400,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      if (_formKey?.currentState!.validate() ?? false) {
                        context.read<UserProvider>().login();
                        print("${context.read<UserProvider>().isLoggedIn}");
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    child: Text("Login")),
              )
            ],
          ),
        ));
  }
}
