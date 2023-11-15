class Order {
  String driverName;
  DateTime date;
  int amount;

  Order({
    required this.driverName,
    required this.date,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'DriverName': driverName,
      'name': date,
      'amount': amount,
    };
  }
}

class Driver {
  int id;
  String name;
  String licensePlate;

  Driver({
    required this.id,
    required this.name,
    required this.licensePlate,
  });

  get order => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'license_plate': licensePlate,
    };
  }
}
