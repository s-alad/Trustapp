class Goal
{
  int id;
  String name;
  String description;
  int amount;
  String date;

  Goal(this.name, this.amount, this.date, [this.description]);
  Goal.withId(this.id, this.name, this.amount, this.date, [this.description]);

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

  Goal.fromMapObject(Map<String, dynamic> map) 
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
    return 'Goal{id: $id, name: $name, description: $description, amount: $amount, date: $date}';
  }
}