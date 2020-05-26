import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:trust/models/Goal.dart';
import 'package:trust/screens/CalanderScreen.dart';
import 'package:trust/screens/DetailScreen.dart';
import 'package:trust/utils/Animations.dart';
import 'package:trust/utils/GoalDatabase.dart';
import 'package:trust/utils/TaskDatabase.dart';
import '../UI.dart';
import 'CreateTaskScreen.dart';
import '../models/Task.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class GoalContainer extends StatefulWidget
{
  String name; int amount; String duedate; String description; bool first; bool last;
  GoalContainer({this.name, this.amount, this.duedate, this.description, this.first, this.last});
  
  _GoalContainer createState() => _GoalContainer();
}
class _GoalContainer extends State<GoalContainer>
{
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width; double h = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment(-.75, 0),
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        height: 140,
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              alignment: Alignment(.35, 0),
              child: Column(
                children: <Widget>[
                  Icon(widget.first ? Icons.error_outline : Icons.adjust, size: 22, color: Colors.white,),
                  widget.last ? Container(width: 2.2) : 
                          Expanded(child: Container(margin: EdgeInsets.only(top: 4), width: 2.2, color: Colors.white,)) 
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 126,
                  padding: EdgeInsets.fromLTRB(16, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              height: 25, 
                              /* color: Colors.red, */
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Black',
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              alignment: Alignment.topLeft,
                              /* color: Colors.blue, */
                              child: Text(
                                widget.description,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              /* color: Colors.blue, */
                              alignment: Alignment.topLeft,
                              child: Text(
                                'the lorem iptsum charity foundation',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Container(
                              /* color: Colors.blue, */
                              alignment: Alignment.center,
                              height: 25, 
                              child: Text(
                                widget.duedate,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              /* color: Colors.red, */
                              alignment: Alignment(0, -.10),
                              child: Text(
                                "\$"+(widget.amount.toString()),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF3A3D40),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 30,
                              width: 50,
                              child: Icon(Icons.check, color: Color.fromRGBO(254, 249, 205, 1),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 28,
              /* color: Colors.red, */
              alignment: Alignment(.35, 0),
            ),
          ],
        ),
      ),
    );
  }
}

typedef void TaskCallback(int state);
class TaskContainer extends StatefulWidget
{
  TaskCallback taskCallback;
  String name; String duedate; int state; int level;
  TaskContainer({this.name, this.duedate, this.state, this.level, this.taskCallback});
  
  _TaskContainer createState() => _TaskContainer();
}
class _TaskContainer extends State<TaskContainer>
{
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width; double h = MediaQuery.of(context).size.height;
    bool checked = widget.state == 1 ? true : false;
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 330,
        margin: EdgeInsets.only(bottom: 14),
        child: Row(
          children: <Widget>[
            checked ? Container(
              alignment: Alignment(-.25, 0),
              width: 44, 
              height: 56,
              child: GestureDetector(
                onTap: () => widget.taskCallback(1),
                child: Icon(Icons.close, color: Colors.white, size: 32,),
              ),
            )
            : Container(),
            Expanded(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
                height: 56,
                decoration: new BoxDecoration(
                  color: checked ? Color.fromRGBO(255, 255, 255, .5) : Color(0xFFFFFFFF),
                  borderRadius: new BorderRadius.all(Radius.circular(8)),
                ),
                padding: EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>
                  [
                    Container(
                      padding: EdgeInsets.only(left: 4, right: 2),
                      child: Checkbox(
                        onChanged: (value) {widget.taskCallback(0);},
                        value: (checked) ? true : false,
                        checkColor: Colors.white,
                        activeColor: Color(0xFF707070),
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            color: Color(0xFF707070), 
                            fontSize: 22,
                            fontFamily: 'Roboto-Medium',
                            height: 1,
                            decoration: checked ? TextDecoration.lineThrough : TextDecoration.none,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ); 
  }
}

typedef void HeaderCallBack(int tab);
class Header extends StatefulWidget
{
  HeaderCallBack onTabChange; double tab;
  Header({this.onTabChange, this.tab});
  @override
  _Header createState() => _Header();
}
class _Header extends State<Header>
{
  String date; String time;

  @override
  void initState() 
  {
    date = DateFormat('EEEE, MMMM d').format(DateTime.now());
    time = DateFormat('h:mm a').format(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }
  void _getTime()
  {
    setState(() 
    {
      date = DateFormat('EEEE, MMMM d').format(DateTime.now());
      time = DateFormat('h:mm a').format(DateTime.now());
    });
  }

  Widget build(BuildContext context)
  {
    double thistab = widget.tab;
    double w = MediaQuery.of(context).size.width;
    
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE8E9EB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(40, 30),
          bottomRight: Radius.elliptical(40, 30),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: w,
            height: 115,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                bottomLeft: Radius.elliptical(40, 30),
                bottomRight: Radius.elliptical(40, 30),
              )
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(time, style: TextStyle(fontSize: 36)),
                  ),
                  Center(
                    child: Text(date, style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 34,
            width: 345,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 115,
                  child: GestureDetector(
                    child: Container(child: Text("goals", style: TextStyle(fontSize: 20))),
                    onTap: () {widget.onTabChange(-1);},
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 115,
                  child: GestureDetector(
                    child: Container(child: Text("to-do", style: TextStyle(fontSize: 20))),
                    onTap: () {widget.onTabChange(0);},
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 115,
                  child: GestureDetector(
                    child: Container(child: Text("teams", style: TextStyle(fontSize: 20))),
                    onTap: () {widget.onTabChange(1);},
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            width: 345,
            duration: Duration(milliseconds: 90),
            curve: Curves.ease,
            alignment: Alignment(thistab, 0),
            child: Container(
              height: 6,
              width: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.elliptical(300, 200), topRight: Radius.elliptical(300, 200)),
                color: Color(0xFF3A3D40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget
{
  @override
  _Body createState() => _Body();
}
class _Body extends State<Body>
{
  TaskDatabase taskDatabase = TaskDatabase();
  GoalDatabase goalDatabase = GoalDatabase();
  List<Task> taskList;
  List<Goal> goalList;
  int taskSize = 0; int goalSize; 
  double _tab = 0;
  PageController _pageController;
  double completed = 0;
  void initState()
  {
    _pageController = PageController(initialPage: _tab.toInt() + 1,)..addListener(_updateTab);
    super.initState();
  }
  void _delete(Task task) async
  {
    await taskDatabase.deleteTask(task.id);
    print("deleted");
    _update();
  }
  void _create() async
  {
    var result = await Navigator.push(context, fadeRoute(CreateScreen()));
    if (result[0] == true) 
    {
      Task newTask = new Task(result[1],result[2],result[3],result[4]);
      taskDatabase.insertTask(newTask);
      _update();
    }
  }
  void _update()
  {
    final Future<Database> db = taskDatabase.initializeDatabase();
    db.then((database) 
      {
        Future<List<Task>> taskListFuture = taskDatabase.getTasksList();
        taskListFuture.then((taskList)
          {
            setState(() 
            {
              this.taskList = taskList;
				      this.taskSize = taskList.length;
            });
          }
        );
      }
    );
  }
  void _updateGoals()
  {
    final Future<Database> db = goalDatabase.initializeDatabase();
    db.then((database) 
      {
        Future<List<Goal>> goalListFuture = goalDatabase.getGoalsList();
        goalListFuture.then((goalList)
          {
            setState(() 
            {
              this.goalList = goalList;
				      this.goalSize = goalList.length;
            });
          }
        );
      }
    );
  }
  void _updateTab()
  {
    setState(() {_tab = _pageController.page - 1;});
  }
  void _changeTab(int tab)
  {
    setState(() 
    {
      int time = tab - _tab.abs() > 1 ? 600 : 400;
      _pageController.animateToPage(tab + 1, duration: Duration(milliseconds: time), curve: Curves.ease,);
    });
  } 
  Column _getTodos(BuildContext context)
  {
    double percent = completed == 0 || taskSize == 0 ? 0 : completed / taskSize;
    double w = MediaQuery.of(context).size.width;
    void _changeState(Task task) async
    {
      print("changing");
      task.state = (task.state == 1) ? 0 : 1;
      await taskDatabase.updateTask(task);
      _update();
    }
    ListView getTodos()
    {
      if (taskSize == 0 || taskSize == null)
        return ListView.builder(itemBuilder: (BuildContext context, int position) {});
      completed = 0;
      return ListView.builder(
        padding: EdgeInsets.only(top: 18),
        physics: BouncingScrollPhysics(),
        itemCount: taskSize,
        itemBuilder: (BuildContext context, int position)
        {
          if (taskList[position].state == 1) {completed++; percent = completed / taskSize;}
          return TaskContainer(
            name: taskList[position].name, 
            duedate: "<date>",
            state: taskList[position].state ?? 0,
            level: 0,
            taskCallback: (state)  =>  state == 0 ?_changeState(taskList[position]) : _delete(taskList[position]),
          );
        }
      );
    }
    Container getProgress()
    {
      completed = 0;
      for (int position = 0; position < taskSize; position++)
      {
        if (taskList[position].state == 1) {completed++; percent = completed / taskSize;}
      }
      _update();
      return Container(
        width: w * .8,
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 18),
          child: Row(
            children: <Widget>[
              Container(
                width: w * .8 * .88,
                height: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    value: percent,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                height: 18,
                width: w * .8 * .12,
                child: Text(''+((percent * 100).toInt()).toString()+'%', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      );
    }
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          child: getProgress(),
        ),
        Expanded(
          child: getTodos(),
        ),
      ],
    );
  }
  Column _getGoals(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    ListView getGoals()
    {
      if (goalSize == 0 || goalSize == null)
        return ListView.builder(itemBuilder: (BuildContext context, int position) {});

      return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        physics: BouncingScrollPhysics(),
        itemCount: goalSize,
        itemBuilder: (BuildContext context, int position)
        {
          return GoalContainer(
            name: goalList[position].name,
            description: goalList[position].description,
            duedate: goalList[position].date,
            amount: goalList[position].amount,
            first: position == 0 ? true : false,
            last: position == (goalSize - 1) ? true : false,
          );
        }
      );
    }
    Container getBalance()
    {
      return Container(
        padding: EdgeInsets.only(top:18, bottom: 18),
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white, 
          ),
          width: 360,
          height: 55,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                width: 100,
                child: Column(
                  children: <Widget>[
                    Center(child: Text("details", style: TextStyle(fontSize: 16))),
                    Icon(Icons.description),
                  ],
                ),
              ),
              Container(
                width: 160,
                padding: EdgeInsets.only(top: 6),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFE8E9EB),),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Center(child: Text("amount due", style: TextStyle(fontSize: 16))),
                    Center(child: Text("\$0", style: TextStyle(fontSize: 20))),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 100,
                child: Column(
                  children: <Widget>[
                    Center(child: Text("pay", style: TextStyle(fontSize: 16))),
                    Icon(Icons.payment),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        getBalance(),
        Expanded(
          child: getGoals(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width; double h = MediaQuery.of(context).size.height;
    if (taskList == null) {taskList = List<Task>(); _update();}
    if (goalList == null) {goalList = List<Goal>(); _update();}
    
    return Column(
      children: <Widget> 
      [
        Header(
          tab: _tab, 
          onTabChange: (newTab) {_changeTab(newTab);},
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: BouncingScrollPhysics(),
            onPageChanged: (value) {_updateGoals(); _update();},
            children: <Widget>[
              _getGoals(context),
              _getTodos(context),
              Container(child: Center(heightFactor: .1, child: Text("coming soon..",),),),
            ],
          ),
        ),
        BottomNavBar(lRoute: DetailScreen(), rRoute: CalanderScreen(), navCallBack: () {_create(); _update();}),
      ],
    );
  }
}

class HomeScreen extends StatefulWidget
{
  @override
  _HomeScreen createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen> 
{
	@override
	Widget build(BuildContext context)
	{
		return Scaffold(
      backgroundColor: Color(0xFF3A3D40),
			body: Body(),
		);
	}
} 
