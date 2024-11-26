import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms_task/core/utils/extension/size_extension.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../core/constants/color_constants.dart';
import '../widgets/custom_nav_bar.dart';

@RoutePage()
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({
    required this.navItems,
    required this.screens,
    super.key,
    this.isInnerNavigation = false,
    this.navBarFontSize,
  });

  final Map<String, String> navItems;
  final List<CustomNavBarScreen> screens;
  final bool isInnerNavigation;
  final double? navBarFontSize;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final PersistentTabController _controller = PersistentTabController();
  bool _isNavigating = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.index = widget.isInnerNavigation ? 1 : 0;
    super.initState();
  }

  Future<void> _handlePop() async {
    if (_isNavigating) return;

    try {
      _isNavigating = true;
      if (_controller.index == (widget.isInnerNavigation ? 1 : 0)) {
        if (widget.isInnerNavigation) {
          if (mounted && context.router.canPop()) {
            context.router.popForced();
          }
        } else {
          await SystemNavigator.pop();
        }
      } else {
        setState(() {
          _controller.index = widget.isInnerNavigation ? 1 : 0;
        });
      }
    } finally {
      _isNavigating = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,result) async {
        if (didPop) return;
        await _handlePop();
      },
      child: PersistentTabView.custom(
        context,
        navBarHeight: context.screenHeight * 0.09,
        handleAndroidBackButtonPress: false,
        controller: _controller,
        customWidget: CustomNavBar(
          selectedIndex: _controller.index,
          navBarFontSize: widget.navBarFontSize,
          items: List.generate(
            widget.navItems.length,
                (index) => PersistentBottomNavBarItem(
              icon: buildIcon(
                widget.navItems.values.elementAt(index),
                context,
                isActive: _controller.index == index,
              ),
              title: widget.navItems.keys.elementAt(index),
            ),
          ),
          onItemSelected: (index) async {
            if (_isNavigating) return;

            try {
              _isNavigating = true;
              if (widget.isInnerNavigation && index == 0) {
                if (mounted && context.router.canPop()) {
                  context.router.popForced();
                }
              } else {
                setState(() {
                  _controller.jumpToTab(index);
                });
              }
            } finally {
              _isNavigating = false;
            }
          },
        ),
        itemCount: widget.navItems.length,
        screens: widget.screens,
      ),
    );
  }

  Widget buildIcon(
      String assetPath,
      BuildContext context, {
        required bool isActive,
      }) {
    return SvgPicture.asset(
      width: context.screenWidth * 0.07,
      assetPath,
      colorFilter: ColorFilter.mode(
        isActive ? orange : silverChalice,
        BlendMode.srcIn,
      ),
    );
  }
}