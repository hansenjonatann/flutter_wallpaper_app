import 'package:flutter/material.dart';
import 'package:flutter_walpaper/constants/color.dart';
import 'package:flutter_walpaper/controller/wallpaper_controller.dart';
import 'package:flutter_walpaper/pages/home.dart';
import 'package:flutter_walpaper/widgets/drawer.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  final WallpaperController _wallpaperController =
      Get.put(WallpaperController());

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
      ),
      drawer: MyDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Obx(() {
              return _wallpaperController.isLoading.value
                  ? Center(
                      child:
                          CircularProgressIndicator(color: ConstColor.appBlack),
                    )
                  : ListView.builder(
                      itemCount: _wallpaperController.collections.value.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              "${_wallpaperController.collections.value[index].title}"),
                        );
                      },
                    );
            })
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: [
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
                icon: Icon(Icons.collections)),
            label: 'Collections'),
      ]),
    );
  }
}
