class Company {
  final String name;
  final String? logoUrl;  // إضافة خاصية الشعار

  Company({required this.name, this.logoUrl});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['company'],
      logoUrl: json['company_logo'], // تأكد من وجود هذه الخاصية في الـ JSON
    );
  }
}
