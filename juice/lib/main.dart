import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juice/data.dart';
import 'package:juice/juiceDetails.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Juicy",
          style: TextStyle(
            fontSize: 30,
            color: Colors.deepOrange  ,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: juiceList.length,
                  itemBuilder: (ctx, index) {
                    return JuiceWidget(
                      juice: juiceList[index],
                    );
                  }),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Container(
                height: 45,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                color: Colors.white.withOpacity(0.1),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.deepOrange,
                        child: Image.network(
                            'https://flutter4fun.com/wp-content/uploads/2021/09/Home.png'),
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.deepOrange,
                        child: Image.network(
                            'https://flutter4fun.com/wp-content/uploads/2021/09/Search.png'),
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.deepOrange,
                        child: Image.network(
                            'https://flutter4fun.com/wp-content/uploads/2021/09/Heart.png'),
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.deepOrange,
                        radius: 100,
                        child: Image.network(
                            'https://flutter4fun.com/wp-content/uploads/2021/09/account.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class JuiceWidget extends StatelessWidget {
  final JuiceEntity juice;

  const JuiceWidget({super.key, required this.juice});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return JuiceDetailsPage(
            juiceEntity: juice,
          );
        }));
      },
      child: AspectRatio(
        aspectRatio: 1.25,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final topPadding = constraints.maxHeight * 0.2;
            final leftPadding = constraints.maxWidth * 0.1;
            final imageWidth = constraints.maxWidth * 0.35;
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: topPadding,),
                  decoration: BoxDecoration(
                      color: juice.color,
                      borderRadius: BorderRadius.circular(24)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: topPadding,
                          left: leftPadding,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              juice.name,
                              style: textStyle.copyWith(fontSize: 20),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$',
                                    style: textStyle.copyWith(fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: juice.price,
                                    style: textStyle.copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Buy NOW",
                                  style: textStyle.copyWith(
                                      color: const Color(0xFFDC691F)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: imageWidth,
                      child: Hero(
                        tag: "${juice.image}",
                        child: Image.network(
                          juice.image,
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
