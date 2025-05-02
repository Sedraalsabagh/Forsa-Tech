import 'package:devloper_app/data/models/company_ads.dart';

class Opportunity {
  final int? id;
  final String? title;
  final String? description;
  final String? employmentType;
  final String? location;
  final String? salaryRange;
  final String? currency;
  final String? experienceLevel;
  final String? requiredSkills;
  final String? preferredSkills;
  final String? educationLevel;
  final String? certifications;
  final String? languagesRequired;
  final String? yearsOfExperience;
  final String? postingDate;
  final String? applicationDeadline;
  final String? status;
  final String? benefits;
  // final Company? company;

  Opportunity({
    this.id,
    this.title,
    this.description,
    this.employmentType,
    this.location,
    this.salaryRange,
    this.currency,
    this.experienceLevel,
    this.requiredSkills,
    this.preferredSkills,
    this.educationLevel,
    this.certifications,
    this.languagesRequired,
    this.yearsOfExperience,
    this.postingDate,
    this.applicationDeadline,
    this.status,
    this.benefits,
    // this.company,
  });

  factory Opportunity.fromJson(Map<String, dynamic> json) {
    return Opportunity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      employmentType: json['employment_type'],
      location: json['location'],
      salaryRange: json['salary_range'],
      currency: json['currency'],
      experienceLevel: json['experience_level'],
      requiredSkills: json['required_skills'],
      preferredSkills: json['preferred_skills'],
      educationLevel: json['education_level'],
      certifications: json['certifications'],
      languagesRequired: json['languages_required'],
      yearsOfExperience: json['years_of_experience'],
      postingDate: json['posting_date'],
      applicationDeadline: json['application_deadline'],
      status: json['status'],
      benefits: json['benefits'],
      // company:
      //     json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'employment_type': employmentType,
      'location': location,
      'salary_range': salaryRange,
      'currency': currency,
      'experience_level': experienceLevel,
      'required_skills': requiredSkills,
      'preferred_skills': preferredSkills,
      'education_level': educationLevel,
      'certifications': certifications,
      'languages_required': languagesRequired,
      'years_of_experience': yearsOfExperience,
      'posting_date': postingDate,
      'application_deadline': applicationDeadline,
      'status': status,
      'benefits': benefits,
      // 'company': company?.toJson(),
    };
  }
}
