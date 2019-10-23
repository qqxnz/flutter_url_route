# url_route

A new Flutter package project.

- 引入框架:
```
dependencies:
    url_route: ^0.0.4
```


- Flutter相关代码:

```dart
//main.dart

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


```

- 页面获取参数:

```
    //获取路由参数  
    var args = ModalRoute.of(context).settings.arguments;

```


### -iOS端:

- Objective-C
```Objc
FlutterViewController *flutterView = [[FlutterViewController alloc]init];
[flutterView setInitialRoute:@"page1?message=Test&asdf=2"];
[self.navigationController pushViewController:flutterView animated:YES];

```


- Swift

```Swift
let flutterView = FlutterViewController.init()
flutterView.setInitialRoute("page1?message=Test&asdf=2")
self.navigationController?.pushViewController(flutterView, animated: true)

```

### -Android端:

```
        FlutterNativeView nativeView = this.createFlutterNativeView();
        FlutterView flutterView = new FlutterView(BaseFlutterActivity.this, null, nativeView);
        flutterView.setInitialRoute("page1?message=Test&asdf=nativeToFlutter with arguments");
        flutterView.setLayoutParams(matchParent);
        flutterView.enableTransparentBackground();
        this.setContentView(flutterView);
```



## Demo内容相关

路由名称|对应路由栈
--|--
"/"|:首页
"page1"|:Page1
"page2"|:Page2
"/page1"|:首页->Page1
"/page2"|:首页->Page2
"/page1/page2|:首页->Page1->Page2
/page1/page2/page1|:首页->Page1->Page2->Page1




## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
