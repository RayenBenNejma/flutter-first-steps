import 'package:flutter/material.dart';

class Member {
  const Member({required this.name, required this.city, required this.since});

  final String name;
  final String city;
  final int since;
}

const List<String> _firstNames = [
  'Amira',
  'Youssef',
  'Sarra',
  'Mehdi',
  'Ines',
  'Karim',
  'Nour',
  'Aziz',
  'Rania',
  'Hamza',
];

const List<String> _cities = ['Tunis', 'Bizerte', 'Sousse', 'Sfax', 'Nabeul'];

final List<Member> members = List<Member>.generate(
  50,
  (i) => Member(
    name: '${_firstNames[i % _firstNames.length]} ${i + 1}',
    city: _cities[i % _cities.length],
    since: 2015 + i % 10,
  ),
)..add(
    const Member(name: 'Rayen Ben Nejma', city: 'Tunis', since: 2015),
  );

class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const DirectoryPage(),
    );
  }
}

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({super.key});

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
  bool _showGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Annuaire du club'),
        actions: [
          IconButton(
            tooltip: _showGrid ? 'Afficher en liste' : 'Afficher en grille',
            onPressed: () => setState(() => _showGrid = !_showGrid),
            icon: Icon(_showGrid ? Icons.view_list : Icons.grid_view),
          ),
        ],
      ),
      body: _showGrid ? _buildGrid() : _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        debugPrint("ListView construit l'élément $index");
        final Member member = members[index];
        return ListTile(
          leading: MemberAvatar(name: member.name),
          title: Text(member.name),
          subtitle: Text('${member.city} · membre depuis ${member.since}'),
          trailing: const Icon(Icons.chevron_right),
        );
      },
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: members.length,
      itemBuilder: (context, index) {
        final Member member = members[index];
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MemberAvatar(name: member.name, radius: 32),
              const SizedBox(height: 8),
              Text(member.name, textAlign: TextAlign.center),
              Text(member.city, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        );
      },
    );
  }
}

class MemberAvatar extends StatelessWidget {
  const MemberAvatar({super.key, required this.name, this.radius = 20});

  final String name;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return CircleAvatar(
      radius: radius,
      backgroundColor: colors.secondaryContainer,
      foregroundColor: colors.onSecondaryContainer,
      child: Text(name[0].toUpperCase()),
    );
  }
}
