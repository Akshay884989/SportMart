import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter your full name',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          label: Text('Full name'),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          label: Text('Email'),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter your DOB',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          label: Text('DOB'),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter your Contact',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          label: Text('Contact'),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter your Address',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          label: Text('Address'),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Photo Please',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          label: Text('Photo'),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter your Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          label: Text('Password'),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          label: Text('Confirm Password'),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Signup'))
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
