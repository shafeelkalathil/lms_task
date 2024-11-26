import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home/view_model/subject_state.dart';
import '../model/module_model.dart';
import '../repositories/module_repositories.dart';

final moduleViewModelProvider  = StateNotifierProvider(
      (ref) => ModuleViewModel(
    moduleRepositories: ref.read(moduleRepositoriesProvider),
  ),
);

final modulesStreamProvider = StreamProvider.family<List<ModuleModel>, int>(
      (ref, subjectId) => ref.read(moduleViewModelProvider.notifier).getAllModulesBySubject(subjectId: subjectId),
);

class ModuleViewModel extends StateNotifier<SubjectState>{
  ModuleViewModel({required this.moduleRepositories}) : super(SubjectInitial());

  final ModuleRepositories moduleRepositories;

  Stream<List<ModuleModel>> getAllModulesBySubject({required int subjectId}) {
    return moduleRepositories.getAllModulesBySubject(subjectId: subjectId);
  }

}
