enum ComplaintStatus { initial, loading, success, failure }

class ComplaintState {
  final ComplaintStatus status;
  final String? error;

  ComplaintState({
    this.status = ComplaintStatus.initial,
    this.error,
  });

  ComplaintState copyWith({
    ComplaintStatus? status,
    String? error,
  }) {
    return ComplaintState(
      status: status ?? this.status,
      error: error,
    );
  }
}