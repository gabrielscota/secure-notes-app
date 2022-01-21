import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

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
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();

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
                            Text(
                              'Nova nota',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade900,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Icon(
                              IconlyLight.edit,
                              size: 28,
                              color: Colors.grey.shade900,
                            ),
                          ],
                        ),
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
                              hintText: 'Write your note..',
                              alignLabelWithHint: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                            ),
                            expands: true,
                            maxLines: null,
                            keyboardType: TextInputType.text,
                            autofocus: true,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => widget.presenter.save(text: textEditingController.text),
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
