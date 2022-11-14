import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_dawg/menu/camera_page.dart';
import 'package:go_dawg/menu/contact_page.dart';
import 'package:go_dawg/menu/group_study_page.dart';
import 'package:go_dawg/menu/subjects_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int index = 0;

  @override
  Widget build(BuildContext context) {

    List<String> menuPageTitles = ["Subjects", "Group Study", "Camera", "Contact"];
    List<Widget> menuPages = const [
      SubjectsPage(),
      GroupStudyPage(),
      ContactPage(),
      CameraPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu)
        ),
        elevation: 0.0,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(menuPageTitles[index], style: const TextStyle(fontSize: 24.0),),
        actions: [
          index == 0? IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.star, color: Colors.yellow,)
          ) : const SizedBox.shrink()
        ],
      ),
      body: menuPages[index],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        //unselectedLabelStyle: TextStyle(color: Colors.grey),
        elevation: 0.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), label: "Subjects"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.group), label: "Group Study"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.camera), label: "Camera"),
        ],
        currentIndex: index,
        selectedItemColor: Colors.deepPurple,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
      ),

    );
  }
  


}


