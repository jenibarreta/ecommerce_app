import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String username = "admin";
  String password = "admin123";

  void signin() {
    if(_usernameController.text == username && _passwordController.text == password) {
      // Redirect to Home Screen
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
    } else {
      // Show error snackbar
       const snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: 'Invalid username or password',
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),

          // LOGO
          Center(child: Image.asset('assets/images/logo.png', height: 200)),

          const SizedBox(height: 5),

          // Welcome Message
          Column(
            children: const [
              Text(
                'Welcome to MyShop!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Your one-stop store for quality products',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Username TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Password TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Sign In Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: signin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Sign In'),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Sign Up Button (Navigation)
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              );
            },
            child: const Text("Don't have an account? Sign Up"),
          ),
        ],
      ),
    );
  }
}
