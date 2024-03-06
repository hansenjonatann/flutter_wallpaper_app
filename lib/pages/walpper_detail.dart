import 'package:flutter/material.dart';
import 'package:flutter_walpaper/constants/color.dart';
import 'package:flutter_walpaper/controller/wallpaper_controller.dart';

class WalpaperDetail extends StatelessWidget {
  WalpaperDetail({super.key, required this.imageUrl});
  final String imageUrl;

  final WallpaperController _wallpaperController = WallpaperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "${imageUrl}",
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: InkWell(
              onTap: () {
                _wallpaperController.setWallpaper(imageUrl);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Success'),
                      content: Text('Wallpaper has been set successfully.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 80,
                width: 300,
                decoration: BoxDecoration(
                  color: ConstColor.appWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Set Wallpaper',
                      style: TextStyle(
                          color: ConstColor.appBlack,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Icon(
                      Icons.format_paint,
                      size: 36,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
