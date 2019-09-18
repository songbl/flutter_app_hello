import 'constructortest/Employee.dart';

String fun(){

  final  x = new DateTime.now(); // 正确
  //编译时常量
//  const y = new DateTime.now(); // 错误

  String singleString = 'abc';
  String doubleString = "dfafd";
  String sdString = singleString+doubleString;
  print(sdString);
 // 或{} 来计算字符串中变量的值，需要注意的是如果是表达式需要${表达式}
  String str2 = "${singleString.toUpperCase()} abc 'aaa' $doubleString.toUpperCase()";
  String str3 = "${singleString.toUpperCase()} abc 'aaa' ${doubleString.toUpperCase()}";
  // 输出 AAA abc 'aaa' bbb.toUpperCase(),
  print(str2);
  print(str3);


  // 检查是否为空字符串
  var fullName = '';
  assert(fullName.isEmpty);


  var varList = const []; // varList 当前是一个EIL
  final finalList = const []; // finalList一直是EIL
  const constList = const []; // constList 是一个编译时常量的EIL

  // 可以更改非final,非const变量的值
  // 即使它曾经具有const值
  varList = ["haha"];
 // finalList = ["haha"];


//*********************Map******************
  Map companys = {'Alibaba': '阿里巴巴', 'Tencent': 2222, 'baidu': '百度'};
  // 输出：{Alibaba: 阿里巴巴, Tencent: 腾讯, baidu: 百度}
  print(companys);

  Map schoolsMap = new Map();
  schoolsMap['first'] = '清华';
  schoolsMap['second'] = '北大';
  schoolsMap['third'] = '复旦';
  // 打印结果 {first: 清华, second: 北大, third: 复旦}
  print(schoolsMap);


  // 指定键值对的参数类型
  var aMap = new Map<int, String>();
// Map的赋值，中括号中是Key，这里可不是数组
  aMap[1] = '小米';
//Map中的键值对是唯一的
//同Set不同，第二次输入的Key如果存在，Value会覆盖之前的数据
  aMap[1] = 'alibaba';

  //可选的命名参数
  enableFlags(bold: true, hidden: false);
  enableFlags(hidden: true, bold: false);
  enableFlags(hidden: true);

  //可选位置参数
  var str1 =say("龙哥", "娜姐");
  print(str1);
  var s = say("龙哥", "娜姐","MacBook");
  print(s);
  return "hhh";



}

//*************************************可选参数*************************
//设置[bold]和[hidden]标志 | 可选命名参数,只要有名字就行呢
void enableFlags({bool bold, bool hidden}) {
  print("可选命名参数bool= "+bold.toString()+"  hidden $hidden");
}

//可选的位置参数，用[]他们可以标记为可选的位置参数，
String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}


//***************************************函数********************************************
// 函数
void function(){
  //********1.  严格的说，级联.. 符号不是操作符，它是Dart语法的一部分*********
//  querySelector('#confirm') // Get an object.
//    ..text = 'Confirm' // Use its members.
//    ..classes.add('important')
//    ..onClick.listen((e) => window.alert('Confirmed!'));

//  var button = querySelector('#confirm');
//  button.text = 'Confirm';
//  button.classes.add('important');
//  button.onClick.listen((e) => window.alert('Confirmed!'));

//********

  var list = [1, 2, 3];
  void printElement(int element) {
    print(element);
  }
  // 把 printElement函数作为一个参数传递进来
  list.forEach(printElement);

  //匿名函数
  var list2 = ['apples', 'bananas', 'oranges'];
  list2.forEach((item) {
    print('${list2.indexOf(item)}: $item');
  });
//如果函数只包含一条语句，可以使用箭头符号=>来缩短它, 比如上面的例2可以简写成：
  list.forEach((item) => print('${list.indexOf(item)}: $item'));

}


//用final修饰的变量，必须在定义时将其初始化，
// 其值在初始化后不可改变；const用来定义常量
//const比final更加严格。final只是要求变量在初始化后值不变，
// 但通过final，我们无法在编译时（运行之前）知道这个变量的值；
// 而const所修饰的是编译时常量，我们在编译时就已经知道了它的值，它的值也是不可改变的
int Func() {
   return 1 ;
}

