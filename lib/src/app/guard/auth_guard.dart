import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pizza/src/app/api/auth_provider.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.token == null) {
          // If not authenticated, redirect to login
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamed(context, '/login');
          });
          return const SizedBox.shrink();
        } else {
          return child!;
        }
      },
      child: child,
    );
  }
}
