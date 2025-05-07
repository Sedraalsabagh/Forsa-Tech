import 'package:animate_do/animate_do.dart';
import 'package:devloper_app/presentaion/screen/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/complaint_cubit.dart';
import '../../business_logic/cubit/complaint_state.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fD),
      appBar: const CustomAppBar(title: "Customer feedback"),
      body: BlocConsumer<ComplaintCubit, ComplaintState>(
        listener: (context, state) {
          if (state.status == ComplaintStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.white),
                    SizedBox(width: 8),
                    Text('Your message has been sent successfully.'),
                  ],
                ),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                action: SnackBarAction(
                  label: 'Ok',
                  textColor: Colors.white,
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            );

            // مسح الحقول بعد ما ينجح الارسال
            _titleController.clear();
            _descController.clear();
            _formKey.currentState?.reset();
          } else if (state.status == ComplaintStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error ?? 'Failed to send message'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );

            // إذا كان الخطأ بيتعلق بالمصادقة
            if (state.error?.contains('Session has expired') == true ||
                state.error?.contains('You must be logged in.') == true) {
              // توجيه المستخدم لصفحة تسجيل الدخول
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushNamed(context, '/auth/login/');
              });
            }
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 40),
                  FadeInDown(
                    delay: const Duration(milliseconds: 300),
                    duration: const Duration(milliseconds: 400),
                    child: const Text(
                      'Send your feedback  📩',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF15406A),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 33),
                  FadeInDown(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 400),
                    child: Container(
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
                      child: TextFormField(
                        controller: _titleController,
                        maxLines: 2,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the message';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          labelText: 'Title *',
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B1A6B),
                          ),
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          hintText: 'Write your message here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInDown(
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 400),
                    child: Container(
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
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        controller: _descController,
                        maxLines: 2,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter description'; 
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          labelText: 'Description',
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B1A6B),
                          ),
                          hintText: 'Enter additional details if you wish',
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 400),
                    child: Container(
                      margin: const EdgeInsets.all(50),
                      height: 45,
                      width: 60,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4A15F4),
                            Color(0xFF6B1A6B),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff4a1548).withOpacity(0.3),
                            offset: const Offset(0, 10),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: state.status == ComplaintStatus.loading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<ComplaintCubit>()
                                      .submitComplaint(
                                        title: _titleController.text.trim(),
                                        description:
                                            _descController.text.trim().isEmpty
                                                ? null
                                                : _descController.text.trim(),
                                      );
                                }
                              },
                        child: state.status == ComplaintStatus.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Sending',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    letterSpacing: 0.3),
                              ),
                      ),
                    ),
                  ),
                  if (state.status == ComplaintStatus.failure) ...[
                    const SizedBox(height: 12),
                    Text(
                      'error: ${state.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
