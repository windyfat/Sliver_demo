import 'package:flutter/material.dart';
import 'package:slivers_demo/demo1.dart';
import 'package:slivers_demo/demo2.dart';
import 'package:slivers_demo/demo3.dart';
import 'package:slivers_demo/demo4.dart';
import 'package:slivers_demo/demo5.dart';
import 'package:slivers_demo/demo6.dart';
import 'package:slivers_demo/demo7.dart';
import 'package:slivers_demo/demo8.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Slivers Demo Home Page'),
    );
  }
}

class SliverDemoModel {
  final String title;
  final String subTitle;
  final Widget page;

  SliverDemoModel({this.title, this.subTitle, this.page});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SliverDemoModel> _titles = [
    SliverDemoModel(
      title: 'SliverList、SliverGrid、SliverFixedExtentList', 
      subTitle: '常用的组合方式',
      page: SliverDemo1(
        title: 'SliverList、SliverGrid、SliverFixedExtentList',
      )
    ),
    SliverDemoModel(
      title: 'SliverPersistentHeader',
      subTitle: '吸顶效果',
      page: SliverDemo2(),
    ),
    SliverDemoModel(
      title: 'SliverAnimatedList',
      subTitle: '带动画的SliverList组件',
      page: SliverDemo3(),
    ),
    SliverDemoModel(
      title: 'SliverAppBar',
      subTitle: '可变的导航栏',
      page: SliverDemo4(),
    ),
    SliverDemoModel(
      title: 'SliverFillRemaining',
      subTitle: '充满视图的剩余空间，通常用于最后一个sliver组件',
      page: SliverDemo5(),
    ),
    SliverDemoModel(
      title: 'SliverFillViewport',
      subTitle: '每个子元素都填充满整个视图',
      page: SliverDemo6(),
    ),
    SliverDemoModel(
      title: 'SliverOpacity、SliverPadding',
      subTitle: '设置子控件透明度和padding',
      page: SliverDemo7(),
    ),
    SliverDemoModel(
      title: 'SliverPrototypeExtentList',
      subTitle: '由prototypeItem属性来控制所有子控件的高度',
      page: SliverDemo8(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemCount: _titles.length,
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.green,
            );
          },
          itemBuilder: (context, index) {
            SliverDemoModel model = _titles[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return model.page;
                  }
                ));
              },
              child: ListTile(
                title: Text(model.title),
                subtitle: Text(
                  model.subTitle??''
                ),
              ),
            );
          }),
    );
  }
}
