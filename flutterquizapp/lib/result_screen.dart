import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterquizapp/Provider/quiz_provider.dart';
import 'package:flutterquizapp/Utils/custom_widgets.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  CustomWidget cus = CustomWidget();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    var snapshots = FirebaseFirestore.instance.collection('user');
    final user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.uid)
        .update({'wrong': 0, 'correct': 0});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<QuizProvider>(
      builder: (context, providerquiz, child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cus.textCus("Correct Answer: ${providerquiz.correct.toString()}",
                  26, FontWeight.bold, Colors.black),
              cus.sizeboxCus(20),
              cus.textCus("Wrong Answer: ${providerquiz.wrong.toString()}", 26,
                  FontWeight.bold, Colors.black),
            ],
          ),
        );
      },
    ));
  }
}
