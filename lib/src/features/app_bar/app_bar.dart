import 'package:flutter/material.dart';

PreferredSizeWidget appbar(
    BuildContext context, String title, dynamic otherData) {
  return AppBar(
    title: const Text('Pizza Napoli'),
    centerTitle: true,
  );
}
