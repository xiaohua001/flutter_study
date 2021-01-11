import 'package:flutter/material.dart';

import '../pages/tabs/Tabs.dart';
import '../pages/tabs/Form.dart';
import '../pages/tabs/Search.dart';
import '../pages/tabs/Product.dart';
import '../pages/tabs/ProductInfo.dart';

//配置路由
final routes = {
  '/': (context) => Tabs(),
  '/form': (context) => FormPage(),
  '/product': (context) => ProductPage(),
  '/productinfo': (context, {arguments}) =>
      ProductInfoPage(arguments: arguments),
  '/search': (context, {arguments}) => SearchPage(arguments: arguments),
};

//固定写法 
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理钩子
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  } else {
    return null;
  }
};
