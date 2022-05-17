import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

CustomBottomSheet(BuildContext context, String status) {
  showModalBottomSheet(
      elevation: 0,
      enableDrag: false,
      isDismissible: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Container(
            height: 75,
            child: Center(
              child: Text(
                status,
              ),
            ),
          ),
        );
      });
}
