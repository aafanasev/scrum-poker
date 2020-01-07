import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/app.dart';
import 'package:scrum_poker/state/theme.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeModel(),
        child: MyApp(),
      ),
    );
