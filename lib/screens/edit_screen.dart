import 'package:flutter/widgets.dart';
import 'package:scrum_poker/widgets/screen.dart';

class EditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String arg = ModalRoute.of(context).settings.arguments;

    return Screen(
      child: Text(arg)
    );
  }
}
