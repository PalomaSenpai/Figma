import 'package:flutter/material.dart';
import 'package:pmsn2025/views/tips_view.dart';


class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  int selectedIndex = 0;
  int bottomNavIndex = 1; // Control del Bottom Navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resources",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.purple), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications, color: Colors.purple), onPressed: () {}),
          IconButton(icon: Icon(Icons.person, color: Colors.purple), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                _buildOptionButton(0, "Videos"),
                _buildOptionButton(1, "Tips"),
              ],
            ),
          ),
          Expanded(
            child: selectedIndex == 0
                ? Center(child: Text("Videos content"))
                : Align(
                    alignment: Alignment.topCenter,
                    child: ListView(
                      padding: EdgeInsets.all(20),
                      shrinkWrap: true,
                      children: [
                        TipsView(),
                        SizedBox(height: 10),
                        TipsView()
                      ],
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildOptionButton(int index, String text) {
    bool isSelected = selectedIndex == index;
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.yellow : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      color: Color(0xFFB38BFA), // Color de fondo púrpura claro
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.insert_drive_file, 1),
            _buildNavItem(Icons.star, 2),
            _buildNavItem(Icons.support_agent, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isActive = bottomNavIndex == index;
    return IconButton(
      icon: Icon(icon, color: isActive ? Colors.white : Colors.white60, size: 28),
      onPressed: () {
        setState(() {
          bottomNavIndex = index;
        });
      },
    );
  }
}
