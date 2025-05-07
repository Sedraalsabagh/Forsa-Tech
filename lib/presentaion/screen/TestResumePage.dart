// import 'package:devloper_app/data/models/convertcvmodel.dart';
// import 'package:devloper_app/data/models/resumemodel.dart';
// import 'package:flutter/material.dart';

// /// 

// class TestResumePage extends StatelessWidget {
//   const TestResumePage({super.key});

//   @override
//   Widget build(BuildContext context) {
   
//     final resume = ResumeModel(
//       skills: [
//         SkillResume(skill: 'Dart', level: 'Advanced'),
//         SkillResume(skill: 'Flutter', level: 'Intermediate'),
//       ],
//       education: [
//         EducationResume(
//           degree: 'B.Sc in Computer Science',
//           institution: 'Al-Sham University',
//           startDate: '2019',
//           endDate: '2023',
//         ),
//       ],
//       experiences: [
//         ExperienceResume(
//           jobTitle: 'Flutter Developer',
//           company: 'Tech Corp',
//           startDate: '2023-01',
//           endDate: '2024-01',
//           description: 'Developed mobile applications.',
//         ),
//       ],
//     );

//     return Scaffold(
//       appBar: AppBar(title: const Text("Test Resume Modal")),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text("Open Resume Modal"),
//           onPressed: () {
//             showApplicationDialog(context, resume);
//           },
//         ),
//       ),
//     );
//   }
// }



// void showApplicationDialog(BuildContext context, ResumeModel resume) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     builder: (context) {
//       return DefaultTabController(
//         length: 3,
//         child: Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TabBar(
//                 tabs: [
//                   Tab(text: 'Skills'),
//                   Tab(text: 'Education'),
//                   Tab(text: 'Experience'),
//                 ],
//               ),
//               Container(
//                 height: 400,
//                 child: TabBarView(
//                   children: [
//                     SkillsForm(resume),
//                     EducationForm(resume),
//                     ExperienceForm(resume),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
                 
//                     Navigator.pop(context);
//                   },
//                   child: Text("Apply Now"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }



// class SkillsForm extends StatelessWidget {
//   final ResumeModel resume;

//   const SkillsForm(this.resume, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final skills = resume.skills ?? [];

//     return ListView.builder(
//       itemCount: skills.length,
//       itemBuilder: (context, index) {
//         final skill = skills[index];
//         return ListTile(
//           leading: Icon(Icons.check_circle_outline),
//           title: Text(skill.skill ?? 'No Skill'),
//           subtitle: Text('Level: ${skill.level ?? 'N/A'}'),
//         );
//       },
//     );
//   }
// }
// ///
// class EducationForm extends StatelessWidget {
//   final ResumeModel resume;

//   const EducationForm(this.resume, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final educationList = resume.education ?? [];

//     return ListView.builder(
//       itemCount: educationList.length,
//       itemBuilder: (context, index) {
//         final education = educationList[index];
//         return ListTile(
//           leading: Icon(Icons.school),
//           title: Text(education.degree ?? 'No Degree'),
//           subtitle: Text('${education.institution ?? ''}\n${education.startDate} - ${education.endDate}'),
//           isThreeLine: true,
//         );
//       },
//     );
//   }
// }
// ////
// class ExperienceForm extends StatelessWidget {
//   final ResumeModel resume;

//   const ExperienceForm(this.resume, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final experiences = resume.experiences ?? [];

//     return ListView.builder(
//       itemCount: experiences.length,
//       itemBuilder: (context, index) {
//         final exp = experiences[index];
//         return ListTile(
//           leading: Icon(Icons.work_outline),
//           title: Text(exp.jobTitle ?? 'No Title'),
//           subtitle: Text('${exp.company}\n${exp.startDate} - ${exp.endDate}\n${exp.description}'),
//           isThreeLine: true,
//         );
//       },
//     );
//   }
// }


