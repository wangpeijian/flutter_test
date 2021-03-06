import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/component/home/Hot/MovieItem.dart';
import 'package:flutter_app_demo1/model/Movie/MovieList.dart';
import 'package:flutter_app_demo1/rigger/ScrollableList.dart';
import 'package:flutter_app_demo1/utils/API.dart';

class HotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hot();
  }
}

class Hot extends StatefulWidget {
  @override
  _HotWidgetState createState() => new _HotWidgetState();
}

class _HotWidgetState extends ScrollableList<Hot> {
  @override
  requestData(int start, int pageSize) async {
    Map<int, Object> req = new Map();
    req[0] = start;
    req[1] = pageSize;
    var json = await APITool.get(API.movie_in_theaters, req: req);
    return MovieList.fromJson(json);
  }

  @override
  itemBuilder(BuildContext context, List data, int index) {
    return MovieItem(data[index], index);
  }
}
