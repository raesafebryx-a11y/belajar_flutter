import 'package:flutter/material.dart';
import 'package:belajar_flutter/routes/app_routes.dart';

// ============================================================================
// HALAMAN 3: STRUK PEMBAYARAN (RECEIPT PAGE)
// ============================================================================
class ReceiptPage extends StatelessWidget {
  final Map<String, dynamic> transactionData;

  const ReceiptPage({super.key, required this.transactionData});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> purchasedItems =
        List<Map<String, dynamic>>.from(transactionData['items']);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6F4),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'E-Tiket Berhasil',
          style: TextStyle(
            color: const Color(0xFF17231A),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Icon Sukses
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1DB954)
                              .withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_circle_rounded,
                          color: Color(0xFF1DB954),
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Pembayaran berhasil',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF17231A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Kode transaksi: ${transactionData['transactionId']}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        '${transactionData['date']}',
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 12),
                      Text(
                        '${transactionData['eventName']}',
                        style: const TextStyle(
                          color: const Color(0xFF17231A),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${transactionData['venue']}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Divider(thickness: 1, color: Color(0xFFE0E7E0)),
                      ),

                      // Daftar Item di Struk
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'E-TIKET (${purchasedItems.length} kategori)',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xFF17231A),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: purchasedItems.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final item = purchasedItems[index];
                          final itemTotal =
                              (item['price'] as num) * (item['qty'] as int);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${item['name']} (${item['variant']})',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      '${item['qty']} x Rp ${(item['price'] as num).toStringAsFixed(0)}',
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Rp ${itemTotal.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: const Color(0xFF17231A),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(thickness: 1, color: Color(0xFFE0E7E0)),
                      ),

                      // Rincian Biaya
                      _receiptRow(
                        'Subtotal tiket',
                        'Rp ${(transactionData['subtotal'] as num).toStringAsFixed(0)}',
                      ),
                      const SizedBox(height: 6),
                      _receiptRow(
                        'Biaya layanan',
                        'Rp ${(transactionData['serviceFee'] as num).toStringAsFixed(0)}',
                      ),
                      const SizedBox(height: 6),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Divider(
                          thickness: 1.5,
                          color: Color(0xFFEEEEEE),
                        ),
                      ),

                      // Total Bayar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total dibayar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF17231A),
                            ),
                          ),
                          Text(
                            'Rp ${(transactionData['grandTotal'] as num).toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1DB954),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Info Metode Pembayaran & Kembalian
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F6F4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            _receiptRow(
                              'Metode pembayaran',
                              transactionData['paymentMethod'] == 'CASH'
                                  ? 'Tunai'
                                  : 'QRIS',
                            ),
                            const SizedBox(height: 6),
                            _receiptRow(
                              'Nominal dibayar',
                              'Rp ${(transactionData['cashPaid'] as num).toStringAsFixed(0)}',
                            ),
                            if (transactionData['paymentMethod'] == 'CASH') ...[
                              const SizedBox(height: 6),
                              _receiptRow(
                                'Kembalian',
                                'Rp ${(transactionData['change'] as num).toStringAsFixed(0)}',
                                valueColor: const Color(0xFF1DB954),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Kembali ke daftar tiket.
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.tiketStadion,
                      ModalRoute.withName(AppRoutes.home),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1DB954),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Kembali ke tiket',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _receiptRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black54, fontSize: 13),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: valueColor ?? const Color(0xFF17231A),
          ),
        ),
      ],
    );
  }
}
