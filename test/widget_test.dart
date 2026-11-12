// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:belajar_flutter/Form/tiket_checkout_page.dart';
import 'package:belajar_flutter/Form/TiketStadion.dart';
import 'package:belajar_flutter/routes/app_routes.dart';

void main() {
  testWidgets('keranjang kosong tidak dikenakan biaya atau bisa dibayar', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: CheckoutPage(cartItems: [])),
    );

    expect(find.text('Belum ada tiket di keranjang.'), findsOneWidget);
    expect(find.text('Rp 2500'), findsNothing);

    final payButton = tester.widget<ElevatedButton>(
      find.byType(ElevatedButton),
    );
    expect(payButton.onPressed, isNull);
  });

  testWidgets('pembayaran tunai ditolak jika nominal kurang', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CheckoutPage(
          cartItems: [
            {
              'id': 't1',
              'name': 'Tribun Utama Eksklusif',
              'variant': 'Gerbang A',
              'price': 150000.0,
              'qty': 1,
              'icon': Icons.stadium_rounded,
            },
          ],
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '100000');
    await tester.pump();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Kekurangan'), findsOneWidget);
    expect(find.text('Rp 52500'), findsOneWidget);
    expect(
      find.text('Nominal uang tunai kurang dari total pembayaran!'),
      findsOneWidget,
    );
  });

  testWidgets('QRIS belum terhubung tidak membuat transaksi berhasil', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CheckoutPage(
          cartItems: [
            {
              'id': 't1',
              'name': 'Tribun Utama Eksklusif',
              'variant': 'Gerbang A',
              'price': 150000.0,
              'qty': 1,
              'icon': Icons.stadium_rounded,
            },
          ],
        ),
      ),
    );

    await tester.tap(find.text('QRIS'));
    await tester.pump();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Pembayaran QRIS belum terhubung.'), findsOneWidget);
    expect(find.text('Pembayaran berhasil'), findsNothing);
  });

  testWidgets('katalog menampilkan gambar tiket dan tiket eksklusif', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: DiscoverPage()));

    expect(
      find.image(const AssetImage('assets/images/tiketvip.jpg')),
      findsOneWidget,
    );
    expect(
      find.image(const AssetImage('assets/images/tiket.jpg')),
      findsOneWidget,
    );
  });

  testWidgets('menu latihan membuka halaman masing-masing saat ditekan', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(initialRoute: AppRoutes.home, routes: AppRoutes.routes),
    );

    await tester.ensureVisible(find.text('Latihan Row').first);
    await tester.tap(find.text('Latihan Row').first);
    await tester.pumpAndSettle();
    expect(find.text('Latihan Row'), findsOneWidget);
    Navigator.of(tester.element(find.text('Latihan Row').last)).pop();
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Row dan Column').first);
    await tester.tap(find.text('Row dan Column').first);
    await tester.pumpAndSettle();
    expect(find.text('Latihan Row dan Column'), findsOneWidget);
    Navigator.of(tester.element(find.text('Latihan Row dan Column'))).pop();
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Profile').first);
    await tester.tap(find.text('Profile').first);
    await tester.pumpAndSettle();
    expect(find.text('Raesa'), findsOneWidget);
  });

  testWidgets('pembayaran tunai berhasil dan struk menghitung kembalian', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CheckoutPage(
          cartItems: [
            {
              'id': 't1',
              'name': 'Tribun Utama Eksklusif',
              'variant': 'Gerbang A',
              'price': 150000.0,
              'qty': 1,
              'icon': Icons.stadium_rounded,
            },
          ],
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '200000');
    await tester.pump();
    expect(find.text('Rp 47500'), findsOneWidget);

    await tester.ensureVisible(find.text('Bayar Rp 152500'));
    await tester.tap(find.text('Bayar Rp 152500'));
    await tester.pumpAndSettle();

    expect(find.text('Pembayaran berhasil'), findsOneWidget);
    expect(find.text('Rp 200000'), findsOneWidget);
    expect(find.text('Rp 47500'), findsOneWidget);
  });
}
