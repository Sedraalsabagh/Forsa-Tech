class Complaint {
  final String title;
  final String description; 
  Complaint({
    required this.title,
    required this.description, 
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'description': description, 
    };
  }
}