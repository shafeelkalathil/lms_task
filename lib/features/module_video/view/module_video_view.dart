import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms_task/core/utils/extension/size_extension.dart';
import '../../../core/constants/color_constants.dart';
import '../../../gen/assets.gen.dart';
import '../../shared/widgets/app_bar.dart';
import '../../shared/widgets/data_not_found.dart';
import '../../shared/widgets/expansion_tile.dart';
import '../../shared/widgets/textform_field.dart';
import '../view_model/module_video_view_model.dart';
import '../widget/module_video_card.dart';

@RoutePage()
class ModuleVideoScreen extends StatefulWidget {
  const ModuleVideoScreen({super.key, required this.moduleId});
  final int moduleId;

  @override
  State<ModuleVideoScreen> createState() => _ModuleVideoScreenState();
}

class _ModuleVideoScreenState extends State<ModuleVideoScreen> {
  TextEditingController searchController = TextEditingController();

  String _searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Module Videos',),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(context.screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    prefixIcon: SvgPicture.asset(
                      Assets.icons.search,
                    ),
                    hintText: 'Search',
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value.toLowerCase();
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.06,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer(
                        builder: (context, ref, child) {
                          final moduleData = ref.watch(moduleVideoStreamProvider(widget.moduleId));
                          return moduleData.when(
                            data: (data) {
                              final filteredData = data
                                  .where((course) => course.title.toLowerCase()
                                  .contains(_searchQuery),).toList();
                              if(filteredData.isEmpty){
                                return const CustomDataNotFound(title: "No data found", subTitle: '');
                              }else{
                                return ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: filteredData.length,
                                  itemBuilder: (context, index) {
                                    final moduleData = filteredData[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: CustomExpansionTile(
                                        title: moduleData.title,
                                        insideWidgets: [
                                          DoubtItem(
                                            description: moduleData.description,
                                            videoUrl: moduleData.videoUrl,
                                          ),
                                        ],
                                      ),
                                    );
                                  },);
                              }
                            },
                            error: (error, stackTrace) {
                              return Text(error.toString());
                            },
                            loading: () {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: orange.shade500,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
