import 'package:flutter/material.dart';

String text =
    '''An avocado is a bright green fruit with a large pit and dark leathery skin. They’re also known as alligator pears or butter fruit. Avocados are a favorite of the produce section. They’re the go-to ingredient for guacamole dips. And they're turning up in everything from salads and wraps to smoothies and even brownies. So what, exactly, makes this pear-shaped berry (yes, that’s right!) such a superfund?''';

class FruitScreen extends StatelessWidget {
  const FruitScreen(
      {Key? key,
      required this.title,
      required this.price,
      required this.imgURL,
      required this.bgColor})
      : super(key: key);

  final String title;
  final double price;
  final String imgURL;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Fruits'),
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Center(
                child: Hero(
                  tag: 'fruit',
                  child: Image.asset(
                    imgURL,
                    height: MediaQuery.of(context).size.height*.35,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        title,
                        style:const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text('\$$price',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffe5bf7f),
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 60,
                    width: 60,
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.redAccent,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      PropertiesF(
                        title: 'Season',
                        subtitle: '8-9',
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 0.7,
                      ),
                      PropertiesF(
                        title: 'Fat',
                        subtitle: '8g',
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 0.7,
                      ),
                      PropertiesF(
                        title: 'Kcal',
                        subtitle: '171',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  textAlign: TextAlign.justify,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PropertiesF extends StatelessWidget {
  final String title;
  final String subtitle;

  const PropertiesF({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 15,
              fontFamily: 'cal',
              letterSpacing: 2,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 3),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 19,
            fontFamily: 'cal',
            letterSpacing: 2,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
