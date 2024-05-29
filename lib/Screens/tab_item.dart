import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String pagetitle;

  const TabItem({
    super.key,
    required this.pagetitle, required TextStyle style
  });

  get style => null;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            pagetitle,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
