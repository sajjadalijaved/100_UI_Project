import 'src/stack_type.dart';
import 'src/indicator_model.dart';
import 'src/stack_dimention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

class StackCard extends StatefulWidget {
  const StackCard.builder(
      {super.key,
      this.stackType = StackType.middle,
      required this.itemBuilder,
      required this.itemCount,
      this.dimension,
      this.stackOffset = const Offset(15, 15),
      this.onSwap,
      this.displayIndicator = false,
      this.displayIndicatorBuilder});

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final ValueChanged<int>? onSwap;
  final bool displayIndicator;
  final IdicatorBuilder? displayIndicatorBuilder;
  final StackDimension? dimension;
  final StackType stackType;
  final Offset stackOffset;

  @override
  _StackCardState createState() => _StackCardState();
}

class _StackCardState extends State<StackCard> {
  final _pageController = PageController();
  var _currentPage = 0.0;
  var _width, _height;

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });

    if (widget.dimension == null) {
      _height = MediaQuery.of(context).size.height;
      _width = MediaQuery.of(context).size.width;
    } else {
      assert(widget.dimension!.width! > 0);
      assert(widget.dimension!.height! > 0);
      _width = widget.dimension!.width;
      _height = widget.dimension!.height;
    }

    return Stack(fit: StackFit.expand, children: <Widget>[
      _cardStack(),
      widget.displayIndicator ? _cardIndicator() : Container(),
      PageView.builder(
        onPageChanged: widget.onSwap,
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return Container();
        },
      )
    ]);
  }

  Widget _cardStack() {
    List<Widget> cards = [];

    for (int i = widget.itemCount - 1; i >= 0; i--) {
      var sizeOffsetx =
          (widget.stackOffset.dx * i) - (_currentPage * widget.stackOffset.dx);
      var sizeOffsety =
          (widget.stackOffset.dy * i) - (_currentPage * widget.stackOffset.dy);

      var leftOffset =
          (widget.stackOffset.dx * i) - (_currentPage * widget.stackOffset.dx);
      var topOffset =
          (widget.stackOffset.dy * i) - (_currentPage * widget.stackOffset.dy);

      cards.add(Positioned.fill(
        top: topOffset,
        left: widget.stackType == StackType.middle
            ? (_currentPage > (i) ? -(_currentPage - i) * (_width * 4) : 0)
            : (_currentPage > (i)
                ? -(_currentPage - i) * (_width * 4)
                : leftOffset),
        child: _cardbuilder(
            i,
            widget.stackType == StackType.middle
                ? _width - sizeOffsetx
                : _width,
            _height - sizeOffsety),
      ));
    }

    return Stack(fit: StackFit.expand, children: cards);
  }

  Widget _cardbuilder(int index, double width, double height) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: width * .8,
            height: height * .8,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 2)
            ], borderRadius: BorderRadius.all(Radius.circular(12))),
            child: widget.itemBuilder(context, index)));
  }

  Widget _cardIndicator() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: SliderIndicator(
              length: widget.itemCount,
              activeIndex: _currentPage.round(),
              activeIndicator: const Text(""),
              indicator: const Text("")),
        ));
  }
}
