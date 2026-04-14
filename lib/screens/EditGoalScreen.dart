import 'package:flutter/material.dart';
import 'package:myfirstapp/dialogs/testing.dart';
import 'package:myfirstapp/dialogs/withdrawSavingDialog.dart';
import 'package:myfirstapp/models/goal.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:myfirstapp/dialogs/addSavingDialog.dart';
import 'package:provider/provider.dart';
import 'package:myfirstapp/providers/GoalProvider.dart';
import 'package:myfirstapp/dialogs/editGoalDialog.dart';
import 'package:myfirstapp/method/editGoalMethod.dart';

class EditGoalScreen extends StatefulWidget {

  final int index;

  const EditGoalScreen({super.key,required this.index});

  @override
  State<EditGoalScreen> createState() => _EditGoalScreenState();
}

class _EditGoalScreenState extends State<EditGoalScreen> {




  @override
  Widget build(BuildContext context) {
    final goal = context.watch<GoalProvider>().goals[widget.index];
    final method = MethodEditGoal();
    
    print(method.gettingPercentage(goal));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("${goal.goalName}"),
        centerTitle: true,
        actions: [
          Padding(padding: EdgeInsets.only(right: 10),
          child: IconButton(onPressed: (){
            showDialog(context: context,
            builder: (_) => EditGoalDialog(index: widget.index),);
            print("Hello world");
          }, icon: Icon(Icons.edit_square)),),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 28,
                    spreadRadius: 0,
                    offset: Offset(0, 14),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.22),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 10),
                  )
                ]
            ),
            child:Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child:Padding(padding: EdgeInsets.all(10),
                      child: CircularPercentIndicator(
                        radius: 100.0,
                        lineWidth: 20,
                        percent: method.gettingPercentage(goal),
                        center: Image.asset('assets/milk-mocha.gif',width: 100,),
                        backgroundColor: Colors.redAccent,
                        progressColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Center(
                    child: Text('Saved',
                        style: TextStyle(fontSize: 18)),
                  ),
                  Center(
                    child: Text('${goal.currency} ${goal.goalProgress}',
                        style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Remaining',
                          style: TextStyle(fontSize: 18)),
                      Text('Goal Amount',
                          style: TextStyle(fontSize: 18))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(margin: EdgeInsets.only(right:40 ),
                      child: Text('${goal.currency} ${goal.goalRemaining!.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18,color: method.colorValidation(goal))),),
                      Padding(padding: EdgeInsets.only(right: 20),
                      child: Text('${goal.currency} ${goal.goalAmount!.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18),),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){
                        showDialog(context: context,
                            builder: (_) => AddSavingDialog(index: widget.index));
                      },
                        child: Text('Add Savings',
                          style: TextStyle(color: Colors.green),
                        ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[50]),),
                      ElevatedButton(onPressed: (){
                        showDialog(context: context,
                            builder: (_) => withdrawSavingDialog(index: widget.index));
                      },
                        child: Text('Withdraw Savings',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[100]),),
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
            ),
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(padding: EdgeInsets.only(right: 130),
                child: Text('Record History:',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                ),
              ),
              IconButton(onPressed: (){
                showDialog(context: context,
                    builder: (_) => EditGoalDialog(index: widget.index));
              }, icon: Icon(Icons.sort))
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 28,
                    spreadRadius: 0,
                    offset: Offset(0, 14),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.22),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 10),
                  )
                ]
            ),
            child: Center(child: Text('Under Construction pa po',
            style: TextStyle(fontSize: 24),),),

          ),


        ],

      ),

    );
  }
}