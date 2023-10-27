import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterquizapp/Model/OpponentModel.dart';
import 'package:flutterquizapp/Model/user_model.dart';
import 'package:flutterquizapp/Provider/quiz_provider.dart';
import 'package:flutterquizapp/Utils/app_colors.dart';
import 'package:flutterquizapp/Utils/custom_widgets.dart';
import 'package:flutterquizapp/services/dbuser_services.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  CustomWidget cus = CustomWidget();
  DbuserServices dbopponent = DbuserServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    var snapshots = FirebaseFirestore.instance.collection('user');
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.uid)
        .update({'correct': 0, 'wrong': 0});
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.uid)
        .update({'correct': 0, 'wrong': 0});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<QuizProvider>(
      builder: (context, providerquiz, child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 400,
                  child: Column(
                    children: [
                      StreamBuilder<List<UserModel>>(
                        stream: dbopponent.getCurrentUser(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator(
                              color: Colors.transparent,
                            );
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Text('No User Available');
                          }
                          return Expanded(
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                final currentuser = snapshot.data![index];
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        cus.textCus(
                                            "Current User: ${currentuser.name} ",
                                            20,
                                            FontWeight.bold,
                                            AppColor().blackColor),
                                        Row(
                                          children: [
                                            cus.textCus(
                                                "Correct: ",
                                                20,
                                                FontWeight.bold,
                                                AppColor().blackColor),
                                            cus.textCus(
                                                "${currentuser.correct}",
                                                20,
                                                FontWeight.bold,
                                                AppColor().correctColor),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            cus.textCus(
                                                " Wrong: ",
                                                20,
                                                FontWeight.bold,
                                                AppColor().blackColor),
                                            cus.textCus(
                                                "${currentuser.wrong}",
                                                20,
                                                FontWeight.bold,
                                                AppColor().wrongColor)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 400,
                  child: Column(
                    children: [
                      StreamBuilder<List<OpponentModel>>(
                        stream: dbopponent.getOpponentUser(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator(
                              color: Colors.transparent,
                            );
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Text('No User Available');
                          }
                          return Expanded(
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                final opponent = snapshot.data![index];
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        cus.textCus(
                                            "Current User: ${opponent.name} ",
                                            20,
                                            FontWeight.bold,
                                            AppColor().blackColor),
                                        Row(
                                          children: [
                                            cus.textCus(
                                                "Correct: ",
                                                20,
                                                FontWeight.bold,
                                                AppColor().blackColor),
                                            cus.textCus(
                                                "${opponent.correct}",
                                                20,
                                                FontWeight.bold,
                                                AppColor().correctColor),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            cus.textCus(
                                                " Wrong: ",
                                                20,
                                                FontWeight.bold,
                                                AppColor().blackColor),
                                            cus.textCus(
                                                "${opponent.wrong}",
                                                20,
                                                FontWeight.bold,
                                                AppColor().wrongColor)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
