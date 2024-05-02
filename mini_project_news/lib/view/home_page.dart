import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/text_style_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsNEWS', style: TextStyleConstant.oswaldBold,),
        centerTitle: true,
      ),
    );
  }
}