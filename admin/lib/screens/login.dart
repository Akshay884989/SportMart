import 'package:admin/components/formvalidator.dart';
import 'package:admin/screens/dashboard.dart';
import 'package:admin/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  void signin() async {
    try {
      String email = _email.text;
      String pass = _pass.text;
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: pass,
      );
      final User? user = res.user;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      }
      print("Sigin Success");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error")),
      );
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/csprt.webp"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    Column(
                      children: [],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 40,
                    ),
                      TextFormField(
                      validator: (value) => FormValidation.validateEmail(
                        value, 
                      ),
                      controller: _email,
                      decoration: InputDecoration(
                        fillColor: Colors.white60,
                        filled: true,
                        hintText: "Enter your email",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    TextFormField(
                      validator: (value) => FormValidation.validatePassword(
                        value,
                      ),
                      controller: _pass,
                      decoration: InputDecoration(
                        fillColor: Colors.white60,
                        filled: true,
                        hintText: "Enter your pass",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => Dashboard(),
                    //         ),
                    //       );
                    //     },
                    //     child: Text("Sign In")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white54,
                        ),
                        onPressed: () {
                          signin();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sigin",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
