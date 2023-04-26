import 'package:flutter/material.dart';
import 'package:scorefunda/views/Constants.dart';

class Course extends StatelessWidget {
  Course(
      {super.key,
      required this.CourseAgeCriteria,
      required this.CourseDescription,
      required this.CourseTitle,
      required this.ImgUrl,
      required this.CourseConnects,
      required this.CourseDuration});

  String ImgUrl =
      "http://scorefunda.nullplex.co.in/uploads/banner/9882b190-b424-4a78-827b-4dd865443a7c-20220421054303.jpeg";
  String CourseTitle = "this is a title of Course";
  String CourseDescription = "this is a description of the page";
  String CourseAgeCriteria = "8 - 10yrs";
  String CourseConnects = "25 Connects";
  String CourseDuration = "45 min.";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      constraints: BoxConstraints(maxWidth: 300, maxHeight: 220),
      decoration: BoxDecoration(
          boxShadow: [kBoxShadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              width: 350,
              height: 150,
              child: Image.network(
                ImgUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              child: Text(
                CourseTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              width: double.infinity,
              child: Text(
                CourseDescription,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "$CourseAgeCriteria Age",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kPrimaryColor),
                      ),
                    ),
                    Container(
                      child: Row(children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5,
                        ),
                        Text(CourseDuration)
                      ]),
                    ),
                    Text("$CourseConnects Connects")
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
