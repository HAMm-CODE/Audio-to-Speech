import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/All Contents1.png"), fit: BoxFit.cover)),
            ),
          ),
          Center(
          child: Container(
            height: 400,
            width: 350,
            decoration: BoxDecoration(

            ),
            child: Text(
              "Mukasa Solutions Uganda\n"
                  "Contact: 0783610261 \n"
                  "email: mukasa@gmail.com",
            softWrap: true
            , style: TextStyle(fontSize: 25, color: Colors.white), ),
          ),
        ),]
      ),
    );
  }
}
