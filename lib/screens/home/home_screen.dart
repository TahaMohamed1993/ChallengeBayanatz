// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../module/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var fbm = FirebaseMessaging.instance;
  @override
  void initState() {
    fbm.getToken().then((token) => print(token));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacementNamed(
                    'MyLogin'); // Replace '/login' with your desired route after signing out
              },
              icon: const Icon(Icons.exit_to_app)),
          IconButton(
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              icon: isDark
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode)),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page '),
      ),
      body: GridView.builder(
        itemCount: item.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 2,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) => Stack(
          children: [
            Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      item[index].imageAssets,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                      child: Text(
                        item[index].itemName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      item[index].price,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
