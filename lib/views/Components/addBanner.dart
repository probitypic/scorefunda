import 'package:flutter/material.dart';

class advertisementBanner extends StatelessWidget {
  advertisementBanner({super.key, required this.bnnerUrl});

  String bnnerUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        // clipBehavior: Clip.hardEdge,
        child: SizedBox.fromSize(
          size: Size.fromRadius(190),
          child: Image(
            image: NetworkImage(bnnerUrl),
          ),
        ),
      ),
    );
  }
}
