import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../features/home/views/home_view.dart';
import '../../features/module/view/module_view.dart';
import '../../features/module_video/view/module_video_view.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/shared/view/navigation_route.dart';
part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnBoardingRoute.page,initial: true),
        AutoRoute(page: NavigationRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ModuleRoute.page),
        AutoRoute(page: ModuleVideoRoute.page),
      ];

}
