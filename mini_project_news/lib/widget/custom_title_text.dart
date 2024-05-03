import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/text_style_constant.dart';

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "What's",
          style: TextStyleConstant.oswaldBold,
        ),
        Text(
          'NEWS',
          style: TextStyleConstant.oswaldBold.copyWith(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
