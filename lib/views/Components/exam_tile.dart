import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scorefunda/views/Constants.dart';

class Exam extends StatelessWidget {
  Exam(
      {super.key,
      required this.imgUrl,
      required this.ExamAgeCriteria,
      required this.ExamCost,
      required this.ExamDesciption,
      required this.ExamDuration,
      required this.ExamTitle});

  String imgUrl;
  String ExamTitle;
  String ExamDesciption;
  String ExamCost;
  String ExamDuration;
  String ExamAgeCriteria;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Container(
        height: 143,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        width: 370,
        child: Row(
          children: [
            Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 220,
                    child: Text(
                      ExamTitle,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 7,
                ),
                Container(
                  width: 220,
                  height: 85,
                  child: Text(
                    ExamDesciption,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black45),
                  ),
                ),
                Container(
                  width: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color(0xffdcd5f1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          ExamAgeCriteria,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.clock,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              ExamDuration,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          ExamCost,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
