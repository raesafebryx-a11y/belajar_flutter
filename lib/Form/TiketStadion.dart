import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/Form/tiket_checkout_page.dart';

// ============================================================================
// HALAMAN 1: DAFTAR TIKET STADION / BOLA (DISCOVER PAGE)
// ============================================================================
class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  String selectedCategory = 'Semua';
  String searchQuery = '';

  // Kategori Tribun Stadion menggunakan List<String>
  final List<String> categories = [
    'Semua',
    'Tribun Eksklusif Timur',
    'Kategori 1',
    'Kategori 2',
    'Tribun Suporter',
  ];

  // Data tiket pertandingan bola.
  final List<Map<String, dynamic>> products = [
    {
      'id': 't1',
      'name': 'Tribun Utama Eksklusif',
      'variant': 'Gerbang A • Pemandangan terbaik',
      'category': 'Tribun Eksklusif Timur',
      'price': 150000.0,
      'image': 'assets/images/tiketvip.jpg',
      'rating': 5.0,
      'icon': Icons.airline_seat_recline_extra_rounded,
      'color': const Color(0xFFE5F1E7),
    },
    {
      'id': 't2',
      'name': 'Tribun Kategori 1',
      'variant': 'Gerbang B • Sektor 12',
      'category': 'Kategori 1',
      'price': 85000.0,
      'image': 'assets/images/tiket.jpg',
      'rating': 4.8,
      'icon': Icons.stadium_rounded,
      'color': const Color(0xFFE7EFF8),
    },
    {
      'id': 't3',
      'name': 'Tribun Kategori 2',
      'variant': 'Gerbang C • Sektor 24',
      'category': 'Kategori 2',
      'price': 45000.0,
      'image': 'assets/images/tiket.jpg',
      'rating': 4.6,
      'icon': Icons.local_activity_rounded,
      'color': const Color(0xFFFFF3D8),
    },
    {
      'id': 't4',
      'name': 'Tribun Suporter Selatan',
      'variant': 'Area berdiri • Gerbang D',
      'category': 'Tribun Suporter',
      'price': 30000.0,
      'image': 'assets/images/tiketvip.jpg',
      'rating': 4.9,
      'icon': Icons.sports_soccer_rounded,
      'color': const Color(0xFFF9E8E8),
    },
    {
      'id': 't5',
      'name': 'Boks Stadion Eksklusif',
      'variant': 'Gerbang khusus • Termasuk konsumsi',
      'category': 'Tribun Eksklusif Timur',
      'price': 350000.0,
      'image': 'assets/images/tiketvip.jpg',
      'rating': 5.0,
      'icon': Icons.star_rounded,
      'color': const Color(0xFFE5F1E7),
    },
    {
      'id': 't6',
      'name': 'Tribun Keluarga',
      'variant': 'Gerbang E • Sektor 08',
      'category': 'Kategori 1',
      'price': 90000.0,
      'image': 'assets/images/tiket.jpg',
      'rating': 4.7,
      'icon': Icons.family_restroom_rounded,
      'color': const Color(0xFFE7EFF8),
    },
  ];

  List<Map<String, dynamic>> cartItems = [];

  // Fungsi menambah tiket ke keranjang
  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      int existingIndex = cartItems.indexWhere(
        (item) => item['id'] == product['id'],
      );
      if (existingIndex != -1) {
        cartItems[existingIndex]['qty'] += 1;
      } else {
        cartItems.add({
          'id': product['id'],
          'name': product['name'],
          'variant': product['variant'],
          'price': product['price'],
          'qty': 1,
          'icon': product['icon'],
        });
      }
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tiket "${product['name']}" ditambahkan ke keranjang'),
        backgroundColor: const Color(0xFF1DB954),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // Menghitung total tiket di keranjang
  int get _totalCartCount {
    int total = 0;
    for (var item in cartItems) {
      total += (item['qty'] as int);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // Filter tiket berdasarkan kategori tribun & pencarian
    List<Map<String, dynamic>> filteredProducts = products.where((product) {
      bool matchCat =
          selectedCategory == 'Semua' ||
          product['category'] == selectedCategory;
      bool matchSearch = product['name'].toString().toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return matchCat && matchSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (Navigator.canPop(context)) ...[
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                          color: Colors.black87,
                        ),
                      ],
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'STADION GELORA',
                            style: TextStyle(
                              fontSize: 11,
                              color: const Color(0xFF4F7157),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Tiket Pertandingan',
                            style: TextStyle(
                              fontSize: 22,
                              color: const Color(0xFF17231A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    tooltip: 'Keranjang tiket',
                    onPressed: () async {
                      final updatedCart = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CheckoutPage(cartItems: cartItems),
                        ),
                      );
                      if (updatedCart is List<Map<String, dynamic>>) {
                        setState(() => cartItems = updatedCart);
                      }
                    },
                    icon: Badge(
                      label: Text('$_totalCartCount'),
                      isLabelVisible: _totalCartCount > 0,
                      backgroundColor: const Color(0xFF1DB954),
                      child: const Icon(Icons.shopping_bag_outlined),
                    ),
                    color: const Color(0xFF17231A),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE0E7E0)),
                ),
                child: TextField(
                  onChanged: (value) => setState(() => searchQuery = value),
                  style: const TextStyle(color: Color(0xFF17231A)),
                  decoration: const InputDecoration(
                    hintText: 'Cari kategori tribun atau tiket...',
                    hintStyle: TextStyle(color: Colors.black45, fontSize: 13),
                    prefixIcon: Icon(Icons.search, color: Colors.black54),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Banner pertandingan
              SizedBox(
                height: 170,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/stadion.jpg',
                        fit: BoxFit.cover,
                      ),
                      Container(color: const Color(0x55000000)),
                      const Padding(
                        padding: EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'DERBY AKHIR PEKAN',
                              style: TextStyle(
                                color: Color(0xFFB8F2C2),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Garuda FC melawan All Stars',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Minggu, pukul 19.30 • Stadion Gelora',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Pilihan Tribun Stadion Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih Kategori Tribun',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17231A),
                    ),
                  ),
                  TextButton(
                    onPressed: () => setState(() => selectedCategory = 'Semua'),
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF1DB954),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Horizontal Kategori Tribun Chips
              ScrollConfiguration(
                behavior: const MaterialScrollBehavior().copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: SizedBox(
                  height: 38,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      final isSelected = selectedCategory == cat;
                      return GestureDetector(
                        onTap: () => setState(() => selectedCategory = cat),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF1DB954)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF1DB954)
                                  : const Color(0xFFE0E7E0),
                            ),
                          ),
                          child: Text(
                            cat,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF28352B),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Grid Daftar Tiket Stadion
              Expanded(
                child: GridView.builder(
                  itemCount: filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.74,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredProducts[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xFFE0E7E0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Kotak Ilustrasi Ikon Tribun
                          Expanded(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.asset(
                                    item['image'] as String,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            ColoredBox(
                                              color: item['color'] as Color,
                                              child: Icon(
                                                item['icon'] as IconData,
                                                size: 58,
                                                color: const Color(0xFF263B2B),
                                              ),
                                            ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () => _addToCart(item),
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF1DB954),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Nama Tribun & Rating
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item['name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: const Color(0xFF17231A),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      '${item['rating']}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              item['variant'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          // Harga Tiket
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Text(
                              'Rp ${(item['price'] as num).toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1DB954),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1DB954),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.stadium_rounded),
            label: 'Stadion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_rounded),
            label: 'Tiket Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
