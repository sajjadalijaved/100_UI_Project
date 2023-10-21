import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
// ignore_for_file: avoid_function_literals_in_foreach_calls

// ignore_for_file: file_names
class Category {
  final String title;
  bool isSelected;
  Category(this.title, this.isSelected);
}

class GlassmorphismCreditCard extends StatefulWidget {
  const GlassmorphismCreditCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GlassmorphismCreditCardState createState() =>
      _GlassmorphismCreditCardState();
}

class _GlassmorphismCreditCardState extends State<GlassmorphismCreditCard> {
  late double _height;
  late double _width;

  List<Category> categoryList = [
    Category("Trending", true),
    Category("Digital Arts", false),
    Category("3D Videos", false),
    Category("Game", false),
    Category("Console", false),
  ];

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: _height * 0.06,
              width: _width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: categoryList[index],
                    onPressed: (b) {
                      categoryList.forEach((category) {
                        category.isSelected = false;
                      });
                      setState(() {
                        categoryList[index].isSelected = true;
                      });
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: _height * 0.10,
          ),
          GlassmorphicContainer(
            height: _height * 0.3,
            width: _width * 0.9,
            borderRadius: 15,
            blur: 15,
            alignment: Alignment.center,
            border: 2,
            linearGradient: LinearGradient(colors: [
              Colors.white.withOpacity(0.2),
              Colors.white38.withOpacity(0.2)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderGradient: LinearGradient(colors: [
              Colors.white24.withOpacity(0.2),
              Colors.white70.withOpacity(0.2)
            ]),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 16,
                  color: Colors.black.withOpacity(0.1),
                )
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20.0,
                    sigmaY: 20.0,
                  ),
                  child: Container(
                      height: _height * 0.3,
                      width: _width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.2),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ICICI BANK',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.75))),
                                Icon(
                                  Icons.credit_card_sharp,
                                  color: Colors.white.withOpacity(0.75),
                                )
                              ],
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('VISA',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.75))),
                                Text('09/27',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.75))),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('3648 3847 9283 1482',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.75))),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  final Category category;
  final Function(bool) onPressed;

  const CategoryCard(
      {required this.category, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color:
              widget.category.isSelected ? Colors.white : Colors.transparent),
      child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            widget.onPressed(true);
          },
          child: Text(widget.category.title,
              style: TextStyle(
                  color: widget.category.isSelected
                      ? Colors.black
                      : Colors.grey))),
    );
  }
}
