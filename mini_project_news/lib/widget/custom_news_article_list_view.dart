import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/constant_text_style.dart';

class CustomNewsArticleListView extends StatefulWidget {
  const CustomNewsArticleListView({super.key});

  @override
  State<CustomNewsArticleListView> createState() => _CustomNewsArticleListViewState();
}

class _CustomNewsArticleListViewState extends State<CustomNewsArticleListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/general.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      'This is where the News Title will be Placed',
                      style: ConstantTextStyle.latoBold.copyWith(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      'This is where the News Description will be Placed',
                      style: ConstantTextStyle.latoReg.copyWith(color: Colors.black38, fontSize: 14),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
