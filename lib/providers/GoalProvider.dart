import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:myfirstapp/models/goal.dart';

class GoalProvider with ChangeNotifier {
  List<Goal> _goals = [];

  List<Goal> get goals => _goals;


  void AddGoal(Goal goal){
    _goals.add(goal);
    notifyListeners();
  }

  void RemoveGoal(String goalName) {
    _goals.removeWhere((goal) => goal.goalName == goalName);
    notifyListeners();
  }
}