import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idea1/view/screens/auth/edit_profile_screen.dart';
import 'package:idea1/view/screens/auth/register_screen.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/auth_viewmodel.dart';
import '../../../view/screens/auth/login_screen.dart';
import '../../../view/screens/home/home_screen.dart';
import '../../../view/screens/home/profile_screen.dart';
import '../../../view/screens/auth/edit_profile_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  redirect: (BuildContext context, GoRouterState state) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final isLoggedIn = authViewModel.user != null;
    final goingToLogin = state.uri.toString() == '/login';

    // Si está logueado y va a login, redirigir a home
    if (isLoggedIn && goingToLogin) return '/home';
    return null;
  },
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfileScreen(),
    ),
  ],
);
