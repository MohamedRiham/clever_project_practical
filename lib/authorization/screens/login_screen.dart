import 'package:clever_project_practical/authorization/screens/user_details_screen.dart';
import 'package:clever_project_practical/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clever_project_practical/authorization/models/details.dart';
import 'package:clever_project_practical/authorization/provider/authorization_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController(
    text: "Vanessa N Jenny",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "123456",
  );
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthorizationProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,

            child: Column(
              children: [
                Image.asset('assets/images/logo.jpg', fit: BoxFit.cover),
                const SizedBox(height: 32),
                CustomTextField(
                  controller: usernameController,
                  hintText: 'User Name',
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                ),

                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  icon: Icons.password,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Details details = Details(
                          userName: usernameController.text,
                          password: passwordController.text,
                        );
                        authProvider.setUserDetails(details);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailsScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login As Authorized Officer',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFFFF7043),
                    side: BorderSide(color: Color(0xFFFF7043)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    backgroundColor: Color(0xFFFF7043).withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Login As a User'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
