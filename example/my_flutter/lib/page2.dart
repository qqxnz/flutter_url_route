import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Page2State();
  }
}


class Page2State extends State<Page2> {
  static const platform = const MethodChannel('com.qqxnz.flutter/url_route');
  @override
  Widget build(BuildContext context) {
    print("Page2 build");
    //获取路由参数  
    var args = ModalRoute.of(context).settings.arguments;
    return Material(
      color: Colors.lightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('this flutter page2'),
          Text('参数：$args'),
          FlatButton(
            color: Colors.orange,
            child: Text('返回上个Flutter'),
            onPressed: (){
              if(Navigator.canPop(context)){
                Navigator.pop(context);
              }
            },
          ),
          FlatButton(
            color: Colors.orange,
            child: Text('打开一个原生界面'),
            onPressed: (){
              platform.invokeMethod('routerNative','');
            },
          ),
          FlatButton(
            color: Colors.orange,
            child: Text('返回原生'),
            onPressed: (){
              platform.invokeMethod('backNative');
            },
          ),
          FlatButton(
            child: Text('flutter_native_method_test'),
            onPressed: (){
              platform.invokeMethod('flutter_native_method_test');
            },
          ),
        ],
      ),
    );
  }
}