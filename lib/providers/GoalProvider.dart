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

  void RemoveGoal(goal){
    _goals.remove(goal);
    notifyListeners();
  }

  void AddSavings(int index,int amount){
    _goals[index].goalProgress += amount;
    _goals[index].goalRemaining -= amount;
    notifyListeners();
  }

  void WithdrawSavings(int index,int amount){
    _goals[index].goalProgress -= amount;
    _goals[index].goalRemaining += amount;
    notifyListeners();
  }

  void UpdateGoal(int index,String name,int amount,String note,String currency){
    _goals[index].goalName = name;
    _goals[index].goalAmount = amount;
    _goals[index].goalRemaining = amount;
    _goals[index].note = note;
    _goals[index].currency = currency;
    notifyListeners();
  }
}
