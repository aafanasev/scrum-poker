import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/state/theme.dart';
import 'package:scrum_poker/widgets/screen.dart';

class EditScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.text = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Consumer<ThemeModel>(builder: (context, theme, _) {
        Color labelTextColor;
        Color valueTextColor;
        Color valueBgColor;
        Color btnBgColor;
        Color btnTextColor;
        Color cursorColor;

        if (theme.isDarkMode) {
          labelTextColor = const Color(0xFFFFFFFF);
          valueTextColor = const Color(0xFFFFFFFF);
          valueBgColor = const Color(0xFF1D1D1D);
          btnBgColor = const Color(0xFF1D1D1D);
          btnTextColor = const Color(0xFFFFFFFF);
          cursorColor = const Color(0xFFFFFFFF);
        } else {
          labelTextColor = const Color(0xFF1D1D1D);
          valueTextColor = const Color(0xFF1D1D1D);
          valueBgColor = const Color(0xFFFFFFFF);
          btnBgColor = const Color(0xFFFFFFFF);
          btnTextColor = const Color(0xFF1D1D1D);
          cursorColor = const Color(0xFF1D1D1D);
        }

        var _labelTextStyle = TextStyle(
          color: labelTextColor,
          fontFamily: "Alata",
          fontSize: 20,
        );

        var _valueTextStyle = TextStyle(
          color: valueTextColor,
          fontFamily: "Alata",
          fontSize: 60,
        );

        var _valueBoxDecoration = BoxDecoration(
          color: valueBgColor,
          borderRadius: const BorderRadius.all(
            const Radius.circular(10),
          ),
        );

        return Column(
          children: [
            Text(
              "Previous value:",
              style: _labelTextStyle,
            ),
            Container(
              child: Text(
                _controller.text,
                textAlign: TextAlign.center,
                style: _valueTextStyle,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                left: 4,
                right: 4,
                top: 4,
                bottom: 20,
              ),
              decoration: _valueBoxDecoration,
              width: double.infinity,
            ),
            Text(
              "New value:",
              style: _labelTextStyle,
            ),
            Container(
              child: EditableText(
                controller: _controller,
                focusNode: FocusNode(),
                style: _valueTextStyle,
                textAlign: TextAlign.center,
                cursorColor: cursorColor,
                backgroundCursorColor: cursorColor,
                autofocus: true,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                left: 4,
                right: 4,
                top: 4,
                bottom: 20,
              ),
              decoration: _valueBoxDecoration,
            ),
            _createButtons(btnTextColor, btnBgColor),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        );
      }),
    );
  }

  Widget _createButtons(Color textColor, Color bgColor) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: _createButton("Save", textColor, bgColor),
            onTap: () => _doAction(EditAction.update),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: _createButton("+ Save as a new", textColor, bgColor),
            onTap: () => _doAction(EditAction.add),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: _createButton("- Delete", textColor, bgColor),
            onTap: () => _doAction(EditAction.delete),
          ),
        ),
      ],
    );
  }

  Widget _createButton(String text, Color textColor, Color bgColor) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontFamily: "Alata",
        ),
        textAlign: TextAlign.center,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(
          const Radius.circular(10),
        ),
      ),
    );
  }

  void _doAction(EditAction action) {
    Navigator.pop(context, MapEntry(action, _controller.text));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

enum EditAction { add, update, delete }
