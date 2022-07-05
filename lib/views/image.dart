import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/wallpeper_model.dart';

class ImageView extends StatefulWidget {
   ImageView({ Key? key,required this.imageviews , required this.initialindex}) : super(key: key);
  List<Photos?> imageviews;
  int initialindex;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
 late PageController controller;

  @override
  void initState() {
    
     controller = PageController(initialPage: widget.initialindex);
    
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount:widget.imageviews.length ,
          controller: controller,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.imageviews[index]!.src!.large2x!),fit: BoxFit.cover)
              ),

            );
          }
        ),
        
      ),
    );
  }
}