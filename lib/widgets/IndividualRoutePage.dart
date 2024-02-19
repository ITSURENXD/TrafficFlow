import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IndividualRoutePage extends StatefulWidget {
  const IndividualRoutePage({
    Key? key,
  }) : super(key: key);

  @override
  State<IndividualRoutePage> createState() => _IndividualRoutePage();
}

class _IndividualRoutePage extends State<IndividualRoutePage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'lib/images/map.jpeg',
            width: media.width,
            height: media.width,
            fit: BoxFit.cover,
          ),
          Container(
            width: media.width,
            height: media.height,
            decoration: BoxDecoration(),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: media.width - 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: Offset(0, -8),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            "Mulpani-Rnac",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IgnorePointer(
                                    ignoring: true,
                                    child: RatingBar.builder(
                                      initialRating: 4,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0,
                                      ),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber[600],
                                      ),
                                      onRatingUpdate: (rating) {
                                        print("rating");
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "4.1 Star (2,300)",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: Text(
                                "Description",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: Divider(
                                color: Colors.grey[300],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: Text(
                                "Mediums:",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100, // specify the width
                                  height: 50, // specify the height
                                  margin: EdgeInsets.all(5), // Add some margin
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .white, // Background color of the box
                                    borderRadius: BorderRadius.circular(
                                        10), // Border radius of the box
                                    border: Border.all(
                                      color: Colors.grey, // Border color
                                      width: 1, // Border width
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Bus',
                                      style: TextStyle(
                                        color: Colors.grey, // Text color
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100, // specify the width
                                  height: 50, // specify the height
                                  margin: EdgeInsets.all(5), // Add some margin
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .white, // Background color of the box
                                    borderRadius: BorderRadius.circular(
                                        10), // Border radius of the box
                                    border: Border.all(
                                      color: Colors.grey, // Border color
                                      width: 1, // Border width
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Micro Bus',
                                      style: TextStyle(
                                        color: Colors.grey, // Text color
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100, // specify the width
                                  height: 50, // specify the height
                                  margin: EdgeInsets.all(5), // Add some margin
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .white, // Background color of the box
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ), // Border radius of the box
                                    border: Border.all(
                                      color: Colors.grey, // Border color
                                      width: 1, // Border width
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tempo',
                                      style: TextStyle(
                                        color: Colors.grey, // Text color
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        // Padding inside the container around the IconButton
                        decoration: BoxDecoration(
                          color: Color(
                            0xff131313,
                          ), // Background color of the container
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.white, // Icon color
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
