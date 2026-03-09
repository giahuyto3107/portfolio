import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return MainWrapper(
      child: _ContactsContent()
    );
  }
}

class _ContactsContent extends StatelessWidget {
  const _ContactsContent();

  @override
  Widget build(BuildContext context) {
    return Column(
    );
  }
}