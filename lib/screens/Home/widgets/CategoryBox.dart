import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trafficflowdev/providers/user_provider.dart';
import 'package:trafficflowdev/resources/storage_methods.dart';
import 'package:trafficflowdev/utils/utils.dart';
import 'package:trafficflowdev/models/user.dart' as model;

class CategoryBox extends StatefulWidget {
  const CategoryBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryBox> createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  Uint8List? _image;

  bool _isClicked = false;

  void _toggleClick() {
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  void selectImage() async {
    print("Image Selected");
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() async {
      _image = im;
      String PhotoUrl = await StorageMethods()
          .uploadImageToStorage('Profile Pics', im, false);
      print(PhotoUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Drawer(
      backgroundColor: Color(0xff131313),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.username),
            accountEmail: Text(user.email),
            currentAccountPicture: _image != null
                ? InkWell(
                    onTap: selectImage,
                    child: CircleAvatar(
                        radius: 64, backgroundImage: MemoryImage(_image!)),
                  )
                : InkWell(
                    onTap: selectImage,
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmoonvillageassociation.org%2Fwp-content%2Fuploads%2F2018%2F06%2Fdefault-profile-picture1.jpg&f=1&nofb=1&ipt=d4567ab05591cbaf46bd589359cfc6a89655bec4f83333403ec068cc58a9fb90&ipo=images",
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
            decoration: const BoxDecoration(
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
              style: const TextStyle(color: Colors.grey),
            ),
            // onTap is handled by the InkWell
          ),
        ),
      ),
    );
  }
}
