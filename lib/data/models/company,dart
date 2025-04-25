class Company {
  final String? name;
  final String? logo;
  final String? website;
  final String? description;
  final String? email;
  final String? address;
  final int? employees;

  Company({
    this.name,
    this.logo,
    this.website,
    this.description,
    this.email,
    this.address,
    this.employees,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      logo: json['logo'],
      website: json['website'],
      description: json['description'],
      email: json['email'],
      address: json['address'],
      employees: json['employees'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'logo': logo,
      'website': website,
      'description': description,
      'email': email,
      'address': address,
      'employees': employees,
    };
  }
}
