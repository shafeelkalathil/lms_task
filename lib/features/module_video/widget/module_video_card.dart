// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../../core/constants/color_constants.dart';
// import '../../../core/utils/styles/text_style.dart';
// import '../../../gen/assets.gen.dart';
// import '../../shared/widgets/video_player.dart';
//
// class ModuleVideoItem extends StatelessWidget {
//
//   const ModuleVideoItem({
//     required this.description,
//     required this.videoUrl,
//     super.key,
//   });
//   final String description;
//   final String videoUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: SvgPicture.asset(Assets.icons.lineHorizontal),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Text(
//                   description,
//                   style: subtitle3.copyWith(color: silverChalice.shade900),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: CustomVideoPlayer(
//                 url: videoUrl,
//                 videoType: ,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
//
//
