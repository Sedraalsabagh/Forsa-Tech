class Company {
  final String name;
  final String? logoUrl;

  Company({required this.name, this.logoUrl});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['company'],
      logoUrl: json['company_logo'], 
    );
  }
}
