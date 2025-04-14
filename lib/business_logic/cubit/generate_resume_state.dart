abstract class CVState {}

class CVInitial extends CVState {}

class CVLoading extends CVState {}

class CVSuccess extends CVState {
  final String message;
  final Map<String, dynamic> data;

  CVSuccess(this.message, this.data);
}

class CVError extends CVState {
  final String error;

  CVError(this.error);
}
