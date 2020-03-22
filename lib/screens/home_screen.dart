import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/state/theme.dart';
import 'package:scrum_poker/widgets/card.dart';
import 'package:scrum_poker/widgets/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<String>> _items;

  @override
  void initState() {
    super.initState();

    _items = SharedPreferences.getInstance().then((prefs) {
      var savedItems = prefs.getStringList("items");
      if (savedItems == null || savedItems.isEmpty) {
        return ["0", "1", "2", "3", "5", "8", "13", "21", "∞"];
      } else {
        return savedItems;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: GestureDetector(
        onPanEnd: (details) {
          Provider.of<ThemeModel>(context).toggleDarkMode();
        },
        child: FutureBuilder<List<String>>(
          future: _items,
          builder: (context, snapshot) {
            List<List<String>> rows = [];
            for (var i = 0; i < snapshot.data.length; i += 3) {
              var endIndex = i + 3;
              if (endIndex > snapshot.data.length) {
                endIndex = snapshot.data.length;
              }
              rows.add(snapshot.data.sublist(i, endIndex));
            }

            return Column(
              children: rows
                  .asMap()
                  .entries
                  .map((entry) => _createRow(context, entry.key, entry.value))
                  .toList(),
            );
          },
        ),
      ),
    );
  }

  Widget _createRow(BuildContext context, index, List<String> rowValues) {
    return Expanded(
      child: Row(
        children: rowValues
            .asMap()
            .entries
            .map((entry) =>
                _createItem(context, 3 * index + entry.key, entry.value))
            .toList(),
      ),
    );
  }

  Widget _createItem(BuildContext context, int index, String value) {
    return Expanded(
      child: GestureDetector(
        child: PokerCard(value: value),
        onTap: () {
          if (!kIsWeb) {
            Wakelock.enable();
          }

          Navigator.pushNamed(context, "/card", arguments: value).then((_) {
            if (!kIsWeb) {
              Wakelock.disable();
            }
          });
        },
        onLongPress: () async {
          var result =
              await Navigator.pushNamed(context, "/edit", arguments: value);

          if (result != null && result is MapEntry<String, String>) {
            _saveAndUpdate(result.key, index, result.value);
          }
        },
      ),
    );
  }

  void _saveAndUpdate(String action, int index, String newValue) async {
    var prefs = await SharedPreferences.getInstance();
    var currentItems = await _items;

    switch (action) {
      case "add":
        currentItems.insert(index + 1, newValue);
        break;
      case "upd":
        currentItems[index] = newValue;
        break;
      case "del":
        if (currentItems.length > 1) {
          currentItems.removeAt(index);
        }
        break;
    }

    setState(() {
      _items = prefs.setStringList("items", currentItems).then((_) {
        return currentItems;
      });
    });
  }
}
