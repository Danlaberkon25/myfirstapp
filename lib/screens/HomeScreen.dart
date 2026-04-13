import 'package:flutter/material.dart';
import 'package:myfirstapp/dialogs/addGoalDialog.dart';
import 'package:myfirstapp/providers/GoalProvider.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Container(
            height: 200,
            width: 310,
            child: Image.asset('assets/milk-and-mocha.gif'),
            
          ),
          ListTile(
            leading: const Icon(Icons.category, color: Colors.blueAccent),
            title: const Text('Projects'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.tag, color: Colors.blueAccent),
            title: const Text('Task'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  HomePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final goals = context.watch<GoalProvider>().goals;
    final provider = context.watch<GoalProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Dashboard',
          style: TextStyle(color: Colors.white,fontFamily: 'roboto',fontWeight: FontWeight.bold),),
        centerTitle: true,

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode),
            style: IconButton.styleFrom(
              backgroundColor: Colors.blue,
            ),),
        ],
      ),
      body: goals.isEmpty ? Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Padding(padding: EdgeInsets.only(top: 46),
              child: Image.asset('assets/milk-hi.gif'),),
            ),
            Center(child: Padding(padding: EdgeInsets.only(top: 40),
                child: Text("Seems like you are new, Let's create your first goal",
                  style: TextStyle(fontSize: 15),)),)
          ],
        )
      )
          : ListView.builder(
        itemCount: provider.goals.length,
        itemBuilder: (context,index){
          final goal = provider.goals[index];
        return Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(left: 10,right: 5,top: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/milk-hi.gif'),
                    radius: 30,
                  )
                    ,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(padding: EdgeInsets.only(left: 3, top: 3),
                        child: Text('Goal Name - ${goal.goalName}',
                        style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),),
                        Padding(padding: EdgeInsets.only(left: 3),
                        child: Text('Goal Remaining: ${goal.currency}${goal.goalRemaining}'),),
                        Padding(padding: EdgeInsets.only(left: 3),
                        child: Text('Goal Progress: ${goal.currency}${goal.goalProgress}'),),
                        Padding(padding: EdgeInsets.only(bottom: 3,left: 3),
                        child: Text('Goal Amount: ${goal.currency}${goal.goalAmount}'),
                        )],
                    ),
                  ),

                  Spacer(),
                  IconButton(onPressed: (){provider.RemoveGoal(goal.goalName!);}, icon: Icon(Icons.delete,color: Colors.blueAccent,),
                  ),

                ],
              ),
            ],
          ),
        );
      },
      ),
      floatingActionButton: Padding(padding: EdgeInsets.only(right: 20,bottom: 20),
        child: FloatingActionButton(onPressed: (){
          showDialog(
            context: context,
            builder: (_) => AddGoalDialog(),
          );
        },
          child: Icon(Icons.add),),),
    );
  }
}