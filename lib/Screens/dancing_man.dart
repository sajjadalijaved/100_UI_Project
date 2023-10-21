import 'package:flutter/material.dart';
// ignore_for_file: library_private_types_in_public_api

class DancingMan extends StatefulWidget {
  const DancingMan({Key? key}) : super(key: key);

  @override
  _DancingManState createState() => _DancingManState();
}

class _DancingManState extends State<DancingMan>
    with SingleTickerProviderStateMixin {
  bool _isDancing = false;

  // margin animation from bottom
  late AnimationController _marginAnimationController;
  Animation<double>? _marginAnimation;

  @override
  void initState() {
    super.initState();

    _marginAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _marginAnimation = Tween<double>(
      begin: 20.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _marginAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _marginAnimationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _marginAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8AD19),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dy > -5) {
                setState(() {
                  _isDancing = false;
                });
              } else {
                setState(() {
                  _isDancing = true;
                });
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isDancing
                    ? Image.asset(
                        'assets/dancing-man.gif',
                        height: 500,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/stop-man.png',
                        height: 500,
                      ),

                const SizedBox(
                  height: 50,
                ),
                // animated arrow up Icon
                _isDancing
                    ? const Column(
                        children: [
                          Text("Swipe Down to Stop"),
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 30,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          AnimatedBuilder(
                            animation: _marginAnimation!,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, _marginAnimation!.value),
                                child: const Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Swipe Up To Play"),
                        ],
                      )
              ],
            ),
          )),
    );
  }
}
