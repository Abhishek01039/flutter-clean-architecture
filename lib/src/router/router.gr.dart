// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../feature/home/home_screen.dart' as _i5;
import '../feature/login/login_screen.dart' as _i4;
import '../feature/post_detail/post_detail.dart' as _i6;
import '../feature/splash/splash_screen.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashPage.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.SplashScreen();
        }),
    LoginPage.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.LoginScreen();
        }),
    HomePage.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    HomeScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.HomeScreen();
        }),
    PostDetailScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<PostDetailScreenArgs>(
              orElse: () =>
                  PostDetailScreenArgs(id: pathParams.getString('storeName')));
          return _i6.PostDetailScreen(id: args.id);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashPage.name, path: '/'),
        _i1.RouteConfig(LoginPage.name, path: '/login'),
        _i1.RouteConfig(HomePage.name, path: '/home', children: [
          _i1.RouteConfig(HomeScreen.name, path: ''),
          _i1.RouteConfig(PostDetailScreen.name, path: ':id'),
          _i1.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ])
      ];
}

class SplashPage extends _i1.PageRouteInfo {
  const SplashPage() : super(name, path: '/');

  static const String name = 'SplashPage';
}

class LoginPage extends _i1.PageRouteInfo {
  const LoginPage() : super(name, path: '/login');

  static const String name = 'LoginPage';
}

class HomePage extends _i1.PageRouteInfo {
  const HomePage({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/home', initialChildren: children);

  static const String name = 'HomePage';
}

class HomeScreen extends _i1.PageRouteInfo {
  const HomeScreen() : super(name, path: '');

  static const String name = 'HomeScreen';
}

class PostDetailScreen extends _i1.PageRouteInfo<PostDetailScreenArgs> {
  PostDetailScreen({required String id})
      : super(name,
            path: ':id',
            args: PostDetailScreenArgs(id: id),
            rawPathParams: {'storeName': id});

  static const String name = 'PostDetailScreen';
}

class PostDetailScreenArgs {
  const PostDetailScreenArgs({required this.id});

  final String id;
}
