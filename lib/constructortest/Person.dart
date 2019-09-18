class Person {
  String firstName ;

  //默认的构造函数
//  Person(){
//   print("Person默认的构造函数");
//  }
//
//
  Person(this.firstName);


//  Person(String name){
//   this.firstName = name ;
//  }



//  Person.fromJson(Map map){
//    print("Person命名构造函数");
//  }

}


//*****************默认构造**************
// 1. 如果你不声明构造函数，系统将提供一个默认的构造函数，
// 默认的构造函数没有参数，而且将调用父类的无参数构造函数===
// 经过测试，只要使用无参构造，都会调用父类的默认构造方法

//2. 如果子类使用了无参数构造函数，但是父类没写无参数构造函数，
// 同时写了其它构造函数，那么报错

//3. 子类不能从父类那里继承构造函数。声明无参数构造函数的子类只有默认的构造函数（经过测试我认为子类的
// 初始化操作仍然依赖于父类的构造方法）；如果子类显示的写了默认构造方法，父类也必须存在（你写了构造方法，系统不再
// 帮你创建默认的构造方法）

//4. 子类构造对象，都是依赖于构造函数，如果有父类，那么还要调用父类（如果都是默认构造函数
// 那么不要再显示的调用了）

//5. 默认的构造函数只能有一个 ，带不带参数都是默认构造函数