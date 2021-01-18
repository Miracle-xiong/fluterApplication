import 'package:dio/dio.dart';
import 'package:fluterApplication/other/other.dart';
import 'package:flutter/material.dart';
import '../other/other.dart';

class IndexPage extends StatefulWidget {
  final String type;
  //构造函数
  IndexPage({Key key, this.type}) : super(key: key);
  @override
  _IndexPageState createState() {
    return _IndexPageState();
  }
}

//IndexPage是个泛型
class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  //不确定的类型用var
  var movieList = [];
  @override
  void initState() {
    super.initState();
    getMovies();
  }

  /*
  保持界面状态
  1.AutomaticKeepAliveClientMixin
  2.重写wantKeepAlive
  */
  @override
  bool get wantKeepAlive => true;

  getMovies() async {
    Dio dio = new Dio();
    var response = await dio.get('https://m.maoyan.com/ajax/movieOnInfoList');
    var result = response.data;
    setState(() {
      movieList = result['movieList'];
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu_open),
          ),
          title: Text(widget.type),
        ),
        body: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext ctx, int value) {
              var movie = movieList[value];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext ctx) {
                    return OtherPage(title: movie['nm'], movieID: movie['id']);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 2, color: Colors.black12))),
                  child: Row(
                    children: [
                      Image.network(
                        'https://p0.meituan.net/movie/e82b94126e9de90955e93fa461795b86508192.jpg',
                        height: 180,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('电影名称：${movie['nm']}'),
                            Text('上映年份：${movie['rt']}'),
                            Text('评分：${movie['sc']}'),
                            Text(
                              '主演：${movie['star']}',
                              overflow: TextOverflow.clip,
                            ),
                            Text('排片：${movie['showInfo']}'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
