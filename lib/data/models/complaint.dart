class Complaint {
  final String title;
  final String? description;

  Complaint({
    required this.title,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'title': title,
    };
    if (description != null && description!.isNotEmpty) {
      data['description'] = description;
    }
    return data;
  }
}