class AllCompany {
  final int id;
  final String name;
  final String? logo;
  final String? description;
  final String? website;
  final String? email;  // إضافة email
  final String address;
  final int employees;
  final String createdAt;  // إضافة createdAt لتخزين التاريخ
  final int? opportunityCount; // جعلها optional

  AllCompany({
    required this.id,
    required this.name,
    this.logo,
    this.description,
    this.website,
    this.email,
    required this.address,
    required this.employees,
    required this.createdAt,
    this.opportunityCount,
  });

  factory AllCompany.fromJson(Map<String, dynamic> json) {
    return AllCompany(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      description: json['description'],
      website: json['website'],
      email: json['email'],  // تضمين email
      address: json['address'],
      employees: json['employees'],
      createdAt: json['created_at'],  // تضمين createdAt
      opportunityCount: 0, // لا يوجد في الـ JSON الحالي
    );
  }
}
