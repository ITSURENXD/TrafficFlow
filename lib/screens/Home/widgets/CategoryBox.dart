import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryBox extends StatefulWidget {
  const CategoryBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryBox> createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  bool _isClicked = false;

  void _toggleClick() {
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff131313),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Sandip Gyawali"),
            accountEmail: Text("sandipgyawali10@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://i.pinimg.com/564x/01/69/79/01697950bfa6134063e42bfc9cfba720.jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://i.pinimg.com/564x/03/11/51/031151d7883d2a893bb22f53e4a5eb15.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
            child: Column(
              children: [
                _buildDrawerItem(
                  icon: FontAwesomeIcons.route,
                  text: "Route",
                  onTap: () => print("Route tapped"),
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.solidBookmark,
                  text: "Bookmarks",
                  onTap: () => print("Bookmarks tapped"),
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.solidCalendarAlt,
                  text: "Calendar",
                  onTap: () => print("Calendar tapped"),
                ),
                Divider(color: Colors.grey[800]),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.cog,
                  text: "Settings",
                  onTap: () => print("Settings tapped"),
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.signOutAlt,
                  text: "Logout",
                  onTap: () => print("Logout tapped"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent, // Ensures the ripple effect is visible
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          10,
        ), // Customizable border radius for the ripple effect
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ), // Border radius for the ListTile background
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.grey[600]),
            title: Text(
              text,
              style: TextStyle(color: Colors.grey),
            ),
            // onTap is handled by the InkWell
          ),
        ),
      ),
    );
  }
}
