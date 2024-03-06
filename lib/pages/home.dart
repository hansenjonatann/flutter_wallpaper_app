import 'package:flutter/material.dart';
import 'package:flutter_walpaper/constants/color.dart';
import 'package:flutter_walpaper/pages/category.dart';
import 'package:flutter_walpaper/pages/walpper_detail.dart';
import 'package:flutter_walpaper/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          icon: Icon(
            Icons.menu,
            color: ConstColor.appBlack,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 4,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 12,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WalpaperDetail(
                                imageUrl:
                                    'https://picsum.photos/id/${index + 20}/200/300')));
                      },
                      child: Container(
                        height: 160.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://picsum.photos/id/${index + 20}/200/300",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
