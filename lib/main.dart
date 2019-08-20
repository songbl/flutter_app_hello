import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var str = "hahah";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: str , //应用名称
      theme: ThemeData(
       //蓝色主题
        primarySwatch: Colors.blue,
      ),
      //Flutter应用的首页
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//  首页（有状态的组件  [ˈwɪdʒɪt] ）
//  MyHomePage,是一个有状态的组件（Stateful widget）。现在简单认为两点不同：
//   1. Stateful widget 可以拥有状态，这些状态在widget生命周期中是可变的，而stateless widget是不可变的
//   2. Stateful widget至少由两个雷组成：一个是StatefulWidget 类，一个是State 类，
//               StatefulWidget类本身是不变的，但是State类中持有的状态在widget生命周期中可能会发生变化。
//
// MyHomePage类中并没有build()方法，取而代之的是将build方法迁移到了_MyHomePageState
//Stateful widget 可以拥有状态，这些状态在widget生命周期中是可变的，而Stateless widget是不可变得
class MyHomePage extends StatefulWidget {//叫有状态组件类嘛？
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//这个就是MyHomePage对应的状态类
class _MyHomePageState extends State<MyHomePage> {
  //该组件的状态
  int _counter = 0;

  //设置状态自增函数
  void _incrementCounter() {
    setState(() {
      //通知Flutter框架，有状态发生改变了，Flutter框架收到通知后，会执行build方法来分局新的状态
      //重新构建界面，Flutter对此方法做了优化，使得之心执行很快
      _counter++;
    });
  }

  //构建UI的逻辑在build方法中，_MyHomePageState类初始化完成后，Flutter框架会调用widget的build方法
  //来构建widget树，最终将widget树渲染到设配屏幕上
  @override
  Widget build(BuildContext context) {
    //页面脚手架，包含导航栏和Body，以及FloatingActionButton（组件树可以很复杂）
    return Scaffold(//（组件树可以很复杂）
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(//body组件树包含一个Center组件，Center组件可以将其子组件树对象到屏幕中心
        child: Column(//Column组件,列
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have click the button this many times:  hot nismei ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //分析
/**
 *  1. 导入包 import 'package:flutter/material.dart'; 该行代码导入的是Material UI
 *  2. 应用入口  void main() => runApp(MyApp()); 与java C/C++类似，Flutter应用以main函数为应用程序入口
 *    main函数调用runApp方法，它的功能是启动Flutter应用。runApp接受一个Wight参数，本例中是一个MyApp对象
 *    MyApp是Flutter的根组件; main函数使用了(=>)符号，这是Dart中单行函数或方法的简写
 *  3. 应用结构
 *    - MyApp类代表Flutter应用，它继承了StatelessWidget类，这也意味着应用本身是一个widget
 *    - 在Flutter中，大多数东西都是widget(组件或者部件)，包括对齐填充布局等都是以widget的形式提供
 *    - Flutter在构建页面对调用组件的build方法，wight的主要工作是提供一个build()方法来描述如何构建UI界面
 *      (通常是通过组合，拼装其它基础widget)
 *    - MateralApp 是Material库中提供的Flutter APP框架 ,也是一个widget ，包含应用的名称，主题首页路由等
 *    - Scaffold(skæfoʊld)是Material库中提供的页面脚手架，包含导航栏和Body，以及FloatingActionButton
 *
 *
 *
 *
 *
 *
 *
 *
 */










































}
