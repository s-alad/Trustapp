import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trust/utils/Persist.dart';
import '../UI.dart';
import 'CreateTaskScreen.dart';
import '../models/Task.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class TaskContainer extends StatelessWidget
{
  //defining variables for each of the cards to read from 
  TaskContainer({this.name,this.amount,this.duedate,this.description});
  final String name;
  final int amount;
  final String duedate;
  final String description;

  Widget build(BuildContext context)
  {
    
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Align(
    alignment: Alignment.center,
      child: Container(
        height: h * .11,
        width: w * .8,
        margin: EdgeInsets.only(bottom: h * .02),
        decoration: new BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: new BorderRadius.all(Radius.circular(18))
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 14, top: 14),
                  child: Text(
                    name,
                    style: (TextStyle(color: Color(0xFF707070), fontSize: 24, fontFamily: 'Roboto-Medium', height: 1)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 88, top: 14),
                  child: Text(
                    duedate,
                    style: (TextStyle(color: Color(0xFF707070), fontSize: 24, fontFamily: 'Roboto-Medium', height: 1)),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Text(
                    '\$$amount',
                    style: (TextStyle(color: Color(0xFF707070), fontSize: 20, fontFamily: 'Roboto-Medium', height: 1)),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 14, top: 16),
                  child: Text(
                    description,
                    style: (TextStyle(color: Color(0xFF707070), fontSize: 18, fontFamily: 'Roboto-Medium', height: 1)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ); 
  }
}

class Header extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var now = new DateTime.now();
    var month = ['january','febuary','march','april','may','june','july','august','september','october','november','december'];
    String date = ('${month[now.month - 1].toUpperCase()}, ${now.day}');
    String name = '<NAME>';
    String total = '<TOTAL>';

    return Container(
      width: w,
      height: h * .2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            child: Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text(
              date,
              style: (TextStyle(color: Color(0xFF212121), fontSize: 22, fontFamily: 'Roboto-Medium', height: 1)),
            )
            )
          ),
          Align(
            child: Text(
              name,
              style: (TextStyle(color: Color(0xFF212121), fontSize: 34, fontFamily: 'Roboto-Bold', height: 1)),
            ),
          ),
          Align(
            child: Text(
              total,
              style: (TextStyle(color: Color(0xFF212121), fontSize: 22, fontFamily: 'Roboto-Medium', height: 1)),
            ),
          ),
        ],
      )
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
  Persist persist = Persist();
  List<Task> taskList;
  int size;

  void _delete(BuildContext context, Task task) async
  {
    await persist.deleteTask(task.id);
    print("deleted");
    _update();
  }
  void _create() async
  {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreen()));
    if (result[0] == true) 
    {
      Task newTask = new Task(result[1],result[2],result[3],result[4]);
      persist.insertTask(newTask);
      _update();
    }
  }
  void _update()
  {
    final Future<Database> db = persist.initializeDatabase();
    db.then((database) 
      {
        Future<List<Task>> taskListFuture = persist.getTasksList();
        taskListFuture.then((taskList)
          {
            setState(() 
            {
              this.taskList = taskList;
				      this.size = taskList.length;
            });
          }
        );
      }
    );
  }

  ListView getTasksListView()
  {
    print('size : $size');
    if (size == 0 || size == null)
    {
      return ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        itemCount: size,
        itemBuilder: (BuildContext context, int position) {}
      );
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
		  itemCount: size,
      itemBuilder: (BuildContext context, int position)
      {
        print(position);
        return TaskContainer(
          name: taskList[position].name, 
          amount: taskList[position].amount, 
          description: taskList[position].description,
          duedate: "<date>");
      }
    );
  }

  @override
  Widget build(BuildContext context)
  {
    if (taskList == null) 
    {
			taskList = List<Task>();
			_update();
		}
    
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container( 
      height: h * .8, 
      width: w,  
      decoration: new BoxDecoration(
        color: Color(0xFF323639),
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(52),
          topRight: const Radius.circular(52),
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(top: h * .8 * .05),
        child: Column(
          children: <Widget>[
            Container(
              height: h * .8 * .83,
              child: getTasksListView(),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF323639),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                )
              ),
              height: h * .8 * .12, 
              width: w,
              child: Padding(
                padding: EdgeInsets.only(left: 38, right: 38),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: new Icon(Icons.date_range),
                      color: Colors.white,
                      iconSize: 52,
                      onPressed: () 
                      {
                        _create();
                        _update();
                      },
                    ),
                    IconButton(
                      icon: new Icon(Icons.add_circle),
                      color: Color.fromRGBO(254, 249, 205, 1),
                      iconSize: 64,
                      onPressed: () 
                      {
                        /* _delete(context, taskList[0]); */
                        _create();
                        _update();
                      },
                    ),
                    IconButton(
                      icon: new Icon(Icons.assessment),
                      color: Colors.white,
                      iconSize: 52,
                      onPressed: () 
                      {
                        /* _delete(context, taskList[0]); */
                        _create();
                        _update();
                      },
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

class HomeScreen extends StatelessWidget 
{
	@override
	Widget build(BuildContext context)
	{
		return Scaffold(
      backgroundColor: Colors.white,
			body: Column(
        children: <Widget>[
          Header(),
          Body(),
        ],
      ),
		);
	}
} 
