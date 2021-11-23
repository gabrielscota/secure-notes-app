import 'package:flutter/material.dart';

import '../pages.dart';

class NotePage extends StatefulWidget {
  final NotePresenter presenter;

  static const String routeName = '/note';

  const NotePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(controller: textEditingController),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () => widget.presenter.save(text: textEditingController.text),
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
