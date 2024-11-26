import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms_task/core/utils/extension/size_extension.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/routes/route.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../../gen/assets.gen.dart';
import '../../shared/widgets/data_not_found.dart';
import '../view_model/home_view_model.dart';
import '../widgets/subject_card.dart';
import '../../shared/widgets/grid_view.dart';
import '../../shared/widgets/textform_field.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
   TextEditingController searchController = TextEditingController();

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
  }

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
                  Text(
                    'Hi ',
                    style: heading3.copyWith(color: silverChalice.shade900),
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
                                return CustomGridView(
                                  childAspectRatio: context.screenWidth >= 600
                                      ? 0.4 + context.screenWidth * 0.001
                                      : 0.1 + context.screenWidth * 0.002,
                                  itemLength: filteredData.length,
                                  itemBuilder: (context, index) {
                                    final subjectData = filteredData[index];
                                    return InkWell(
                                      onTap: () {
                                        context.router.push(
                                          ModuleRoute(
                                            subjectId : subjectData.id),
                                        );
                                      },
                                      child: SubjectCard(
                                        courseTitle: subjectData.title,
                                        imageUrl: subjectData.image,
                                        description: subjectData.description,
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
