import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_day2/fruit_screen.dart';
import 'package:flutter_challenge_day2/info_data.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedPage = 0;
  late PageController pageController;

  List<Info> fruits = [
    Info(
      title: 'Lemon',
      price: 12.7,
      imgURL: 'images/lim.png',
      cardColor: const Color(0xffFFD982),
      bgColor: Colors.transparent,
    ),
    Info(
      title: 'Avocado',
      price: 13.7,
      imgURL: 'images/ava.png',
      bgColor: const Color(0xffFFD981),
      cardColor: const Color(0xff43A99B),
    ),
    Info(
      title: 'Lemon',
      price: 17.7,
      imgURL: 'images/pea.png',
      bgColor: const Color(0xff43A99B),
      cardColor: const Color(0xfffea7b6),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController();
    super.initState();
  }

  void _onChanged(int pageNum) {
    setState(
      () {
        _selectedPage = pageNum;
        pageController.animateToPage(pageNum,
            duration: const Duration(milliseconds: 700),
            curve: Curves.decelerate);
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Explore',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Ashna'),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      const Icon(Icons.search),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const Icon(
                          Icons.dehaze_outlined,
                          size: 28,
                        ),
                        TabBar(
                          title: 'Fruits',
                          selectedPage: _selectedPage,
                          pageNum: 0,
                          onPressed: () {
                            setState(() {
                              _onChanged(0);
                            });
                          },
                        ),
                        TabBar(
                          title: 'Vegtables',
                          selectedPage: _selectedPage,
                          pageNum: 1,
                          onPressed: () {
                            setState(() {
                              _onChanged(1);
                            });
                          },
                        ),
                        TabBar(
                          title: 'Foods',
                          selectedPage: _selectedPage,
                          pageNum: 2,
                          onPressed: () {
                            setState(() {
                              _onChanged(2);
                            });
                          },
                        ),
                        TabBar(
                          title: 'Desserts',
                          selectedPage: _selectedPage,
                          pageNum: 3,
                          onPressed: () {
                            setState(() {
                              _onChanged(3);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    _selectedPage = page;
                  });
                },
                controller: pageController,
                children: [
                  SizedBox(
                    child: ListView.builder(
                      itemCount: fruits.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (ctx, index) => Cards(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => FruitScreen(
                                title: fruits[index].title,
                                price: fruits[index].price,
                                imgURL: fruits[index].imgURL,
                                bgColor: fruits[index].cardColor,
                              ),
                            ),
                          );
                        },
                        cardColor: fruits[index].cardColor,
                        bgColor: fruits[index].bgColor,
                        imgUrl: fruits[index].imgURL,
                        fruitTitle: fruits[index].title,
                        price: fruits[index].price,
                      ),
                      // Cards(
                      //   bgColor: Color(0xffFFD981),
                      //   cardColor: Color(0xff43A99B),
                      //   imgUrl: 'images/ava.png',
                      //   fruitTitle: 'AVOCADO',
                      //   price: 15.7,
                      // ),
                      // Cards(
                      //   bgColor: Color(0xff43A99B),
                      //   cardColor: Color(0xfffea7b6),
                      //   imgUrl: 'images/pea.png',
                      //   fruitTitle: 'PEACH',
                      //   price: 15.7,
                      // ),
                    ),
                  ),
                  Column(
                    children: const [
                      Expanded(
                        child: Center(
                          child: Text('Vegtable'),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Expanded(
                        child: Center(
                          child: Text('Foods'),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Expanded(
                        child: Center(
                          child: Text('Desserts'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final Color bgColor;
  final Color cardColor;
  final String imgUrl;
  final String fruitTitle;
  final double price;
  final VoidCallback onTap;

  const Cards(
      {Key? key,
      required this.bgColor,
      required this.cardColor,
      required this.imgUrl,
      required this.fruitTitle,
      required this.price,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 3.75,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fruitTitle,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text('\$$price',
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontStyle: FontStyle.italic)),
                      ]),
                  Image.asset(
                    imgUrl,
                    height: 130,
                  )
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(60),
            ),
          ),
        ),
        color: bgColor,
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({
    Key? key,
    required this.selectedPage,
    required this.onPressed,
    required this.title,
    required this.pageNum,
  }) : super(key: key);

  final int selectedPage;
  final VoidCallback onPressed;
  final String title;
  final int pageNum;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'cal',
                  letterSpacing: 2,
                  color:
                      selectedPage == pageNum ? Colors.black : Colors.black54,
                  fontWeight: selectedPage == pageNum ? FontWeight.w700 : null),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color:
                    selectedPage == pageNum ? Colors.red : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        ),
      ),
    );
  }
}
