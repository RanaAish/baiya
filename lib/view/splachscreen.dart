import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:baiya/view/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class splachscreen extends StatefulWidget {
  @override
  _splachscreenState createState() => _splachscreenState();
}

class _splachscreenState extends State<splachscreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Get.offAll(home());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        Container(
            alignment: Alignment.center,child:
        SizedBox(
          height:200,
          width: 200,
          child:Image.asset('images/baiya3.jpg'),
        )));
  }
}
