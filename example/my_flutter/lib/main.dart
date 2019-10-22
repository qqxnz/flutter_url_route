import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_route/url_route.dart';
import 'page1.dart';
import 'page2.dart';

void main() {
  // 设置路由
  UrlRoute.routes = {
    "/":(context) => MyHomePage(title: 'AAAAA',),
    "page1":(context) => Page1(),
    "page2":(context) => Page2(),
    "/page1":(context) => Page1(),
    "/page2":(context) => Page2(),
    "/page1/page2":(content) => Page2(),
    "/page1/page2/page1":(context) => Page1(),
  };
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: UrlRoute.routes,//注册路由
      onGenerateRoute: UrlRoute().generator,//监听Url路由
      navigatorObservers:[NavigatorListen()],
    );
  }
}



class NavigatorListen extends NavigatorObserver{
  static const platform = const MethodChannel('com.qqxnz.flutter/url_route');
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    if(route.navigator.canPop()){
      platform.invokeMethod('backTouch','disable');
    }else{
      platform.invokeMethod('backTouch','enable');
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    if(previousRoute.navigator.canPop()){
      platform.invokeMethod('backTouch','disable');
    }else{
      platform.invokeMethod('backTouch','enable');
    }
  }
  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
  }


}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text('this flutter main'),
            FlatButton(
              color: Colors.orange,
              child: Text("page1"),
              onPressed: (){
                Navigator.of(context).pushNamed('page1',arguments: 'aaa');
              },
            ),
            FlatButton(
              color: Colors.orange,
              child: Text("page2"),
              onPressed: (){
                Navigator.of(context).pushNamed('page2',arguments: 'aaa');
              },
            ),
            FlatButton(
              color: Colors.orange,
              child: Text('url page1'),
              onPressed: (){
                Navigator.of(context).pushNamed('page1?message=Test&color_hex=fff%23aa');
              },
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
}
