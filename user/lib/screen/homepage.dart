import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 250,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/ruky.jpg'),
                radius: 50,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Andu Sivan',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
        title: Text(
          "SportMart",
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              Card(
                child: Column(
                  children: [Text("Football ")],
                ),
              ),
              Card(
                child: Column(
                  children: [Text("Cricket")],
                ),
              ),
              Card(
                child: Column(
                  children: [Text("Batminton")],
                ),
              ),
              Card(
                child: Column(
                  children: [Text("Skating")],
                ),
              ),
              Card(
                  child: Column(
                children: [Text('Rope Games')],
              )),
              Card(
                  child: Column(
                children: [Text('Tennis')],
              ))
            ]),
      ),
    );
  }
}
