import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSearchBar extends StatefulWidget {
  @override
  _HomeSearchBarState createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final TextEditingController _controller = TextEditingController();
  String _searchText = ""; // Variable to hold the current input text

  @override
  void initState() {
    super.initState();
    // Listener to update the state based on text changes
    _controller.addListener(() {
      setState(() {
        _searchText = _controller.text;
        print(_searchText);
      });
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed from the widget tree
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff131313),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      height: 100,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
          right: 25,
          bottom: 0,
          left: 25,
        ),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
            prefixIcon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 14.0,
              color: Colors.grey[600],
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      _controller
                          .clear(); // This also updates _searchText because of the listener
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.grey[600],
                    ),
                  )
                : null,
            hintText: "Wanna go somewhere?",
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5),
            ),
            filled: true,
            fillColor: Color(0xff313131),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffC67C4E),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[600]!),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
          onChanged: (text) {
            // The state is already being updated by the controller's listener
          },
        ),
      ),
    );
  }
}
