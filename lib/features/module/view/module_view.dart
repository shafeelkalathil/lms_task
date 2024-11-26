
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms_task/core/utils/extension/size_extension.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/routes/route.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../../gen/assets.gen.dart';
import '../../shared/widgets/app_bar.dart';
import '../../shared/widgets/data_not_found.dart';
import '../../shared/widgets/textform_field.dart';
import '../view_model/module_view_model.dart';

@RoutePage()
class ModuleScreen extends StatefulWidget {
  const ModuleScreen({super.key, required this.subjectId});

  final int subjectId;

  @override
  State<ModuleScreen> createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  TextEditingController searchController = TextEditingController();

  String _searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Modules',),
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
                          final moduleData = ref.watch(modulesStreamProvider(widget.subjectId));
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

                                    /// Adding animation for list items
                                    return TweenAnimationBuilder(
                                      tween: Tween<double>(begin: 0, end: 1),
                                      duration: Duration(milliseconds: 300 + (index * 100)), // Delay each item's animation
                                      builder: (context, value, child) {
                                        return Opacity(
                                          opacity: value,
                                          child: Transform.translate(
                                            offset: Offset(0, 50 * (1 - value)), // Slide from below
                                            child: child,
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0), // Spacing between cards
                                        child: Card(
                                          elevation: 3,
                                          shadowColor: Colors.grey.withOpacity(0.2),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: ListTile(
                                            contentPadding: const EdgeInsets.all(12),
                                            title: Text(
                                              moduleData.title,
                                              style: subtitle1.copyWith(
                                                color: silverChalice.shade900
                                              ),
                                            ),
                                            subtitle: Text(
                                              moduleData.description,
                                              style: subtitle2.copyWith(
                                                  color: silverChalice.shade500
                                              ),
                                            ),
                                            onTap: () {
                                              context.router.push(
                                                ModuleVideoRoute(moduleId: moduleData.id),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
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
