import 'package:flutter/material.dart';

class Welcomebot extends StatefulWidget {
  const Welcomebot({super.key});

  @override
  State<Welcomebot> createState() => _WelcomebotState();
}

class _WelcomebotState extends State<Welcomebot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF1B1037),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Meet the",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Echo Mind!",
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.purpleAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/bot.png', //
                    height: 250,
                  ),
                  Positioned(
                    top: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(60, 181, 80, 80),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Need our help now?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 24, 22, 22),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_forward, color: Colors.white),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 15,
                          color: Colors.white,
                        )
                      ],
                    ),
                    width: 400,
                    margin: EdgeInsets.only(bottom: 40),
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(colors: [
                          Color(0xFF8E2DE2),
                          Color(0xFF4A00E0),
                        ]))),
              )
            ],
          ),
        ),
      )),
    );
  }
}
