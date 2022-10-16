import 'package:flutter/material.dart';
import 'package:mirror_wall/uttls/app_componet.dart';

import 'Screens/disney.dart';
import 'Screens/netflix.dart';
import 'Screens/prime.dart';
import 'Screens/sony.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => const Homepage(),
        "Netflix": (context) => const Netflixpage(),
        "Disney": (context) => const Disney(),
        "AmazonPrime": (context) => const Primepage(),
        "SonyLIV": (context) => const SonyLiv(),
      },
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          "OTT Websites",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: banerWidget(
                        image: AppImage.netflix,
                        title: "Netflix",
                        color: Colors.black,
                        onTap: () {
                          Navigator.pushNamed(context, "Netflix");
                        })),
                Expanded(
                    child: banerWidget(
                        image: AppImage.disneyHotstar,
                        title: "Disney+ Hotstar",
                        color: Colors.white,
                        onTap: () {
                          Navigator.pushNamed(context, "Disney");
                        })),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: banerWidget(
                        image: AppImage.amazonPrime,
                        title: "Amazon Prime",
                        color: Colors.white,
                        onTap: () {
                          Navigator.pushNamed(context, "AmazonPrime");
                        })),
                Expanded(
                    child: banerWidget(
                        image: AppImage.sonyLiv,
                        title: "Sony Liv",
                        color: Colors.white,
                        onTap: () {
                          Navigator.pushNamed(context, "SonyLIV");
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }

  banerWidget(
      {required String image,
      required String title,
      required Color color,
      required Function onTap}) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
        child: Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.2),
          ),
          child: Text(title, style: TextStyle(fontSize: 18, color: color)),
        ),
      ),
    );
  }
}
