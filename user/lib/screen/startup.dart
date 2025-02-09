import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user/screen/login.dart';
import 'package:user/screen/signup.dart';

class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black26,
            image: DecorationImage(image: AssetImage('assets/fot.jpg'))),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Userlogin(),
                        ));
                  },
                  child: Text('Login',
                      style: GoogleFonts.adamina(
                          fontSize: 55, color: Colors.black))),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signup(),
                        ));
                  },
                  child: Text('Signup',
                      style: GoogleFonts.adamina(
                          fontSize: 55, color: Colors.black))),
            ],
          ),
        ),
      ),
    ));
  }
}
