import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'UI.dart';
import 'database_helper.dart';


final dbHelper = DatabaseHelper.instance;

class CreateScreen extends StatelessWidget 
{
  @override
  Widget build (BuildContext ctxt) 
  {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          CreateHeader(),
          CreateBody(),
        ]
      )
    );
  }
}

class CreateHeader extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * .2,
      child: Padding(
        padding: EdgeInsets.only(top: 30,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              child: Text(
                'CREATE A NEW',
                style: (TextStyle(color: Color(0xFF212121), fontSize: 34, fontFamily: 'Roboto-Bold', height: 1)),
              ),
            ),
            Align(
              child: Text(
                'TASK',
                style: (TextStyle(color: Color(0xFF212121), fontSize: 34, fontFamily: 'Roboto-Medium', height: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateBody extends StatelessWidget
{

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment(0, 1),
      child: Container(      
        height: h * .8, 
        width: w,  
        decoration: new BoxDecoration(
          border: Border.all(color: Color(0xFF707070)),
          color: Color(0xFFFFFFF0),
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(32),
            topRight: const Radius.circular(32),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 32.0, right: 32.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 36),    
                child: TextField(
                  controller: nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                    ),
                  labelText: 'Task Name',
                  ), 
                ),        
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),    
                child: TextField(
                  controller: descriptionController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(const Radius.circular(10.0))
                    ),
                    labelText: 'Description of task',
                  ), 
                ), 
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, right: 75, left: 75),    
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                    ),
                  labelText: 'Amount to Pledge',
                  ), 
                ),        
              ), 
              Padding(
                padding: EdgeInsets.only(top: 24, bottom: 24),
                child: DatePicker(),
              ),
              Addtask(Text(nameController.text),Text(descriptionController.text),Text(amountController.text)),
              BackButton(),
            ],
          ), 
        ),
      ),
    );
  }
}
class Addtask extends StatelessWidget
{
  static Text objectname;
  static Text objectdescription;
  static Text objectamount;

  Addtask(objectname,objectdescription,objectamount);
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      
      onTap: ()
      {
        print(objectname);
      },
      
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: h * .08,
          width: w * .8,
          margin: EdgeInsets.only(bottom: h * .024),
          child: Center(
            child: Text(
              'CREATE NEW TASK',
              textAlign: TextAlign.center,
              style: (TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Roboto-Medium')),
            ),
          ),
          decoration: new BoxDecoration(
            boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6.0, 
              spreadRadius: 0.0, 
              offset: Offset(
                0.0,
                4.0, 
              ),
            )
            ],
            color: Color(0xFF212121),
            borderRadius: new BorderRadius.all(Radius.circular(12))
          )
        ),
      ),
    );
  }
}


void _insert() async {
  Map<String, dynamic> row = {
    DatabaseHelper.columnName : "I should have done this earlier",
    DatabaseHelper.columnAmount : 333,
    DatabaseHelper.columnDate : 2020-03-27,
    DatabaseHelper.columnDescription : "This is the description",
  };
  final id = await dbHelper.insert(row);
  print("$id");
}