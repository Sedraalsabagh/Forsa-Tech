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
      child: TextField(
        style: const TextStyle(color: Color(0xFF101010)),
        decoration: InputDecoration(
          prefixIcon: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFF101010),
            fontSize: 16,
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
