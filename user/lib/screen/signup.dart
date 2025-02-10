import 'package:flutter/material.dart';
import 'package:user/main.dart';
import 'package:user/screen/homepage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  List<Map<String, dynamic>> district = [];
  List<Map<String, dynamic>> place = [];

  Future<void> dis() async {
    try {
      print("District");
      final response = await supabase.from('tbl_district').select();
      print(response);
      setState(() {
        district = response;
      });
    } catch (e) {
      print("error $e");
    }
  }

  String? dist;

  Future<void> plc() async {
    try {
      print('Place');
      final responses = await supabase.from('tbl_place').select();
      print(responses);
      setState(() {
        place = responses;
      });
    } catch (e) {
      print('error $e');
    }
  }

  String? plac;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/sr.avif'), fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.white24,
                          filled: true,
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
                          fillColor: Colors.white24,
                          filled: true,
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
                          fillColor: Colors.white24,
                          filled: true,
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
                          fillColor: Colors.white24,
                          filled: true,
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
                          fillColor: Colors.white24,
                          filled: true,
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
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            fillColor: Colors.white24,
                            filled: true),
                        value: dist,
                        items: district.map((district) {
                          return DropdownMenuItem(
                              value: district['id'].toString(),
                              child: Text(district['district_name']));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dist = value!;
                          });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        fillColor: Colors.white24,
                        filled: true,
                      ),
                      value: plac,
                      items: place.map((place) {
                        return DropdownMenuItem(
                            value: place['id'].toString(),
                            child: Text(place['place_name']));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          plac = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white24,
                          filled: true,
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
                          fillColor: Colors.white24,
                          filled: true,
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
                          fillColor: Colors.white24,
                          filled: true,
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
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black38),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ));
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(color: Colors.red, fontSize: 30),
                        ))
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
