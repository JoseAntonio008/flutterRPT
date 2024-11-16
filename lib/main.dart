import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = "Real Property Tax";
    final _formKey = GlobalKey<FormState>();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 100),
              child: SizedBox(
                width: 300,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'images/spcLOGO.png',
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "email"),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter an Email";
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ToggleEyeIcon()
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: ElevatedButton(
                                            onPressed: () {
                                              try {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  print("submit");
                                                }
                                              } catch (error) {
                                                print(error);
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            child: const Text("login")))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ToggleEyeIcon extends StatefulWidget {
  @override
  _toggleEyeIcon createState() => _toggleEyeIcon();
}

class _toggleEyeIcon extends State<ToggleEyeIcon> {
  bool _isHidden = true;
  final _password = TextEditingController();

  @override
  void dispose(){
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  TextFormField(
      controller: _password,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: IconButton(onPressed: (){
            setState(() {
              _isHidden = !_isHidden;
            });
          }, icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off)),
          labelText: "password"),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter your Password";
        }
        return null;
      },
      obscureText: _isHidden,
      //validator here to add
    );
  }
}
