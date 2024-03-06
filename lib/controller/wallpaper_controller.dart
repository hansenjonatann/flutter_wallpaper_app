import 'dart:io';

import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class WallpaperController {
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
