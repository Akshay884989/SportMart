import 'package:flutter/material.dart';
import 'package:user/formvalidation/formvalidator.dart';
import 'package:user/screen/homepage.dart';

class Userlogin extends StatefulWidget {
  const Userlogin({super.key});

  @override
  State<Userlogin> createState() => _UserloginState();
}

class _UserloginState extends State<Userlogin> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Form(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Center(
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value) => FormValidation.validateEmail(
                        value,
                      ),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter the email',
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: 'Email',
                        suffixIcon: Icon(
                          Icons.alternate_email_outlined,
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        fillColor: Colors.white,
                        filled: false,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      validator: (value) => FormValidation.validatePassword(
                        value,
                      ),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter the password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        label: Text('Password'),
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isObscure,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ));
                        },
                        child: Text('Login'))
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
