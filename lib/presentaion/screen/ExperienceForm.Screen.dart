import 'package:flutter/material.dart';
import 'package:devloper_app/presentaion/screen/widget/decorationText.dart';

class ExperienceForm1 extends StatefulWidget {
  @override
  _ExperienceFormState createState() => _ExperienceFormState();
}

class _ExperienceFormState extends State<ExperienceForm1> {
  final titleCtrl = TextEditingController();
  final companyCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final startDateCtrl = TextEditingController();
  final endDateCtrl = TextEditingController();

  String? selectedEmploymentType;
  final employmentTypes = ['Full-time', 'Part-time', 'Internship', 'Freelance'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.work, color: Colors.blueAccent),
                  SizedBox(width: 8),
                  Text(
                    'Add new experience',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 13),
            DropdownField(
              label: 'Employment Type',
              items: employmentTypes,
              selectedItem: selectedEmploymentType,
              onChanged: (val) => setState(() => selectedEmploymentType = val),
            ),
            const SizedBox(height: 10),
            TextInputField(label: 'Job Title', controller: titleCtrl),
            const SizedBox(height: 10),
            TextInputField(label: 'Company Name', controller: companyCtrl),
            const SizedBox(height: 10),
            TextInputField(label: 'Description', controller: descriptionCtrl),
            const SizedBox(height: 10),
            DateInputField(label: 'Start Date', controller: startDateCtrl),
            const SizedBox(height: 10),
            DateInputField(label: 'End Date', controller: endDateCtrl),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Add Experience');
                },
                child: const Text(
                  'Add +',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00AFFF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 1,
                ),
              ),
            ),
            const SizedBox(height: 9),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Save Experience');
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A1B9A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
