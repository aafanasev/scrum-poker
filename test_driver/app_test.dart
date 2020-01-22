import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

const SCREENSHOTS_DIR = "media/screenshots";

void main() {
  group("scrum_poker", () {
    var filename = Platform.environment["SCREENSHOTS_NAME"];
    if (filename?.isEmpty ?? true) {
      filename = "screenshot";
    }

    final card = find.byValueKey("card_5");

    FlutterDriver driver;

    setUpAll(() async {
      Directory(SCREENSHOTS_DIR).create();

      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("screenshot_1", () async {
      await takeScreenshot(driver, "$SCREENSHOTS_DIR/${filename}_1.png");
    });

    test("screenshot_2", () async {
      await driver.tap(card);
      await takeScreenshot(driver, "$SCREENSHOTS_DIR/${filename}_2.png");
      await driver.tap(card);
    });

    test("screenshot_3", () async {
      await driver.scroll(card, 100, 0, Duration(milliseconds: 300));
      await takeScreenshot(driver, "$SCREENSHOTS_DIR/${filename}_3.png");
    });

    test("screenshot_4", () async {
      await driver.tap(card);
      await takeScreenshot(driver, "$SCREENSHOTS_DIR/${filename}_4.png");
    });
  });
}

Future<void> takeScreenshot(FlutterDriver driver, String path) async {
  final List<int> bytes = await driver.screenshot();
  final File file = File(path);
  await file.writeAsBytes(bytes);
}
