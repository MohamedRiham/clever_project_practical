import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clever_project_practical/authorization/provider/authorization_provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthorizationProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('User Details'), centerTitle: true),
      body: authProvider.userDetails == null
          ? const Center(child: Text('No user details available'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Username',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(authProvider.userDetails?.userName ?? '__'),
                  const SizedBox(height: 16),
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(authProvider.userDetails?.password ?? '__'),
                ],
              ),
            ),
    );
  }
}