void main(){


  final int m1 = 60;
  final int m2 = Func(); // 正确
  print(m1);
  fun();
//  const int n1 = 42;
//  const int n2 = Func(); // 错误

  new Point(2,2);

  Map map = {"x":1,"y":2};
  new Point.fromMap(map);

  var rect = new Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  //默认的参数有get方法
  print(rect.left);
  //这个属性自己构造了get方法
  print(rect.right);
  //set方法
  print(rect.right=8);
  print(rect.left);

  //类变量
  print(Color.red.name);

  print(greetBob(new Person('kathy')));
  print(greetBob(new Imposter()));



//  Employee employee = new Employee("hah");
  Employee employee2 = new Employee();


//  Employee employee2 = Employee.fromJson2(map);



}

//************构造函数的测试*****************
class Point{
  num x;
  num y ;
  //构造函数，this关键字只想了当前的实例
//  point(num x,num y){
//    this.x = x;
//    this.y = y ;
//  }
  //等同于
  Point(this.x,this.y);


  // 命名构造函数Named constructor
  Point.fromMap(Map map) {
    x = map['x'];
    y = map['y'];
  }


  //默认情况下，子类只能调用父类的无名无参数构造函数，父类的无名构造
  //函数会在子类的构造函数调用
}


class Point2 {
  num x;
  num y;

  Point2(this.x, this.y);

  // 初始化列表在构造函数运行前设置实例变量。
  Point2.fromJson(Map jsonMap)
      : x = jsonMap['x'],
        y = jsonMap['y'] {
    print('In Point.fromJson(): ($x, $y)');
  }
}


class Logger {
  final String name;
  bool mute = false;

  // _cache 是一个私有库,幸好名字前有个 _ 。
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }

}

class Rectangle {
  //每个实例变量都有衣蛾隐式的getter方法，合适的话还有get方法
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left, this.top, this.width, this.height);

  // 定义两个计算属性: right and bottom.|
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}


//******************************抽象方法************
abstract class Doer {
  // ...定义实例变量和方法...
  void doSomething(); // 定义一个抽象方法。
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // ...提供一个实现，所以这里的方法不是抽象的...
  }
}



//***********************类的变量和方法**************
class Color {
  static const red = const Color('red'); // 一个恒定的静态变量
  final String name;      // 一个实例变量。
  final String age = null;      // 一个实例变量。
  const Color(this.name); // 一个恒定的构造函数。|默认构造函数

}

// 一个 person ，包含 greet() 的隐式接口。
class Person {
  // 在这个接口中，只有库中可见。
  final _name;

  // 不在接口中，因为这是个构造函数。
  Person(this._name);

  @override
  void noSuchMethod(Invocation mirror) {
    // ...
  }



  // 在这个接口中| who相当于一个临时的变量名似的
  String greet(who) => 'Hello, $who. I am $_name.';
  String great(na) {
    return 'Hello, $na. I am $_name.';
  }

}
greetBob(Person person) => person.greet('bob');

//  Person 接口的一个实现。
class Imposter implements Person {
  // 我们不得不定义它，但不用它。
  final _name = "";

  String greet(who) => 'Hi $who. Do you know who I am?';

  @override
  String great(who) {
    // TODO: implement great
    return null;
  }
}


//*******************库管理
//import 'dart:io';
//import 'package:mylib/mylib.dart';
//import 'package:utils/utils.dart';


//******************************************异步**************************
//HTTP的get请求返回值为Future<String>类型，即其返回值未来是一个String类型的值
getData() async {    //async关键字声明该函数内部有代码需要延迟执行
// return await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"}); //await关键字声明运算为延迟执行，然后return运算结果
}
//编译没有问题，运行就报错，这个返回的是Future对象
String data = getData();
//1. 最常用 async方法和await表达式
//2. 当遇到有需要延迟的运算（async）时，将其放入到延迟运算的队列（await）中去，
// 把不需要延迟运算的部分先执行掉，最后再来处理延迟运算的部分
// 3. 在dart中，有await标记的运算，其结果都是一个Future对象




























