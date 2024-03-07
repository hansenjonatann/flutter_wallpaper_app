import 'dart:convert';
import 'dart:io';

import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_walpaper/models/wallpaper_collection.dart';
import 'package:flutter_walpaper/models/walpaper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class WallpaperController extends GetxController {
  Rx<List<WallpaperModel>> wallpapers = Rx<List<WallpaperModel>>([]);
  Rx<List<WallpaperCollectionModel>> collections =
      Rx<List<WallpaperCollectionModel>>([]);
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWallpapers();
    fetchCollections();
  }

  Future fetchWallpapers() async {
    try {
      isLoading.value = true;
      var response = await http.get(
          Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
          headers: {
            "Authorization":
                "fSxsTQYI5HuZYQfQ6yfIPu4pOkLeK3pFruDAwmA4qVM6aY17eqPt3tLe",
          });

      if (response.statusCode == 200) {
        isLoading.value = false;
        var result = json.decode(response.body);

        for (var item in result['photos']) {
          wallpapers.value.add(WallpaperModel.fromJson(item));
          // print(item);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future fetchCollections() async {
    try {
      isLoading.value = true;
      final response = await http.get(
          Uri.parse('https://api.pexels.com/v1/collections/featured'),
          headers: {
            "Authorization":
                "fSxsTQYI5HuZYQfQ6yfIPu4pOkLeK3pFruDAwmA4qVM6aY17eqPt3tLe",
          });

      if (response.statusCode == 200) {
        isLoading.value = false;
        for (var item in json.decode(response.body)['collections']) {
          collections.value.add(WallpaperCollectionModel.fromJson(item));
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future setWallpaper(String imageUrl) async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      String localPath = directory.path;

      // Mendownload gambar dari URL
      http.Response response = await http.get(Uri.parse(imageUrl));
      File imageFile = File('$localPath/image.jpg');
      await imageFile.writeAsBytes(response.bodyBytes);

      // Menetapkan gambar sebagai wallpaper
      int wallpaperLocation = WallpaperManager.HOME_SCREEN;
      await WallpaperManager.setWallpaperFromFile(
        imageFile.path,
        wallpaperLocation,
      );

      print('sukses');
    } catch (e) {
      print(e.toString());
    }
  }
}
