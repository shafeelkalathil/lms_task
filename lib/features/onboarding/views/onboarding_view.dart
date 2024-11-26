import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/routes/route.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../../gen/assets.gen.dart';
import '../../home/views/home_view.dart';
import '../../subjects/view/subjects_view.dart';


@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
        await context.router.pushAndPopUntil(
          NavigationRoute(
            navItems: {
              'Home': Assets.icons.home,
              'Subjects': Assets.icons.course,
            },
            screens:  const [
              CustomNavBarScreen(screen: HomeScreen()),
              CustomNavBarScreen(screen: SubjectsScreen()),
            ],
          ),
          predicate: (route) => false,
        );

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LMS',style: heading1.copyWith(color: silverChalice.shade900),),
              LoadingAnimationWidget.horizontalRotatingDots(color: orange.shade500, size: 50),
            ],
          ),
        )
    );
  }
}
