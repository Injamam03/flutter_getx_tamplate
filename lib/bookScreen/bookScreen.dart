import 'package:flutter/material.dart';
import 'package:flutter_getx_tamplete/bookScreen/widget/pageFlipWidget.dart';
import 'package:get/get.dart';
import 'controller/bookController.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookController());

    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageFlipWidget(),
      ),
    );
  }
}