import 'package:flutter/material.dart';
import 'package:lms_task/core/utils/extension/size_extension.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    required this.courseTitle,
    required this.description,
    required this.imageUrl,
    super.key,
  });

  final String courseTitle;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: context.screenWidth >= 600
            ? context.screenWidth * 0.3
            : context.screenWidth * 0.4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child:  ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                      width: context.screenWidth >= 600
                          ? context.screenWidth * 0.3
                          :context.screenWidth * 0.4,
                                  errorBuilder: (context, error, stackTrace) {
                  return const Text("loading");
                                  },
                                ),
                ),
          ),
          const SizedBox(height: 12),
          Text(
            courseTitle,
            style: subtitle4.copyWith(color: silverChalice.shade800),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(description)
        ],
      ),
    );
  }

}
