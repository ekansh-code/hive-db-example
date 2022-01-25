import 'package:flutter/material.dart';


class NoDataFound extends StatelessWidget {
  final bool isSomethingWentWrong;
  final String text;
  final Color backGroundColor;
  NoDataFound({
    this.text = 'No data found',
    this.isSomethingWentWrong = false,
    this.backGroundColor = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGroundColor,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          isSomethingWentWrong ? "Something Went Wrong" : text,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 25,
            // fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
