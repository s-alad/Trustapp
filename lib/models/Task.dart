class Task
{
  int id;
  String name;
  String description;
  int amount;
  String date;

  Task(this.name, this.amount, this.date, [this.description]);
  Task.withId(this.id, this.name, this.amount, this.date, [this.description]);

  Map<String, dynamic> toMap() 
  {
    return 
    {
      'id': id, 
      'name': name,
      'amount': amount,
      'date': date,
      'description': description,
    };
  }

  Task.fromMapObject(Map<String, dynamic> map) 
  {
		this.id = map['id'];
		this.amount = map['amount'];
		this.description = map['description'];
		this.name = map['name'];
		this.date = map['date'];
	}

  @override
  String toString() 
  {
    return 'Task{id: $id, name: $name, description: $description, amount: $amount, date: $date}';
  }
}