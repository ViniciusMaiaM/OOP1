class Student{
  final String name;
  final int age;
  late final List<double> grades;
  // Using late final you can assign the variable later at the run time, but only once

  Student({required String this.name, required int this.age, required  List<double> this.grades}){
    this.grades = grades;
  }

  double gpa(){
    if(grades.isEmpty){
      return 0.0;
    }

    double sum = grades.reduce((a,b) => a + b);
    // The method reduce applies the given function to each element of the array, accumulating the result
    return sum / grades.length;
  }

  String situation() => gpa() > 6.0 ? "Approved" : "Reproved"; 
}

void main(){
  Student student = new Student(name: "Vinicius", age:19, grades:[6.7, 5.0, 5.5, 7.4]);
  print(student.situation());
}
