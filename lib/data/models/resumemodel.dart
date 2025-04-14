class ResumeModel {
  final String? username;
  final String? email;
  final String? phone;
  final String? location;
  final String? githubLink;
  final String? linkedinLink;
  final String? summary;
  final List<SkillResume>? skills;
  final List<EducationResume>? education;
  final List<ProjectResume>? projects;
  final List<ExperienceResume>? experiences;
  final List<TrainingCourseResume>? trainingsCourses;

  ResumeModel({
    this.username,
    this.email,
    this.phone,
    this.location,
    this.githubLink,
    this.linkedinLink,
    this.summary,
    this.skills,
    this.education,
    this.projects,
    this.experiences,
    this.trainingsCourses,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "location": location,
        "github_link": githubLink,
        "linkedin_link": linkedinLink,
        "summary": summary,
        "skills": skills?.map((s) => s.toJson()).toList(),
        "education": education?.map((e) => e.toJson()).toList(),
        "projects": projects?.map((p) => p.toJson()).toList(),
        "experiences": experiences?.map((e) => e.toJson()).toList(),
        "trainings_courses": trainingsCourses?.map((t) => t.toJson()).toList(),
      };

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      location: json["location"],
      githubLink: json["github_link"],
      linkedinLink: json["linkedin_link"],
      summary: json["summary"],
      skills: (json["skills"] as List?)
          ?.map((s) => SkillResume.fromJson(s))
          .toList(),
      education: (json["education"] as List?)
          ?.map((e) => EducationResume.fromJson(e))
          .toList(),
      projects: (json["projects"] as List?)
          ?.map((p) => ProjectResume.fromJson(p))
          .toList(),
      experiences: (json["experiences"] as List?)
          ?.map((e) => ExperienceResume.fromJson(e))
          .toList(),
      trainingsCourses: (json["trainings_courses"] as List?)
          ?.map((t) => TrainingCourseResume.fromJson(t))
          .toList(),
    );
  }
}

class SkillResume {
  final String? skill;
  final String? level;

  SkillResume({this.skill, this.level});

  Map<String, dynamic> toJson() => {
        "skill": skill,
        "level": level,
      };

  factory SkillResume.fromJson(Map<String, dynamic> json) {
    return SkillResume(
      skill: json["skill"],
      level: json["level"],
    );
  }
}

class EducationResume {
  final String? degree;
  final String? institution;
  final String? description;
  final String? startDate;
  final String? endDate;

  EducationResume({
    this.degree,
    this.institution,
    this.description,
    this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toJson() => {
        "degree": degree,
        "institution": institution,
        "description": description,
        "start_date": startDate,
        "end_date": endDate,
      };

  factory EducationResume.fromJson(Map<String, dynamic> json) {
    return EducationResume(
      degree: json["degree"],
      institution: json["institution"],
      description: json["description"],
      startDate: json["start_date"],
      endDate: json["end_date"],
    );
  }
}

class ProjectResume {
  final String? title;
  final String? description;
  final String? githubLink;

  ProjectResume({this.title, this.description, this.githubLink});

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "github_link": githubLink,
      };

  factory ProjectResume.fromJson(Map<String, dynamic> json) {
    return ProjectResume(
      title: json["title"],
      description: json["description"],
      githubLink: json["github_link"],
    );
  }
}

class ExperienceResume {
  final String? jobTitle;
  final String? company;
  final String? startDate;
  final String? endDate;
  final String? description;

  ExperienceResume({
    this.jobTitle,
    this.company,
    this.startDate,
    this.endDate,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        "job_title": jobTitle,
        "company": company,
        "start_date": startDate,
        "end_date": endDate,
        "description": description,
      };

  factory ExperienceResume.fromJson(Map<String, dynamic> json) {
    return ExperienceResume(
      jobTitle: json["job_title"],
      company: json["company"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      description: json["description"],
    );
  }
}

class TrainingCourseResume {
  final String? title;
  final String? institution;
  final String? startDate;
  final String? endDate;
  final String? description;

  TrainingCourseResume({
    this.title,
    this.institution,
    this.startDate,
    this.endDate,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "institution": institution,
        "start_date": startDate,
        "end_date": endDate,
        "description": description,
      };

  factory TrainingCourseResume.fromJson(Map<String, dynamic> json) {
    return TrainingCourseResume(
      title: json["title"],
      institution: json["institution"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      description: json["description"],
    );
  }
}
