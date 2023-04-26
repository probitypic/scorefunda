import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:scorefunda/Services/get_home_screen_api.dart';
import 'package:scorefunda/models/home_screen_model.dart';
import 'package:scorefunda/views/Components/addBanner.dart';
import 'package:scorefunda/views/Components/categoryButton.dart';
import 'package:scorefunda/views/Components/course.dart';
import 'package:scorefunda/views/Components/exam_tile.dart';
import 'package:http/http.dart' as http;

class HomeScreenControllerProvider extends ChangeNotifier {
  HomeScreenModel model = HomeScreenModel();
  GetHomeScreenApis apis = GetHomeScreenApis();

  AddToBannerList(advertisementBanner banner) {
    model.advertisementsList.add(banner);
    notifyListeners();
  }

  AddToCategoryButtonList(CategoryBtn btn) {
    model.categoryButtonsList.add(btn);
    notifyListeners();
  }

  addToCourseTileList(Course course) {
    model.courseTileList.add(course);
    notifyListeners();
  }

  addToExamTileList(Exam exam) {
    model.examTileList.add(exam);
    notifyListeners();
  }

  Future<void> GetAdvertisementBanners() async {
    try {
      http.Response res = await apis.getBanner();
      if (res.statusCode == 200) {
        List<dynamic> data = jsonDecode(res.body)["data"];

        for (int i = 0; i < data.length; i++) {
          String BannerUrl = data[i]["FilePath"];
          AddToBannerList(advertisementBanner(bnnerUrl: BannerUrl));
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> GetCategoryButtons() async {
    try {
      http.Response res = await apis.getCategories();
      if (res.statusCode == 200) {
        List<dynamic> DataList = jsonDecode(res.body)["data"];

        for (int i = 0; i < DataList.length; i++) {
          AddToCategoryButtonList(
              CategoryBtn(text: DataList[i]["CatergoryName"], onTap: () {}));
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> GetExamsList() async {
    try {
      http.Response res = await apis.getQuizes();
      if (res.statusCode == 200) {
        List<dynamic> examdatalist = jsonDecode(res.body)["data"];

        for (int i = 0; i < examdatalist.length; i++) {
          String Url = examdatalist[i]["filepath"];
          String Title = examdatalist[i]["name"];
          String Desciption = examdatalist[i]["Description"];
          String Cost = examdatalist[i]["ConnectsFees"];
          String AgeCriteria = examdatalist[i]["agerang"];
          String Duration = examdatalist[i]["Duration"];

          addToExamTileList(Exam(
            imgUrl: Url,
            ExamTitle: Title,
            ExamDesciption: Desciption,
            ExamCost: Cost,
            ExamDuration: Duration,
            ExamAgeCriteria: AgeCriteria,
          ));
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> GetRecommendedQuizes() async {
    try {
      http.Response res = await apis.getRecommendedQuizes();
      if (res.statusCode == 200) {
        List<dynamic> CourseData = jsonDecode(res.body)["data"];

        for (int i = 0; i < CourseData.length; i++) {
          String BannerUrl = CourseData[i]["filepath"];
          String Title = CourseData[i]["name"];
          String Description = CourseData[i]["Description"];
          String Fees = CourseData[i]["ConnectsFees"];
          String Duration = CourseData[i]["Duration"];
          String AgeRange = CourseData[i]["agerang"];

          addToCourseTileList(Course(
            CourseAgeCriteria: AgeRange,
            CourseDescription: Description,
            CourseTitle: Title,
            ImgUrl: BannerUrl,
            CourseConnects: Fees,
            CourseDuration: Duration,
          ));
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> GetUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    model.userName = pref.getString("username").toString();
  }

  Future<void> GetHomeScreen() async {
    await GetAdvertisementBanners();
    await GetCategoryButtons();
    await GetExamsList();
    await GetRecommendedQuizes();
    await GetUserName();
  }
}
