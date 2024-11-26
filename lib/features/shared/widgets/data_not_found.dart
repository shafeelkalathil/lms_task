import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../../gen/assets.gen.dart';

class CustomDataNotFound extends StatelessWidget {
  const CustomDataNotFound({
    required this.title,
    required this.subTitle,
    super.key,});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.images.noResult),
          const SizedBox(height: 30,),
          Text(title,
            style: heading1.copyWith(color: silverChalice.shade900),),
          const SizedBox(height: 10,),
          Text(subTitle,
            style: subtitle2.copyWith(color: silverChalice.shade500),),
        ],
      ),
    );
  }
}
