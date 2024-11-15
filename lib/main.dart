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
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "password"),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please Enter your Password";
                                          }
                                          return null;
                                        },
                                        //validator here to add
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
                                        child: ElevatedButton(
                                            onPressed: () {
                                              try {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  print("submittted");
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
