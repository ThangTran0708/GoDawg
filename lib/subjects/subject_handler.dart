import 'package:flutter/material.dart';
import 'package:go_dawg/subjects/class_registration_page.dart';
import 'package:go_dawg/subjects/class_selection_page.dart';
import 'package:go_dawg/subjects/course_level_page.dart';
import 'package:go_dawg/subjects/term_page.dart';

class SubjectHandler extends StatelessWidget {
  const SubjectHandler({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    List<String> titles = ["Term", "Course level", "", "Registration"];
    List<Widget> subjectsNavigation = const [
      TermPage(abbreviation: "CS"),
      CourseLevelPage(),
      ClassSelectionPage(),
      ClassRegistrationPage()
    ];

    int navigationIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Term"),
      ),
      body: subjectsNavigation[navigationIndex],
    );
  }
}
