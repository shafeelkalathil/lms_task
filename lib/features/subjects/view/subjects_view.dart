import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms_task/core/utils/extension/size_extension.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/routes/route.dart';
import '../../../gen/assets.gen.dart';
import '../../home/view_model/home_view_model.dart';
import '../../shared/widgets/data_not_found.dart';
import '../../shared/widgets/textform_field.dart';
import '../widgets/subject_card_horizontal.dart';


class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  TextEditingController searchController = TextEditingController();

  String _searchQuery = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(context.screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.screenWidth * 0.4,
                        child: Row(
                          children: [
                            GestureDetector(
                              child: const CircleAvatar(),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.03),
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
                  SizedBox(height: context.screenHeight * 0.03),
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
                          final subjectsData = ref.watch(subjectsStreamProvider);
                          return subjectsData.when(
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
                                    final subjectData = filteredData[index];
                                  return Padding(padding: const EdgeInsets.only(top: 10),
                                  child: InkWell(
                                    onTap: () {
                                      context.router.push(
                                        ModuleRoute(
                                          subjectTitle: subjectData.title,
                                            subjectId : subjectData.id),
                                      );
                                    },
                                    child: SubjectCardHorizontal(
                                        title: subjectData.title,
                                        description: subjectData.description,
                                        imageUrl: subjectData.image),
                                  ),);
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
