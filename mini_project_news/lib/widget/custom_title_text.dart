import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/constant_text_style.dart';

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "What's",
          style: ConstantTextStyle.oswaldBold,
        ),
        Text(
          'NEWS',
          style: ConstantTextStyle.oswaldBold.copyWith(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
