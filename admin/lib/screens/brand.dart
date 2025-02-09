import 'package:admin/main.dart';
import 'package:flutter/material.dart';

class Brand extends StatefulWidget {
  const Brand({super.key});

  @override
  State<Brand> createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController brand = TextEditingController();

  List<Map<String, dynamic>> fetchbrand = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  Future<void> insert() async {
    try {
      await supabase.from("tbl_brand").insert({'brand_name': brand.text});

      print("Entred successfully");
      fetchdata();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Entred Successfully')));
    } catch (e) {
      print("Error $e");

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error founded')));
    }
  }

  Future<void> fetchdata() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await supabase.from('tbl_brand').select();
      setState(() {
        isLoading = false;
        fetchbrand = response;
      });
    } catch (e) {
      print('error $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error')));
    }
  }

  Future<void> delete(int id) async {
    try {
      await supabase.from('tbl_brand').delete().eq('id', id);

      fetchdata();

      print('Deleted');

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Delete')));
    } catch (e) {
      print('error $e');
    }
  }

  int edit = 0;
  Future<void> update() async {
    try {
      await supabase
          .from('tbl_brand')
          .update({"brand_name": brand.text}).eq("id", edit);
      fetchdata();
      brand.clear();
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
        horizontal: 40,
      ),
      children: [
        Form(
            child: Center(
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: brand,
                decoration: InputDecoration(
                  hintText: 'Enter the Brand',
                  label: Text('Brand'),
                  fillColor: Colors.white,
                  filled: true,
                ),
              )),
              SizedBox(
                width: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (edit == 0) {
                      insert();
                    } else {
                      update();
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        )),
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
                  itemCount: fetchbrand.length,
                  itemBuilder: (context, index) {
                    final _brand = fetchbrand[index];
                    return ListTile(
                        leading: Text(
                          style: TextStyle(fontSize: 18),
                          _brand['brand_name'],
                        ),
                        trailing: SizedBox(
                          width: 80,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    delete(_brand['id']);
                                  },
                                  icon: Icon(Icons.delete_outline)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      brand.text = _brand['brand_name'];
                                      edit = _brand['id'];
                                    });
                                  },
                                  icon: Icon(Icons.edit))
                            ],
                          ),
                        ));
                  },
                ),
              )
      ],
    );
  }
}
