import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lms_task/features/home/view_model/subject_state.dart';
import '../model/subject_model.dart';
import '../repositories/home_repositories.dart';

final homeViewModelProvider  = StateNotifierProvider(
    (ref) => HomeViewModel(
      homeRepositories: ref.read(homeRepositoriesProvider),
    ),
);

final subjectsStreamProvider = StreamProvider(
  (ref) => ref.read(homeViewModelProvider.notifier).getAllSubjects(),
);

class HomeViewModel extends StateNotifier<SubjectState>{
  HomeViewModel({required this.homeRepositories}) : super(SubjectInitial());

  final HomeRepositories homeRepositories;

  Stream<List<SubjectModel>> getAllSubjects() {
    return homeRepositories.getAllSubjects();
  }

}
