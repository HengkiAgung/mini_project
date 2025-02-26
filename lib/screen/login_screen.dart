import 'package:flutter/material.dart';
import 'package:mini_project/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.infinity,
        margin: EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        alignment: AlignmentDirectional.center,
        child: ListView(
          children: [
            const Text(
              "Work Focus",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
            const Text(
              "Track your activity work",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: isDark ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: isDark ? Colors.black : Colors.white,
                  ),
                  child: Text("Sign Up"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text("Login", style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),

            Text("Password", style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text("Forgot Password?", textAlign: TextAlign.right),
            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MainScreen();
                    },
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.black : Colors.white,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Dont have an account?",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text("Sign Up", style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
