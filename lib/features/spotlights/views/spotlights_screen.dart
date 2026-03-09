import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';

class SpotlightsScreen extends StatelessWidget {
  const SpotlightsScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return MainWrapper(
      child: const _Content()
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build (BuildContext context) {
    return Column(
      children: [

      ],
    );
  }
}