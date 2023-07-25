// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:yanmenu/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Uygulama ve Sayfa Geçişleri Testi', (WidgetTester tester) async {
    // Uygulamayı başlat
    await tester.pumpWidget(MenuUygulamasi());

    // Ana sayfa içeriği kontrolü
    expect(find.text('Ana Sayfa İçeriği'), findsOneWidget);

    // Sol menüyü aç
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Menüde "Ürünler" butonunu bul ve tıkla
    await tester.tap(find.text('Ürünler'));
    await tester.pumpAndSettle();

    // Ürünler sayfasının açıldığını kontrol et
    expect(find.text('Ürünler Sayfası'), findsOneWidget);

    // Sol menüyü tekrar aç
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Menüde "Ayarlar" butonunu bul ve tıkla
    await tester.tap(find.text('Ayarlar'));
    await tester.pumpAndSettle();

    // Ayarlar sayfasının açıldığını kontrol et
    expect(find.text('Ayarlar Sayfası'), findsOneWidget);

    // Sol menüyü tekrar aç
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Menüde "Hakkımda" butonunu bul ve tıkla
    await tester.tap(find.text('Hakkımda'));
    await tester.pumpAndSettle();

    // Hakkımda sayfasının açıldığını kontrol et
    expect(find.text('Hakkımda Sayfası'), findsOneWidget);
  });
}
