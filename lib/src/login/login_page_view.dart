import 'package:flutter/material.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  static const routeName = '/login';

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Image.asset('assets/images/amico.png'),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Log in',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF36454F),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '   Email',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF36454F),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD3D3D3),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Johndoe@example.com',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF36454F).withOpacity(0.5),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      height: 0.8,
                      color: Color(0xFF36454F),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '   Api Key',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF36454F),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD3D3D3),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      height: 0.8,
                      color: Color(0xFF36454F),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //TODO action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1976D2),
                      foregroundColor: const Color(0xFFD3D3D3),
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Set the border radius
                      ),
                    ),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
