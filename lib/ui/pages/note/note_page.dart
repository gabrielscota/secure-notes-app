import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                sliver: SliverFillRemaining(
                  child: Column(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () => widget.presenter.save(text: textEditingController.text),
                        child: const Text('Salvar'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
