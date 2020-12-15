import 'package:flutter/material.dart';
import 'package:flutter_profile_avatar/flutter_profile_avatar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

main() {
  testWidgets('Should see basics components', (WidgetTester tester) async {
    // ARRANGE
    Color color = Color(0xff229954);

    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: color,
          ),
          home: Container(
            child: ProfileAvatar(),
          ),
        ),
      );
    });

    // ACT
    final Finder avatarFinder = find.byType(CircleAvatar);
    final CircleAvatar circleAvatar =
        tester.firstWidget(avatarFinder) as CircleAvatar;
    final Finder textFinder = find.byType(Text);
    final Finder networkImageFinder = find.byType(NetworkImage);

    // ASSERT
    expect(circleAvatar.backgroundColor, color);
    expect(textFinder, findsNothing);
    expect(networkImageFinder, findsNothing);
  });

  testWidgets('Should see initial from username (john doe)',
      (WidgetTester tester) async {
    // ARRANGE
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: Container(
            child: ProfileAvatar(
              username: 'John Doe',
            ),
          ),
        ),
      );
    });

    // ACT
    final Finder avatarFinder = find.text('JD');

    // ASSERT
    expect(avatarFinder, findsOneWidget);
  });

  testWidgets('Should see initial from username (john)',
      (WidgetTester tester) async {
    // ARRANGE
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: Container(
            child: ProfileAvatar(
              username: 'John',
            ),
          ),
        ),
      );
    });

    // ACT
    final Finder avatarFinder = find.text('J');

    // ASSERT
    expect(avatarFinder, findsOneWidget);
  });

  testWidgets('Should check size of CircleAvatar', (WidgetTester tester) async {
    // ARRANGE
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: Container(
            child: ProfileAvatar(
              size: 30,
              username: 'John Doe',
            ),
          ),
        ),
      );
    });

    // ACT
    final Finder avatarFinder = find.byType(CircleAvatar);
    final CircleAvatar circleAvatar =
        tester.firstWidget(avatarFinder) as CircleAvatar;
    final Finder intialFinder = find.text('JD');
    final Text initialText = tester.firstWidget(intialFinder) as Text;

    // ASSERT
    expect(circleAvatar.radius, 30);
    expect(initialText.style.fontSize, 30 / 1.3);
  });

  testWidgets('Should verify if text is not visible',
      (WidgetTester tester) async {
    // ARRANGE
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: Container(
            child: ProfileAvatar(
              username: 'John Doe',
              avatarURL: 'http://localhost',
            ),
          ),
        ),
      );
    });

    // ACT
    final Finder textFinder = find.text('JD');

    // ASSERT
    expect(textFinder, findsNothing);
  });

  testWidgets('Should have background image', (WidgetTester tester) async {
    // ARRANGE
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: Container(
            child: ProfileAvatar(
              username: 'John Doe',
              avatarURL: 'http://localhost',
            ),
          ),
        ),
      );
    });

    // ACT
    final Finder avatarFinder = find.byType(CircleAvatar);
    final CircleAvatar circleAvatar =
        tester.firstWidget(avatarFinder) as CircleAvatar;

    // ASSERT
    expect(
        (circleAvatar.backgroundImage as NetworkImage).url, 'http://localhost');
  });
}
