
abstract class SubjectState {}

class SubjectInitial extends SubjectState {}

class SubjectLoading extends SubjectState {}

class SubjectSuccess extends SubjectState {

  SubjectSuccess(this.message);
  final String message;
}

class SubjectFailure extends SubjectState {

  SubjectFailure(this.message);
  final String message;
}

