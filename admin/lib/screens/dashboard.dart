import 'package:admin/screens/brand.dart';
import 'package:admin/screens/category.dart';
import 'package:admin/screens/district.dart';
import 'package:admin/screens/place.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  List<String> pageName = [
    'District',
    'Category',
    'Brand',
    'Place',
  ];

  List<IconData> pageIcon = [
    Icons.location_city,
    Icons.catching_pokemon,
    Icons.branding_watermark_rounded,
    Icons.place,
  ];

  List<Widget> pageContent = [
    District(),
    Category(),
    Brand(),
    Place(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Admin Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        leading: Image.asset("assets/spide.jpg"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/sport1.jpg"), fit: BoxFit.cover)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: const Color.fromARGB(186, 0, 0, 0),
                child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: pageName.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          print(index);
                          selectedIndex = index;
                        });
                      },
                      leading: Icon(
                        pageIcon[index],
                        color: const Color.fromARGB(255, 230, 9, 9),
                        size: 24,
                      ),
                      title: Text(
                        pageName[index],
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: pageContent[selectedIndex],
              ),
            )
          ],
        ),
      ),
    );
  }
}
