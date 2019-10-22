import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page1 extends StatelessWidget {
  static const platform = const MethodChannel('com.qqxnz.flutter/url_route');
  @override
  Widget build(BuildContext context) {
    print("Page1 build");
    //获取路由参数  
    var args = ModalRoute.of(context).settings.arguments;
    return Material(
      color: Colors.deepPurpleAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('this flutter page1'),
          Text('参数：$args'),
          FlatButton(
            color: Colors.orange,
            child: Text('返回上个Flutter界面'),
            onPressed: (){
              if(Navigator.canPop(context)){
                Navigator.pop(context);
              }
            },
          ),
          FlatButton(
            color: Colors.orange,
            child: Text('page2'),
            onPressed: (){
              Navigator.pushNamed(context, 'page2');
            },
          ),
          FlatButton(
            color: Colors.orange,
            child: Text('打开一个原生界面'),
            onPressed: (){
              platform.invokeListMethod('routerNative','');
            },
          ),
          FlatButton(
            color: Colors.orange,
            child: Text('返回原生'),
            onPressed: (){
              platform.invokeListMethod('backNative');
            },
          ),
        ],
      ),
    );
  }
}