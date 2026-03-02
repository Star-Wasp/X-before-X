import 'package:flutter/material.dart';
import 'package:x_before_x/customWidgets.dart';
import 'package:x_before_x/pages/ListofChallangeLists.dart';
import 'package:x_before_x/pages/challangeList.dart';
import 'package:x_before_x/storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = '';
  int userAge = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('~ SETUP ~'),
        ),
        body: Expanded(
          child: ListView(
            children: [
              Center(
                child: Text(
                  'Welcome!\nLet\'s get you all set up!',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              PopUpBox(
                title: 'Enter name',
                buttonText: Text('What\'s your name?'),
                hintText: 'enter your name...',
                onSubmit: (value) {
                  setState(() {
                    userName = value;
                  });
                },
              ),
              PopUpBox(
                title: 'Enter age',
                buttonText: Text('How old are you?'),
                hintText: 'enter your age...',
                onSubmit: (value) {
                  setState(() {
                    userAge = int.parse(value);
                  });
                },
              ),
              NavigationButton(
                text: 'next',
                page: ChallangeListPage(name: userName, age: userAge),
              )
            ],
          ),
        ));
  }
}
