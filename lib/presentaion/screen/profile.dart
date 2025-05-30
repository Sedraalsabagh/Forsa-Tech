import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:devloper_app/constants/Colors.dart';
import 'package:devloper_app/presentaion/screen/widget/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  String? _gender;
  DateTime? _birthDate;

  String? _birthDateError;
  String? _genderError;

  Uint8List? _profileImageBytes;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff9333EA),
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
        _birthDateError = null;
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _profileImageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fD),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _profileImageBytes != null
                          ? MemoryImage(_profileImageBytes!)
                          : const AssetImage('images/profile2.jpg')
                              as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: MyColors.myGreadient2,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          icon:
                              const Icon(Icons.camera_alt, color: Colors.white),
                          onPressed: _pickImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 400),
                child: CustomField(
                  controller: _firstNameController,
                  icon: Icons.person_3_outlined,
                  hint: 'First name',
                  gradientColors: MyColors.myGreadient2.colors,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your first name'
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 400),
                child: CustomField(
                  controller: _lastNameController,
                  icon: Icons.person_3_outlined,
                  hint: 'Last name',
                  gradientColors: MyColors.myGreadient2.colors,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your last name'
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 400),
                child: CustomField(
                  controller: _emailController,
                  icon: Icons.email_outlined,
                  hint: 'Email',
                  gradientColors: MyColors.myGreadient2.colors,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            prefixIcon: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return MyColors.myGreadient2
                                    .createShader(bounds);
                              },
                              blendMode: BlendMode.srcIn,
                              child: const Icon(
                                Icons.calendar_today,
                                size: 22,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _birthDate == null
                                    ? 'chose date of birth'
                                    : DateFormat('yyyy - MM - dd')
                                        .format(_birthDate!),
                                style: TextStyle(
                                  color: _birthDate == null
                                      ? Colors.grey[900]
                                      : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_birthDateError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 6, left: 12),
                        child: Text(
                          _birthDateError!,
                          style:  const TextStyle(
                            color: Color.fromARGB(255,185, 55, 48),
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 4, top: 8),
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile<String>(
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  title: const Text('Male'),
                                  value: 'male',
                                  groupValue: _gender,
                                  activeColor: const Color(0xFF3B82F6),
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value;
                                      _genderError = null;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  title: const Text('Female'),
                                  value: 'female',
                                  groupValue: _gender,
                                  activeColor: const Color(0xff9333EA),
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value;
                                      _genderError = null;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (_genderError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 6, left: 12),
                        child: Text(
                          _genderError!,
                          style: const TextStyle(
                            color:  Color.fromARGB(255,185, 55, 48),
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Center(
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    gradient: MyColors.myGreadient2,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      final formValid = _formKey.currentState!.validate();
                      bool valid = true;

                      if (_birthDate == null) {
                        setState(() {
                          _birthDateError = 'Please choose your birth date';
                        });
                        valid = false;
                      }

                      if (_gender == null) {
                        setState(() {
                          _genderError = 'Please select your gender';
                        });
                        valid = false;
                      }

                      if (formValid && valid) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Data saved successfully')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'save',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
