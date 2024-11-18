import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBar(
            elevation: 10,
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurpleAccent,
            automaticallyImplyLeading: false,
            title: Text("Profile"),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "images/spcLOGO.png",
            height: 70,
            width: 70,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Juan Dela Cruz"),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      context.read<UserProvider>().logout();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      // Ensures the Row doesn't take up more space than needed
                      children: [
                        Text("Logout"),
                        SizedBox(width: 8),
                        Icon(size: 20, Icons.logout)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("here")],
              ),
            ],
          )
        ],
      ),
    );
  }
}
