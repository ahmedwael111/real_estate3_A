
import 'package:flutter/material.dart';

import 'CustomDotIndicator.dart';

  class DotsIndicator extends StatelessWidget {
    const DotsIndicator({Key? key, required this.currentpage}) : super(key: key);
    final int currentpage;
    @override
    Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
              (index) => Padding(
            padding: const EdgeInsets.only(right: 6),
            child: CustomDotIndicator(
              isActive: currentpage == index,
            ),
          ),
        ),
      );

    }

  }