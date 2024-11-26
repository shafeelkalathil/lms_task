import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home/view_model/subject_state.dart';
import '../model/module_video_model.dart';
import '../repositories/module_video_repositories.dart';

final moduleVideoViewModelProvider  = StateNotifierProvider(
      (ref) => ModuleVideoViewModel(
        moduleVideoRepositories: ref.read(moduleVideoRepositoriesProvider),
  ),
);

final moduleVideoStreamProvider = StreamProvider.family<List<ModuleVideoModel>, int>(
      (ref, moduleId) => ref.read(moduleVideoViewModelProvider.notifier).getAllVideoByModule(moduleId: moduleId),
);

class ModuleVideoViewModel extends StateNotifier<SubjectState>{
  ModuleVideoViewModel({required this.moduleVideoRepositories}) : super(SubjectInitial());

  final ModuleVideoRepositories moduleVideoRepositories;

  Stream<List<ModuleVideoModel>> getAllVideoByModule({required int moduleId}) {
    return moduleVideoRepositories.getAllVideoByModule(moduleId: moduleId);
  }

}
