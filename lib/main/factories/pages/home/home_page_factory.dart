import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

Widget makeHomePage() => HomePage(
      presenter: makeGetxHomePresenter(),
    );
