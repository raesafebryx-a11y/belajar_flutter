import 'package:flutter/material.dart';
import 'package:belajar_flutter/Form/tiket_receipt_page.dart';
import 'package:belajar_flutter/routes/app_routes.dart';

// ============================================================================
// HALAMAN 2: DETAIL MULTI-ITEMS & PAYMENT (CASH INPUT & QRIS)
// ============================================================================
class CheckoutPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CheckoutPage({super.key, required this.cartItems});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late List<Map<String, dynamic>> items;
  String selectedPaymentMethod = 'CASH'; // 'CASH' atau 'QRIS'
  final TextEditingController _cashController = TextEditingController();

  final double serviceFee = 2500.0;
  double cashInputAmount = 0.0;

  double get _serviceFee => items.isEmpty ? 0 : serviceFee;

  @override
  void initState() {
    super.initState();
    items = widget.cartItems.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  @override
  void dispose() {
    _cashController.dispose();
    super.dispose();
  }

  double get _subtotal {
    double sum = 0;
    for (var item in items) {
      sum += (item['price'] as num) * (item['qty'] as int);
    }
    return sum;
  }

  double get _grandTotal {
    return _subtotal + _serviceFee;
  }

  double get _changeAmount {
    if (cashInputAmount < _grandTotal) return 0;
    return cashInputAmount - _grandTotal;
  }

  double get _shortfallAmount {
    if (cashInputAmount >= _grandTotal) return 0;
    return _grandTotal - cashInputAmount;
  }

  void _updateQty(int index, int delta) {
    setState(() {
      int newQty = (items[index]['qty'] as int) + delta;
      if (newQty <= 0) {
        items.removeAt(index);
      } else {
        items[index]['qty'] = newQty;
      }
    });
  }

  void _processCheckout() {
    if (items.isEmpty) {
      _showAlert('Keranjang kosong!');
      return;
    }

    if (selectedPaymentMethod == 'QRIS') {
      _showAlert('Pembayaran QRIS belum terhubung.');
      return;
    }

    if (selectedPaymentMethod == 'CASH' && cashInputAmount < _grandTotal) {
      _showAlert('Nominal uang tunai kurang dari total pembayaran!');
      return;
    }

    // Data transaksi dikirim dalam bentuk Map ke Halaman Struk
    final Map<String, dynamic> transactionData = {
      'transactionId':
          'TRX-${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}',
      'date': DateTime.now().toString().substring(0, 16),
      'eventName': 'Garuda FC melawan All Stars',
      'venue': 'Stadion Gelora',
      'items': items,
      'subtotal': _subtotal,
      'serviceFee': _serviceFee,
      'grandTotal': _grandTotal,
      'paymentMethod': selectedPaymentMethod,
      'cashPaid': selectedPaymentMethod == 'CASH'
          ? cashInputAmount
          : _grandTotal,
      'change': selectedPaymentMethod == 'CASH' ? _changeAmount : 0.0,
    };

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => ReceiptPage(transactionData: transactionData),
      ),
      ModalRoute.withName(AppRoutes.home),
    );
  }

  void _showAlert(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6F4),
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE0E7E0)),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 16,
              color: const Color(0xFF17231A),
            ),
          ),
          onPressed: () => Navigator.pop(context, items),
        ),
        title: const Text(
          'Pembayaran Tiket',
          style: TextStyle(
            color: const Color(0xFF17231A),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. MULTI ITEMS LIST
                  if (items.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Text(
                          'Belum ada tiket di keranjang.',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 24, color: Color(0xFFE0E7E0)),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Row(
                          children: [
                            Container(
                              width: 68,
                              height: 68,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF1EA),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                item['icon'],
                                size: 34,
                                color: const Color(0xFF263B2B),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: const Color(0xFF17231A),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => setState(
                                          () => items.removeAt(index),
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item['variant'],
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rp ${(item['price'] as num).toStringAsFixed(0)}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          _qtyButton(
                                            icon: Icons.remove,
                                            isActive: false,
                                            onTap: () => _updateQty(index, -1),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            child: Text(
                                              '${item['qty']}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xFF17231A),
                                              ),
                                            ),
                                          ),
                                          _qtyButton(
                                            icon: Icons.add,
                                            isActive: true,
                                            onTap: () => _updateQty(index, 1),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                  const SizedBox(height: 20),

                  // Metode pembayaran
                  const Text(
                    'Metode pembayaran',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF17231A),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _paymentTab(
                          title: 'Tunai',
                          icon: Icons.payments_outlined,
                          isSelected: selectedPaymentMethod == 'CASH',
                          onTap: () =>
                              setState(() => selectedPaymentMethod = 'CASH'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _paymentTab(
                          title: 'QRIS',
                          icon: Icons.qr_code_scanner_rounded,
                          isSelected: selectedPaymentMethod == 'QRIS',
                          onTap: () =>
                              setState(() => selectedPaymentMethod = 'QRIS'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  if (selectedPaymentMethod == 'CASH')
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Masukkan nominal tunai (Rp)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _cashController,
                            style: const TextStyle(color: Color(0xFF17231A)),
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: false,
                            ),
                            onChanged: (val) {
                              setState(() {
                                cashInputAmount = double.tryParse(val) ?? 0.0;
                              });
                            },
                            decoration: InputDecoration(
                              prefixText: 'Rp ',
                              hintText: 'Contoh: 200000',
                              filled: true,
                              fillColor: const Color(0xFFF4F6F4),
                              hintStyle: const TextStyle(color: Colors.black45),
                              prefixStyle: const TextStyle(
                                color: Colors.black54,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _quickCashChip(
                                'Pas Rp ${_grandTotal.toStringAsFixed(0)}',
                                _grandTotal,
                              ),
                              _quickCashChip('Rp 200.000', 200000),
                              _quickCashChip('Rp 500.000', 500000),
                            ],
                          ),
                          const Divider(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cashInputAmount < _grandTotal
                                    ? 'Kekurangan'
                                    : 'Kembalian',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                cashInputAmount < _grandTotal
                                    ? 'Rp ${_shortfallAmount.toStringAsFixed(0)}'
                                    : 'Rp ${_changeAmount.toStringAsFixed(0)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: cashInputAmount < _grandTotal
                                      ? Colors.redAccent
                                      : const Color(0xFF1DB954),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFF1DB954).withValues(alpha: 0.4),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Pindai kode QRIS untuk membayar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: const Color(0xFF17231A),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.qr_code_2_rounded,
                              size: 120,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Total tiket: Rp ${_grandTotal.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: Color(0xFF1DB954),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 20),

                  // 4. SUMMARY HARGA
                  _summaryRow(
                    'Subtotal tiket',
                    'Rp ${_subtotal.toStringAsFixed(0)}',
                  ),
                  const SizedBox(height: 8),
                  _summaryRow(
                    'Biaya layanan',
                    'Rp ${_serviceFee.toStringAsFixed(0)}',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Tombol Checkout Bawah
          Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: items.isEmpty ? null : _processCheckout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DB954),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  items.isEmpty
                      ? 'Keranjang kosong'
                      : 'Bayar Rp ${_grandTotal.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive ? const Color(0xFF1DB954) : const Color(0xFFE0E7E0),
          ),
        ),
        child: Icon(
          icon,
          size: 16,
          color: isActive ? const Color(0xFF1DB954) : const Color(0xFF17231A),
        ),
      ),
    );
  }

  Widget _paymentTab({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1DB954).withValues(alpha: 0.12)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF1DB954)
                : const Color(0xFFE0E7E0),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? const Color(0xFF1DB954) : Colors.black54,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? const Color(0xFF1DB954)
                    : const Color(0xFF17231A),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickCashChip(String label, double value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          cashInputAmount = value;
          _cashController.text = value.toStringAsFixed(0);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE0E7E0)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF17231A),
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
