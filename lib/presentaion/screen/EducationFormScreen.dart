import 'package:devloper_app/presentaion/screen/widget/decorationText.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final descriptionCtrl = TextEditingController();
  final institutionCtrl = TextEditingController();
  final startDateCtrl = TextEditingController();
  final endDateCtrl = TextEditingController();

  String? selectedDegree;
  final degrees = ['High School', 'Bachelor', 'Master', 'PhD'];

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
                children: [
                  Icon(Icons.school, color: Colors.orange),
                  SizedBox(width: 8),
                  Text(
                    'Add new education',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 13),
            DropdownField(
              label: 'Degree',
              items: degrees,
              selectedItem: selectedDegree,
              onChanged: (val) => setState(() => selectedDegree = val),
            ),
            SizedBox(height: 10),
            TextInputField(label: 'Institution', controller: institutionCtrl),
            SizedBox(height: 10),
            TextInputField(label: 'Description', controller: descriptionCtrl),
            SizedBox(height: 10),
            DateInputField(label: 'Start Date', controller: startDateCtrl),
            SizedBox(height: 10),
            DateInputField(label: 'End Date', controller: endDateCtrl),
            SizedBox(height: 10),

            // زر Add
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Add pressed');
                },
                child: Text(
                  'Add +',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00AFFF),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 1,
                ),
              ),
            ),

            SizedBox(height: 9),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Save pressed');
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6A1B9A),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
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
