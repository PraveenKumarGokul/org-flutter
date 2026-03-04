import 'packagefluttermaterial.dart';

void main() {
  runApp(TravelGuideApp());
}

class TravelGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner false,
      title 'Travel Guide',
      theme ThemeData(
        primarySwatch Colors.teal,
      ),
      home MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() = _MainScreenState();
}

class _MainScreenState extends StateMainScreen {
  int _selectedIndex = 0;

  final ListWidget _pages = [
    HomeScreen(),
    ExploreScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar AppBar(
        elevation 4,
        title Text(
          Travel Guide,
          style TextStyle(fontWeight FontWeight.bold),
        ),
        centerTitle true,
        actions [
          IconButton(
            icon Icon(Icons.search),
            onPressed () {},
          )
        ],
      ),
      drawer AppDrawer(),
      body _pages[_selectedIndex],
      bottomNavigationBar BottomNavigationBar(
        currentIndex _selectedIndex,
        selectedItemColor Colors.teal,
        unselectedItemColor Colors.grey,
        type BottomNavigationBarType.fixed,
        onTap _onItemTapped,
        items [
          BottomNavigationBarItem(
              icon Icon(Icons.home), label Home),
          BottomNavigationBarItem(
              icon Icon(Icons.explore), label Explore),
          BottomNavigationBarItem(
              icon Icon(Icons.favorite), label Favorites),
          BottomNavigationBarItem(
              icon Icon(Icons.person), label Profile),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child ListView(
        padding EdgeInsets.zero,
        children [
          UserAccountsDrawerHeader(
            decoration BoxDecoration(color Colors.teal),
            accountName Text(John Traveler),
            accountEmail Text(john@email.com),
            currentAccountPicture CircleAvatar(
              backgroundColor Colors.white,
              child Icon(Icons.person, size 40, color Colors.teal),
            ),
          ),
          ListTile(
            leading Icon(Icons.home),
            title Text(Home),
            onTap () = Navigator.pop(context),
          ),
          ListTile(
            leading Icon(Icons.location_on),
            title Text(Destinations),
            onTap () {},
          ),
          ListTile(
            leading Icon(Icons.hotel),
            title Text(Hotels),
            onTap () {},
          ),
          Divider(),
          ListTile(
            leading Icon(Icons.settings),
            title Text(Settings),
            onTap () {},
          ),
          ListTile(
            leading Icon(Icons.logout),
            title Text(Logout),
            onTap () {},
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding EdgeInsets.all(16),
      children [
        Text(
          Popular Destinations,
          style TextStyle(fontSize 20, fontWeight FontWeight.bold),
        ),
        SizedBox(height 16),
        DestinationCard(
          title Madurai,
          imageUrl
              libimages1.png,
        ),
        DestinationCard(
          title JAPAN,
          imageUrl
              libimages2.PNG,
        ),
      ],
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const DestinationCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape RoundedRectangleBorder(
        borderRadius BorderRadius.circular(15),
      ),
      margin EdgeInsets.only(bottom 16),
      child Column(
        children [
          ClipRRect(
            borderRadius BorderRadius.vertical(top Radius.circular(15)),
            child Image.network(imageUrl, height 180, fit BoxFit.cover),
          ),
          Padding(
            padding EdgeInsets.all(12),
            child Text(
              title,
              style TextStyle(fontSize 18, fontWeight FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child Text(Explore New Places));
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child Text(Your Favorite Destinations));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child Text(User Profile));
  }
}
