class JobCard {
  final int? id;
  final String? title;
  final String? companyLogo;
  final String? experienceLevel;
  final String? yearsOfExperience;
  final String? location;
  final String? companyName;
  final String? postingDate;
  final String? jobType;

  JobCard(
      this.id,
      this.title,
      this.companyLogo,
      this.experienceLevel,
      this.yearsOfExperience,
      this.location,
      this.companyName,
      this.postingDate,
      this.jobType);

  factory JobCard.fromJson(Map<String, dynamic> json) {
    return JobCard(
      json['id'],
      json['title'],
      json['company_logo'],
      json['experience_level'],
      json['years_of_experience'],
      json['location'],
      json['company_name']?.replaceAll(',', ''),
      json['posting_date'],
      json['jobType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
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
