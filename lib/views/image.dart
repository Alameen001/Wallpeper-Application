import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/models/wallpeper_model.dart';

class ImageView extends StatefulWidget {
  ImageView({Key? key, required this.imageviews, required this.initialindex})
      : super(key: key);
  List<Photos?> imageviews;
  int initialindex;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  Future<void> setWalpapper(String imagePath) async {
    var file = await DefaultCacheManager().getSingleFile(imagePath);

    await WallpaperManager.setWallpaperFromFile(
        file.path, WallpaperManager.BOTH_SCREEN);
  }

  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: widget.initialindex);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Set Wallpeper"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setWalpapper(
                    widget.imageviews[controller.initialPage]!.src!.large!);
                Fluttertoast.showToast(
                  msg: "Wallpepr added",
                );
              },
              icon: Icon(Icons.done))
        ],
      ),
      body: PageView.builder(
          itemCount: widget.imageviews.length,
          controller: controller,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(widget.imageviews[index]!.src!.large2x!),
                      fit: BoxFit.cover)),
            );
          }),
    );
  }
}
