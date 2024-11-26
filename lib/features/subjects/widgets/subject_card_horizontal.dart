import 'package:flutter/material.dart';
import 'package:lms_task/core/utils/extension/size_extension.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class SubjectCardHorizontal extends StatelessWidget {
  const SubjectCardHorizontal({
    required this.title,
    required this.description,
    required this.imageUrl,
    super.key,
  });
  final String title;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      // height: context.screenWidth * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: silverChalice.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: context.screenWidth * 0.3,
            height: context.screenWidth * 0.3,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(11),
                bottomLeft: Radius.circular(11),
              ),
              color: imageUrl == '' ? silverChalice.shade200 :null,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: context.screenWidth * 0.3,
                errorBuilder: (context, error, stackTrace) {
                  return const Text("loading");
                },
              ),
            ),
          ),
          rightSection(context),
        ],
      ),
    );
  }

  Widget rightSection(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.54,
      padding: EdgeInsets.only(right: context.screenWidth * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: defaultButton.copyWith(color: const Color(0xff000000)),
          ),
          SizedBox(height: context.screenWidth*0.01),
          Text(
            description,
            style: heading4.copyWith(color: silverChalice.shade800),
          ),
          SizedBox(height: context.screenHeight*0.005),
        ],
      ),
    );
  }
}
