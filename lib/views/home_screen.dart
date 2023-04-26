import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scorefunda/controller/home_screen_controller_provider.dart';
import 'package:provider/provider.dart';
import 'Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String id = "HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color SecondaryColor = Color(0xffDCD5F1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeScreenControllerProvider>(context, listen: false)
        .GetHomeScreen();
  }

  Widget GETEXAMWIDGET() {
    if (Provider.of<HomeScreenControllerProvider>(context, listen: false)
            .model
            .examTileList
            .length ==
        0) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          "\"No Data Available\"",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Consumer<HomeScreenControllerProvider>(
              builder: (context, controller, snapshot) {
            return ListView.builder(
              itemCount: controller.model.examTileList.length,
              itemBuilder: ((context, index) {
                return controller.model.examTileList[index];
              }),
            );
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: HomeScreenDrawer(context),
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              width: double.infinity,
              height: 270,
              color: kPrimaryColor,
            ),
            Container(
              padding: EdgeInsets.only(top: 9, left: 10, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // drwerbutton nd profile picture
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              icon: Icon(
                                FontAwesomeIcons.barsStaggered,
                                color: SecondaryColor,
                                size: 38,
                              ),
                              tooltip: MaterialLocalizations.of(context)
                                  .openAppDrawerTooltip,
                            );
                          },
                        ),
                        CircleAvatar(
                          radius: 23,
                          backgroundColor: kPrimaryColor,
                          backgroundImage: AssetImage("images/male.png"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    //grettings section
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Consumer<HomeScreenControllerProvider>(
                                builder: (context, controller, w) {
                              return Text(
                                controller.model.userName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              );
                            })
                          ]),
                    ),

                    SizedBox(
                      height: 19,
                    ),
                    //search bar and filter icon

                    Row(
                      children: [
                        // search bar and search icon
                        Container(
                          width: 320,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Row(children: [
                            // search icon

                            Icon(
                              Icons.search,
                              size: 30,
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            SizedBox(
                              width: 220,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search your favourite exams"),
                              ),
                            )
                            // Textfield
                          ]),
                        ),
                        IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.filter_alt),
                          iconSize: 38,
                          onPressed: () {
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          //Scorrable banner
                          SizedBox(
                            height: 260,
                            width: double.infinity,
                            child: Consumer<HomeScreenControllerProvider>(
                                builder: (context, controller, snapshot) {
                              return ListView.builder(
                                itemCount:
                                    controller.model.advertisementsList.length,
                                itemBuilder: (context, index) {
                                  return controller
                                      .model.advertisementsList[index];
                                },
                                scrollDirection: Axis.horizontal,
                              );
                            }),
                          ),

                          //Top Category heading
                          SizedBox(height: 9),
                          Text(
                            'Top Categories',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),

                          //Category btns
                          SizedBox(
                            height: 8,
                          ),

                          Container(
                            height: 40,
                            padding: EdgeInsets.symmetric(vertical: 4),
                            width: double.infinity,
                            child: Consumer<HomeScreenControllerProvider>(
                                builder: (context, controller, snapshot) {
                              return ListView.builder(
                                itemCount:
                                    controller.model.categoryButtonsList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return controller
                                      .model.categoryButtonsList[index];
                                },
                              );
                            }),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Recommended for you',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          Container(
                              height: MediaQuery.of(context).size.height * 0.38,
                              width: 70,
                              child: Consumer<HomeScreenControllerProvider>(
                                  builder: (context, controller, snapshot) {
                                return ListView.builder(
                                  itemCount:
                                      controller.model.courseTileList.length,
                                  itemBuilder: ((context, index) {
                                    // return RecommendedcourseList[index];
                                    return controller
                                        .model.courseTileList[index];
                                  }),
                                  scrollDirection: Axis.horizontal,
                                );
                              })),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Popular Exams',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          GETEXAMWIDGET(),
                          SizedBox(
                            height: 10,
                          ),
                          // exams list will be shown here
                        ],
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

Drawer HomeScreenDrawer(BuildContext context) {
  return Drawer(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            child: Image.asset('images/male.png'),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              // padding: EdgeInsets.only(left: 110),
              child: Consumer<HomeScreenControllerProvider>(
                  builder: (context, controller, snapshot) {
            return Text(
              "Hello, ${controller.model.userName}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            );
          })),
          Divider(
            thickness: 2,
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textbtn(text: "My Profile"),
                      Textbtn(text: "My Wallet"),
                      Textbtn(text: "My Quizes"),
                      Textbtn(text: "Connect History"),
                      Textbtn(text: "Change Password"),
                      Textbtn(
                        text: "Logout",
                      )
                    ],
                  )))
        ]),
  );
}

class Textbtn extends StatelessWidget {
  Textbtn({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: GestureDetector(
          child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      )),
    );
  }
}

class filterBtn extends StatelessWidget {
  const filterBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black,
    );
  }
}
