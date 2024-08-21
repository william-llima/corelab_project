import 'package:corelab_project/pages/Product_detail.dart';
import 'package:corelab_project/searchHistory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'pages/Home.dart';
void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SearchHistory()),
    ],
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 180, 204, 1)),
        useMaterial3: true,
      ),
     initialRoute: '/',
      routes: {
        '/':(context)=> const Home(),
      },
    );
  }
}



