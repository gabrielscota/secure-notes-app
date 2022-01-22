import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../viewmodels/viewmodels.dart';
import '../pages.dart';

class NotePage extends StatefulWidget {
  final NotePresenter presenter;

  const NotePage({
    final Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late TextEditingController noteTitleEditingController;
  late TextEditingController noteTextEditingController;
  late Function({required NoteViewModel note}) addNoteFunction;

  @override
  void initState() {
    noteTitleEditingController = TextEditingController();
    noteTextEditingController = TextEditingController();
    addNoteFunction = (Get.arguments as Map)['addNoteFunction'] as Function({required NoteViewModel note});

    super.initState();
  }

  @override
  Widget build(final BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
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
                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: noteTitleEditingController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  hintText: 'Title',
                                  hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                                        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                                        fontWeight: FontWeight.w400,
                                      ),
                                  alignLabelWithHint: true,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                keyboardType: TextInputType.text,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: noteTextEditingController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              hintText: 'Write your note..',
                              hintStyle: Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                                    fontWeight: FontWeight.w400,
                                  ),
                              alignLabelWithHint: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              contentPadding: EdgeInsets.zero,
                            ),
                            expands: true,
                            maxLines: null,
                            keyboardType: TextInputType.text,
                            autofocus: true,
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  widget.presenter.save(text: noteTextEditingController.text);
                                  Get.back();
                                  await Future.delayed(const Duration(milliseconds: 500));
                                  const Uuid uuid = Uuid();
                                  addNoteFunction(
                                    note: NoteViewModel(
                                      id: uuid.v4(),
                                      title: noteTitleEditingController.text,
                                      text: noteTextEditingController.text,
                                    ),
                                  );
                                },
                                child: const Text('Salvar'),
                              ),
                            ),
                          ],
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
