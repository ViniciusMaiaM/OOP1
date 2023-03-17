class Vehicle{
  final int numberWheels;
  String _color;
  String _fuelType;
  String _plate;
  bool _engine = false;

  Vehicle(this.numberWheels, this._color ,this._fuelType, this._plate);

  void start(){
    _engine = true;
    print("The engine started");
  }

  void stop(){
    _engine = false;
    print("The engine stopped");
  }

  String get color => _color;

  set color(String value) {
    _color = value;
  }

  String get fuelType => _fuelType;

  set fuelType(String value) {
    _fuelType = value;
  }

  String get plate => _plate;

  set plate(String value) {
    _plate = value;
  }
}

class Car extends Vehicle{
  int numberDoors;

  Car({ 
    required this.numberDoors, 
    required fuelType, 
    required color,  
    required plate, 
    required numberWheels
  }) : super(numberWheels, color,fuelType, plate);

  void honk(){
    print("Beep beep!");
  }
}

class Motorcycle extends Vehicle{
  bool hasSidecar;

  Motorcycle({
    required this.hasSidecar, 
    required fuelType, 
    required plate, 
    required color, 
    required numberWheels
  }) : super(numberWheels, color, fuelType, plate);

  void popWheelie(){
    
    if(!this._engine){
      print("You can't pop a wheelie");
    }
    else{
      print("Popping a wheelie");
    }
  }
}

void main(){
  Car car = new Car(color: "green", numberDoors: 4, fuelType: "Gasoline", plate: "1dasda1", numberWheels: 4);
  Motorcycle motorcycle = new Motorcycle(color: "green", hasSidecar: false, fuelType: "Gasoline", plate: "2fdasdas3", numberWheels: 2);
  motorcycle.popWheelie();
  car.start();
  car.stop();
}
