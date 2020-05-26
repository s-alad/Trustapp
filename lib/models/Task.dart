class Task
{
  int id;
  String name;
  String date;
  int state;
  int level;

  Task(this.name, this.date, this.level, this.state);
  Task.withId(this.id, this.name, this.date, this.level, this.state);

  Map<String, dynamic> toMap() 
  {
    return 
    {
      'id': id, 
      'name': name,
      'date': date,
      'level' : level,
      'state' : state,
    };
  }

  Task.fromMapObject(Map<String, dynamic> map) 
  {
		this.id = map['id'];
		this.name = map['name'];
		this.date = map['date'];
    this.level = map['level'];
    this.state = map['state'];
	}

  @override
  String toString() 
  {
    return 'Task{id: $id, name: $name, date: $date, level: $level, state: $state}';
  }
}