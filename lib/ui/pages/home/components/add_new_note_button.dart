import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddNewNoteFloatingActionButton extends StatelessWidget {
  const AddNewNoteFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.toNamed('/note'),
      elevation: 0.0,
      child: const Icon(IconlyLight.paper_plus),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
