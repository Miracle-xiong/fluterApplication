import 'package:fluterApplication/pages/bean/bean.dart';
import 'package:fluterApplication/pages/discovery/discovery.dart';
import 'package:fluterApplication/pages/index/index.dart';
import 'package:fluterApplication/pages/mine/mine.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final List<Widget> tabs = [
    Tab(
      text: '首页',
      icon: Icon(Icons.movie_filter),
    ),
    Tab(
      text: '聚豆',
      icon: Icon(Icons.movie_creation),
    ),
    Tab(
      text: '发现',
      icon: Icon(Icons.movie_creation_outlined),
    ),
    Tab(
      text: '我的',
      icon: Icon(Icons.movie_filter_sharp),
    )
  ];

  final List<Widget> children = [
    IndexPage(type: '首页'),
    BeanPage(type: '聚豆'),
    DiscoveryPage(type: '发现'),
    MinePage(type: '我的')
  ];
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.tabs.length,
        initialIndex: 0,
        child: Scaffold(
            bottomNavigationBar: Container(
                decoration: BoxDecoration(color: Colors.red),
                height: 50,
                child: TabBar(
                  onTap: (value) {
                    // print('点击了' + value.toString());
                  },
                  //去掉底部下划线
                  indicator: const BoxDecoration(),
                  labelStyle: TextStyle(height: 0, fontSize: 10),
                  tabs: widget.tabs,
                )),
            body: TabBarView(
              children: widget.children,
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  UserAccountsDrawerHeader(
                      accountName: Text('wangxiong'),
                      accountEmail: Text('1634596432@qq.com'),
                      currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp0.ssl.cdn.btime.com%2Ft01c603a32359e20ae8.jpg%3Fsize%3D640x697&refer=http%3A%2F%2Fp0.ssl.cdn.btime.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1613388483&t=f040ec87ee596e63e20d092f646e81b7'))),
                  ListTile(
                      title: Text('用户反馈'),
                      trailing: Icon(Icons.feedback),
                      onTap: () {
                        print('用户反馈');
                      }),
                  Divider(
                    color: Colors.red,
                  ),
                  ListTile(
                    title: Text('设置'),
                    trailing: Icon(Icons.settings),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ) // This trailing comma makes auto-formatting nicer for build methods.
            ));
  }
}
