import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> with TickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this, value: 0, duration: Duration(milliseconds: 500));

  double width = 0;

  bool showing = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: showing ? MediaQuery.of(context).size.width * 0.6 : 0,
            height: 35,
            curve: Curves.ease,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 10, left: 12),
              child: TextField(
                style: TextStyle(decorationThickness: 0),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: -6,
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {
              setState(() {
                if (showing) {
                  showing = false;
                  _controller.reverse();
                } else {
                  showing = true;
                  _controller.forward();
                }
              });
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.ellipsis_search,
              progress: _controller,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
