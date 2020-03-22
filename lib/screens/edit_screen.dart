import 'package:flutter/widgets.dart';
import 'package:scrum_poker/widgets/screen.dart';

class EditScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _controller;

  final _labelTextStyle = TextStyle(
    color: const Color(0xFFFFFFFF),
    fontFamily: "Alata",
    fontSize: 20,
  );

  final _valueTextStyle = TextStyle(
    color: const Color(0xFFFFFFFF),
    fontFamily: "Alata",
    fontSize: 60,
  );

  final _valueBoxDecoration = BoxDecoration(
    color: const Color(0xFF000000),
    borderRadius: const BorderRadius.all(const Radius.circular(10)),
  );

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
      child: Column(
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
              cursorColor: const Color(0xFFFFFFFF),
              backgroundCursorColor: const Color(0xFFFFFFFF),
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
          _createButtons(),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }

  Widget _createButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: _createButton("Save"),
            onTap: () => _doAction("upd"),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: _createButton("+ Save as a new"),
            onTap: () => _doAction("add"),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: _createButton("- Delete"),
            onTap: () => _doAction("del"),
          ),
        ),
      ],
    );
  }

  Widget _createButton(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFFFFFFFF),
          fontFamily: "Alata",
        ),
        textAlign: TextAlign.center,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF000000),
        borderRadius: const BorderRadius.all(const Radius.circular(10)),
      ),
    );
  }

  void _doAction(String action) {
    Navigator.pop(context, MapEntry(action, _controller.text));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
