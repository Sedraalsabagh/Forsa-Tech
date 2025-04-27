import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final IconData icon;
  final String hint;

  final List<Color> gradientColors;

  const CustomSearch({
    Key? key,
    required this.icon,
    required this.gradientColors,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 250, 249, 249).withOpacity(0.2),
            blurRadius: 100,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        style: const TextStyle(
          color: Color.fromARGB(255, 30, 24, 24),
        ),
        decoration: InputDecoration(
          prefixIcon: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Icon(icon, color: Colors.white, size: 19),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 9, 7, 7).withOpacity(0.6),
            fontSize: 13,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
