import 'package:flutter/material.dart';

class CategoryBtn extends StatelessWidget {
  CategoryBtn({super.key, required this.text, required this.onTap});

  String text;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: OutlinedButton(
        onPressed: onTap(),
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white30, shape: const StadiumBorder()),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
