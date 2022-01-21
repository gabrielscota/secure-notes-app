import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddNewNoteFloatingActionButton extends StatelessWidget {
  const AddNewNoteFloatingActionButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => FloatingActionButton(
        onPressed: () => Get.toNamed('/note'),
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        child: const Icon(IconlyLight.paper_plus),
      );
}
