import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
// ignore_for_file: library_private_types_in_public_api


class TeaPage extends StatefulWidget {
  const TeaPage({Key? key}) : super(key: key);

  @override
  _TeaPageState createState() => _TeaPageState();
}

class _TeaPageState extends State<TeaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFC3A6),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50),
            FadeInRight(
              duration: const Duration(milliseconds: 1500),
              child: Image.network(
                'https://cdn.dribbble.com/users/115278/screenshots/16812737/media/93914b7224e59946c61b9dbde7542628.gif',
                fit: BoxFit.cover,
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 500),
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 50, top: 40, right: 20, bottom: 50),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffFFC3A6).withOpacity(0.5),
                        offset: const Offset(0, -5),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 1000),
                          from: 50,
                          child: const Text(
                            'Discover the best \norganic asian tea.🔥',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 1000),
                          from: 60,
                          child: Text(
                            'Stright from motherland ⛰',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 1000),
                          from: 70,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                // reload the page
                                Navigator.of(context).pushReplacementNamed('/');
                              },
                              child: const Text(
                                'EXPLORE NOW ☕️',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
