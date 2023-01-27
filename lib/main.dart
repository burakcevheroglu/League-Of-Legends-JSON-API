import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:lol_api/api.dart';
import 'package:lol_api/champWidget.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.montserratTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white38,
        ),
        ),
      themeMode: ThemeMode.dark,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('lunas.gg'),
        actions: [
          InkWell(
            onTap: () {},
            child: const CircleAvatar(
              child: Text('L'),
            ),
          ),
          const SizedBox(width: 10,)
        ],
      ),


      body: const MainPage(),


      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,), label: 'Home', activeIcon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_outlined), label: 'Champions'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
        currentIndex: 1,
        onTap: (index){},
      ),



    );
  }
}



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: makeCall(),
      builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){

          return const CircularProgressIndicator();
        }
        else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        else{
          return ListView.builder(
            itemCount: champs.length,
            itemBuilder: (context, index){
              return ChampionWidget(champion: champs[index]);
            },
          );
        }
      },
    );
  }
}
