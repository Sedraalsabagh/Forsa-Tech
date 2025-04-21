class JobCard {
  final String? title;
  final String? companyLogo;
  final String? experienceLevel;
  final String? yearsOfExperience;
  final String? location;
  final String? companyName;
  final String? postingDate;

  JobCard({
    this.title,
    this.companyLogo,
    this.experienceLevel,
    this.yearsOfExperience,
    this.location,
    this.companyName,
    this.postingDate,
  });

  factory JobCard.fromJson(Map<String, dynamic> json) {
    return JobCard(
      title: json['title'],
      companyLogo: json['company_logo'],
      experienceLevel: json['experience_level'],
      yearsOfExperience: json['years_of_experience'],
      location: json['location'],
      companyName: json['company_name']?.replaceAll(',', ''),
      postingDate: json['posting_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'company_logo': companyLogo,
      'experience_level': experienceLevel,
      'years_of_experience': yearsOfExperience,
      'location': location,
      'company_name': companyName,
      'posting_date': postingDate,
    };
  }
}
