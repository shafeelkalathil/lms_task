import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms_task/core/utils/extension/size_extension.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../../gen/assets.gen.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    this.title,
    this.insideWidgets,
    this.trailing,
    this.isOrange = false,
  });
  final String? title;
  final List<Widget>? insideWidgets;
  final Widget? trailing;
  final bool isOrange;
  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.title ?? 'Title',
        style: heading3,
      ),
      onExpansionChanged: (value) => setState(() {
        _isExpanded = value;
      }),
      leading: AnimatedRotation(
        turns: _isExpanded ? 0.5 : 0,
        duration: const Duration(milliseconds: 200),
        child: SvgPicture.asset(
          Assets.icons.arrowDown,
          width: 10,
          colorFilter: ColorFilter.mode(
              widget.isOrange
                  ? const Color(0xffffffff)
                  : silverChalice.shade800,
              BlendMode.srcIn,),
        ),
      ),
      trailing: widget.trailing ?? const SizedBox.shrink(),
      collapsedBackgroundColor: widget.isOrange ? orange : null,
      backgroundColor: widget.isOrange ? orange : null,
      textColor: widget.isOrange ? const Color(0xffffffff) : null,
      collapsedTextColor: widget.isOrange ? const Color(0xffffffff) : null,
      children: widget.insideWidgets ?? [],
    );
  }
}

// Widget expandedTile({required String title, required BuildContext context}) {
//   return Container(
//     decoration: BoxDecoration(
//       color: const Color(0xffffffff),
//       border: Border(top: BorderSide(color: silverChalice.shade100)),
//     ),
//     height: 50,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             SizedBox(
//               width: context.screenWidth * 0.08,
//             ),
//             SvgPicture.asset(
//               Assets.icons.mic,
//               width: 20,
//             ),
//             SizedBox(
//               width: context.screenWidth * 0.06,
//             ),
//             Text(
//               title,
//               style: subtitle3.copyWith(color: silverChalice.shade800),
//             ),
//           ],
//         ),
//         Padding(
//           padding: EdgeInsets.only(right: context.screenWidth * 0.06),
//           child: SvgPicture.asset(
//             Assets.icons.lock,
//             width: 16,
//             colorFilter: ColorFilter.mode(orange.shade400, BlendMode.srcIn),
//           ),
//         ),
//       ],
//     ),
//   );
// }
