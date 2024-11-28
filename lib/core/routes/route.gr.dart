// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [ModuleOverViewScreen]
class ModuleOverViewRoute extends PageRouteInfo<ModuleOverViewRouteArgs> {
  ModuleOverViewRoute({
    Key? key,
    required String title,
    required String description,
    required String videoUrl,
    required String videoType,
    List<PageRouteInfo>? children,
  }) : super(
          ModuleOverViewRoute.name,
          args: ModuleOverViewRouteArgs(
            key: key,
            title: title,
            description: description,
            videoUrl: videoUrl,
            videoType: videoType,
          ),
          initialChildren: children,
        );

  static const String name = 'ModuleOverViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ModuleOverViewRouteArgs>();
      return ModuleOverViewScreen(
        key: args.key,
        title: args.title,
        description: args.description,
        videoUrl: args.videoUrl,
        videoType: args.videoType,
      );
    },
  );
}

class ModuleOverViewRouteArgs {
  const ModuleOverViewRouteArgs({
    this.key,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.videoType,
  });

  final Key? key;

  final String title;

  final String description;

  final String videoUrl;

  final String videoType;

  @override
  String toString() {
    return 'ModuleOverViewRouteArgs{key: $key, title: $title, description: $description, videoUrl: $videoUrl, videoType: $videoType}';
  }
}

/// generated route for
/// [ModuleScreen]
class ModuleRoute extends PageRouteInfo<ModuleRouteArgs> {
  ModuleRoute({
    Key? key,
    required int subjectId,
    required String subjectTitle,
    List<PageRouteInfo>? children,
  }) : super(
          ModuleRoute.name,
          args: ModuleRouteArgs(
            key: key,
            subjectId: subjectId,
            subjectTitle: subjectTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'ModuleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ModuleRouteArgs>();
      return ModuleScreen(
        key: args.key,
        subjectId: args.subjectId,
        subjectTitle: args.subjectTitle,
      );
    },
  );
}

class ModuleRouteArgs {
  const ModuleRouteArgs({
    this.key,
    required this.subjectId,
    required this.subjectTitle,
  });

  final Key? key;

  final int subjectId;

  final String subjectTitle;

  @override
  String toString() {
    return 'ModuleRouteArgs{key: $key, subjectId: $subjectId, subjectTitle: $subjectTitle}';
  }
}

/// generated route for
/// [ModuleVideoScreen]
class ModuleVideoRoute extends PageRouteInfo<ModuleVideoRouteArgs> {
  ModuleVideoRoute({
    Key? key,
    required int moduleId,
    required String moduleTitle,
    List<PageRouteInfo>? children,
  }) : super(
          ModuleVideoRoute.name,
          args: ModuleVideoRouteArgs(
            key: key,
            moduleId: moduleId,
            moduleTitle: moduleTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'ModuleVideoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ModuleVideoRouteArgs>();
      return ModuleVideoScreen(
        key: args.key,
        moduleId: args.moduleId,
        moduleTitle: args.moduleTitle,
      );
    },
  );
}

class ModuleVideoRouteArgs {
  const ModuleVideoRouteArgs({
    this.key,
    required this.moduleId,
    required this.moduleTitle,
  });

  final Key? key;

  final int moduleId;

  final String moduleTitle;

  @override
  String toString() {
    return 'ModuleVideoRouteArgs{key: $key, moduleId: $moduleId, moduleTitle: $moduleTitle}';
  }
}

/// generated route for
/// [NavigationScreen]
class NavigationRoute extends PageRouteInfo<NavigationRouteArgs> {
  NavigationRoute({
    required Map<String, String> navItems,
    required List<CustomNavBarScreen> screens,
    Key? key,
    bool isInnerNavigation = false,
    double? navBarFontSize,
    List<PageRouteInfo>? children,
  }) : super(
          NavigationRoute.name,
          args: NavigationRouteArgs(
            navItems: navItems,
            screens: screens,
            key: key,
            isInnerNavigation: isInnerNavigation,
            navBarFontSize: navBarFontSize,
          ),
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NavigationRouteArgs>();
      return NavigationScreen(
        navItems: args.navItems,
        screens: args.screens,
        key: args.key,
        isInnerNavigation: args.isInnerNavigation,
        navBarFontSize: args.navBarFontSize,
      );
    },
  );
}

class NavigationRouteArgs {
  const NavigationRouteArgs({
    required this.navItems,
    required this.screens,
    this.key,
    this.isInnerNavigation = false,
    this.navBarFontSize,
  });

  final Map<String, String> navItems;

  final List<CustomNavBarScreen> screens;

  final Key? key;

  final bool isInnerNavigation;

  final double? navBarFontSize;

  @override
  String toString() {
    return 'NavigationRouteArgs{navItems: $navItems, screens: $screens, key: $key, isInnerNavigation: $isInnerNavigation, navBarFontSize: $navBarFontSize}';
  }
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnBoardingScreen();
    },
  );
}
