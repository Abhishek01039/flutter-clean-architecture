import 'package:auto_route/auto_route.dart';
import 'package:memri_example/src/feature/home/home_screen.dart';
import 'package:memri_example/src/feature/login/login_screen.dart';
import 'package:memri_example/src/feature/post_detail/post_detail.dart';
import 'package:memri_example/src/feature/splash/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page, Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', name: 'splashPage', page: SplashScreen, initial: true),
    AutoRoute(path: '/login', name: 'loginPage', page: LoginScreen),
    AutoRoute(
      path: '/home',
      name: 'homePage',
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: '', page: HomeScreen),
        AutoRoute(path: ':id', page: PostDetailScreen),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
  ],
)
class $AppRouter {}
