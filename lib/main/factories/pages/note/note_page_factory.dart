import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

Widget makeNotePage() => NotePage(
      presenter: makeGetxNotePresenter(),
    );
