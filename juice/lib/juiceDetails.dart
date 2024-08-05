import 'package:flutter/material.dart';
import 'package:juice/data.dart';

class JuiceDetailsPage extends StatefulWidget {
  final JuiceEntity? juiceEntity;

  const JuiceDetailsPage({super.key, this.juiceEntity});

  @override
  State<JuiceDetailsPage> createState() => JuiceDetailsPageState();
}

class JuiceDetailsPageState extends State<JuiceDetailsPage> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(bottom: 67),
          child: SingleChildScrollView(
              child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.86,
                child: Stack(children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final imageHeight = constraints.maxHeight * 0.7;
                      final imageHorizontalMargin = constraints.maxWidth * 0.15;
                      final imageBottomMargin = constraints.maxHeight * 0.07;
                      return Container(
                        decoration: BoxDecoration(
                          color: widget.juiceEntity!.color,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32),
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 26),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: imageHorizontalMargin,
                              right: imageHorizontalMargin,
                              bottom: imageBottomMargin,
                            ),
                            child: Hero(
                              tag: "${widget.juiceEntity!.image}",
                              child: Image.network(
                                widget.juiceEntity!.image,
                                height: imageHeight,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CounterWidget(
                      currentCount: count,
                      color: widget.juiceEntity!.color,
                      onIncreaseClicked: () {
                        setState(() {
                          count++;
                        });
                      },
                      onDecreaseClicked: () {
                        setState(() {
                          count--;
                        });
                      },
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 58),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Besom Orange Juice',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SimpleRatingBar()
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Drinking Orange Juice is not only enhances health body also strengthens muscles',
                      style: TextStyle(color: Color(0xFFB0B1B4), fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /* previously implemented widgets */
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: Color(0xFFD81C33),
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ReviewsList(),
              ),
              SizedBox(height: 16),
            ],
          )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: '\$',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '25.99',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                    onPressed: () {},
                    child: const Text(
                      "Buy NOW",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: widget.juiceEntity!.color,
          padding: EdgeInsets.only(left: 24, right: 24, top: 26, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Image.network(
                  'https://flutter4fun.com/wp-content/uploads/2021/09/back.png',
                  width: 32,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                'Besom.',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              Image.network(
                'https://flutter4fun.com/wp-content/uploads/2021/09/shop_white.png',
                width: 32,
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class SimpleRatingBar extends StatelessWidget {
  const SimpleRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => const Icon(
          Icons.star,
          color: Color(0xFFFFBA00),
          size: 18,
        ),
      ),
    );
  }
}

class ReviewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => SizedBox(width: 18),
        itemBuilder: (_, index) {
          // if (index == reviewImages.length) {
          //   return Image.network("https://www.lovepanky.com/wp-content/uploads/2018/08/How-to-Be-Cool.jpg");
          // }
          return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                reviewImages[index],
                fit: BoxFit.cover,
                width: 62,
              ));
        },
        itemCount: reviewImages.length,
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final int currentCount;
  final Color color;
  final VoidCallback? onIncreaseClicked;
  final VoidCallback? onDecreaseClicked;
  final textStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18);

  CounterWidget({
    super.key,
    required this.currentCount,
    required this.color,
    this.onIncreaseClicked,
    this.onDecreaseClicked,
  });

  @override
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 16),
          GestureDetector(
            onTap: onDecreaseClicked,
            child: Icon(Icons.remove, color: Colors.white),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 30,
            child: Text(
              currentCount.toString(),
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onIncreaseClicked,
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
