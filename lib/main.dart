import 'package:flutter/material.dart';
import 'package:pokeman_app/HomeScreen.dart';
import 'package:provider/provider.dart';

import 'ViewModel/ViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider( providers:[
      ChangeNotifierProvider(create: (_) => UserViewModel(),
      ),
    ],
        child:MaterialApp(
          title: 'Pokemons',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: Home(),
        ),

    );
  }
}


