import 'Person.dart';

class Employee extends Person{

  //默认构造函数，如果没有构造函数，系统默认它


  Employee() : super('firstName');

//  Employee();

//  Employee(String firstName) : super(firstName);

//  Employee.fromJson(Map data){
//    print("Employee的命名构造函数");
//  }
//
//  Employee.fromJson2(Map data) : super.fromJson(data) {
//    print('in Employee');
//  }



}