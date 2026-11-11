import 'package:flutter/material.dart';

const _forestGreen = Color(0xFF176B58);
const _mint = Color(0xFFE7F3EE);
const _ink = Color(0xFF20332D);
const _mutedInk = Color(0xFF718078);

void main() {
  runApp(const LocalSwapApp());
}

class LocalSwapApp extends StatelessWidget {
  const LocalSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _forestGreen,
      brightness: Brightness.light,
    );

    return MaterialApp(
      title: 'LocalSwap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: const Color(0xFFF7F9F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F9F7),
          foregroundColor: _ink,
          elevation: 0,
          centerTitle: false,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _forestGreen,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LocalSwap',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _BrandHeader(),
            const SizedBox(height: 28),
            Text(
              'Les annonces près de vous',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: _ink,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Les bonnes trouvailles commencent dans votre quartier.',
              style: TextStyle(color: _mutedInk, height: 1.4),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  _ListingCard(),
                  SizedBox(height: 16),
                  _FutureListingsNote(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Publier une annonce',
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _mint,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: _forestGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.swap_horiz_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LocalSwap',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: _ink,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Donnez, échangez, trouvez près de chez vous.',
                  style: TextStyle(color: _mutedInk, height: 1.35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListingCard extends StatelessWidget {
  const _ListingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE7ECE8)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D20332D),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              key: const ValueKey('listing-image-stack'),
              children: [
                Container(
                  width: 104,
                  height: 112,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1EDE3),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.chair_alt_rounded,
                    color: Color(0xFF92734D),
                    size: 48,
                  ),
                ),
                Positioned(
                  top: 7,
                  left: 7,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Maison',
                      style: TextStyle(
                        color: _forestGreen,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chaise vintage',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: _ink,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'En très bon état, prête pour une nouvelle vie.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: _mutedInk, height: 1.35),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: _forestGreen,
                        size: 16,
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          'À 2 km · Centre-ville',
                          style: TextStyle(
                            color: _mutedInk,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'À échanger',
                    style: TextStyle(
                      color: _forestGreen,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FutureListingsNote extends StatelessWidget {
  const _FutureListingsNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2EF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.explore_outlined, color: _forestGreen),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'La liste des annonces sera disponible au TP4.',
              style: TextStyle(color: _mutedInk),
            ),
          ),
        ],
      ),
    );
  }
}
