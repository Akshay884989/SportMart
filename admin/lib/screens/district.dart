import 'package:admin/components/formvalidator.dart';
import 'package:admin/main.dart';
import 'package:flutter/material.dart';

class District extends StatefulWidget {
  const District({super.key});

  @override
  State<District> createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _dis = TextEditingController();

  List<Map<String, dynamic>> fetchdistrict = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  Future<void> insert() async {
    try {
      await supabase.from("tbl_district").insert({"district_name": _dis.text});
      print("inserted");
      _dis.clear();
      fetchdata();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Data has inserted")));
    } catch (e) {
      print("error $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("error founded :$e")));
    }
  }

  Future<void> fetchdata() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await supabase.from("tbl_district").select();
      setState(() {
        fetchdistrict = response;
        isLoading = false;
      });
    } catch (e) {
      print("error");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("error")));
    }
  }

  Future<void> delete(int id) async {
    try {
      await supabase.from("tbl_district").delete().eq('id', id);
      fetchdata();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Deleted")));
    } catch (e) {
      print('Error $e');
    }
  }

  int edit = 0;
  Future<void> update() async {
    try {
      await supabase
          .from('tbl_district')
          .update({"district_name": _dis.text}).eq("id", edit);
      fetchdata();
      _dis.clear();
      setState(() {
        edit = 0;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 30,
      ),
      children: [
        Form(
          key: formKey,
          child: Center(
            child: Row(
              children: [
                // Text(
                //   "District",
                //   style: TextStyle(fontSize: 40),
                // ),
                Expanded(
                  child: TextFormField(
                    validator: (value) => FormValidation.validateDataCustom(
                        value, 'Please Enter District'),
                    controller: _dis,
                    decoration: InputDecoration(
                      label: Text("District"),
                      hintText: 'Enter the District',
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (edit == 0) {
                          insert();
                        } else {
                          update();
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(193, 14, 14, 13),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : Container(
                color: Colors.white38,
                padding: EdgeInsets.all(20),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  shrinkWrap: true,
                  itemCount: fetchdistrict.length,
                  itemBuilder: (context, index) {
                    final _district = fetchdistrict[index];
                    return ListTile(
                      leading: Text(
                        style: TextStyle(fontSize: 18),
                        _district['district_name'],
                      ),
                      trailing: SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  delete(_district['id']);
                                },
                                icon: Icon(Icons.delete_outline)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _dis.text = _district['district_name'];
                                    edit = _district['id'];
                                  });
                                },
                                icon: Icon(Icons.edit))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
      ],
    );
  }
}
