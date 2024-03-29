import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Text("FORGET SCREEN")
        ],
      ),
    );
  }
}
