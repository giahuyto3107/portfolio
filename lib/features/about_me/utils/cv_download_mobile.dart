import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> downloadCV() async {
  final byteData = await rootBundle.load('assets/cv.pdf');
  final directory = await getTemporaryDirectory();
  final file = File('${directory.path}/cv.pdf');

  await file.writeAsBytes(byteData.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes
  ));

  final Uri url = Uri.file(file.path);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  }
}