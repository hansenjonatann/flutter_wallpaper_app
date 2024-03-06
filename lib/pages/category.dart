import 'package:flutter/material.dart';
import 'package:flutter_walpaper/constants/color.dart';
import 'package:flutter_walpaper/pages/home.dart';
import 'package:flutter_walpaper/widgets/drawer.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.appWhite,
      appBar: AppBar(
        backgroundColor: ConstColor.appWhite,
        centerTitle: true,
        title: Text(
          'Walpaper',
          style: TextStyle(color: ConstColor.appBlack),
        ),
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu, color: ConstColor.appBlack),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: ConstColor.appBlack))
        ],
      ),
      drawer: MyDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Builder(builder: (context) {
              List categories = [
                {
                  "label": "Travel",
                  "image":
                      "https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                },
                {
                  "label": "Main Course",
                  "image":
                      "https://images.unsplash.com/photo-1593253787226-567eda4ad32d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
                },
                {
                  "label": "Drink",
                  "image":
                      "https://images.unsplash.com/photo-1527661591475-527312dd65f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=415&q=80",
                },
                {
                  "label": "Snack",
                  "image":
                      "https://images.unsplash.com/photo-1580314552228-5a7ce023fc9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=388&q=80",
                },
              ];

              return ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = categories[index];
                  return Container(
                    height: 300.0,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          item["image"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 85,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            child: Center(
                              child: Text(
                                item["label"],
                                style: TextStyle(
                                  fontSize: 32.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(Icons.home)),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => CategoryPage()));
                },
                icon: Icon(Icons.category)),
            label: 'Category'),
        BottomNavigationBarItem(
            icon: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            label: 'Account'),
      ]),
    );
  }
}
