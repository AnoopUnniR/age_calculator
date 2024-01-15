import 'package:age_calculator/model/age.dart';
import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier {
  bool isCalenderVisible = false;
  DateTime selectedDate = DateTime.now();
  Age ageModel = Age(year: 0, month: 0);


//this function uupdates the calender date picker
  void updateCalender(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }


//this function updates the age to show in the ui
  void updateSelectedDate(DateTime newDate) {
    DateTime currentDate = DateTime.now();

    int years = currentDate.year - newDate.year;
    int months = currentDate.month - newDate.month;

    if (currentDate.day < newDate.day) {
      months--;
    }
    if (months < 0) {
      years--;
      months += 12;
    }
    ageModel = Age(year: years, month: months);
    notifyListeners();
  }
}
