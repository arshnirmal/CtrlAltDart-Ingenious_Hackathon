import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

var number = "";

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // SingleChildScrollView(
          //   child: StreamBuilder<DocumentSnapshot>(
          //     stream: FirebaseFirestore.instance
          //         .collection('users')
          //         .doc('nihal')
          //         .snapshots(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(child: CircularProgressIndicator());
          //       }
          //       var doc = snapshot.data;
          //       return
          Container(
        // padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.arrow_back_ios),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Icon(Icons.sunny),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Icon(Icons.person, size: 60),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.black12,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://media.wired.com/photos/5e3246cd56bcac00087f0a1e/master/pass/Culture-Success-Meme-Kid.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: 100,
                      width: 100,
                      // child: Card(
                      // child:
                      // Icon(
                      //   Icons.person,
                      //   size: 55,
                      // ),
                    ),
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text("Hi "),
                            Text("User!"),
                          ],
                        ),
                        const Text("Mail Id:"),
                        SizedBox(
                          height: 40,
                          child: Card(
                            child:
                                // IconButton(
                                //   onPressed: () {
                                //     // print(name);
                                //     // print(email);
                                //     // print(number);
                                //     // Get.to(() => editProfile(), arguments: {
                                //     //   "name": doc?.get("name"),
                                //     //   "email": doc?.get("email"),
                                //     //   "imageUrl": doc?.get("image"),
                                //     //   "number": doc?.get("number"),
                                //     //   "gender":
                                //     //       doc?.get("gender").toLowerCase()
                                //     // });
                                //   },
                                //   icon: const ImageIcon(
                                //     AssetImage("assets/icons/profile-edit.png"),
                                //   ),
                                // ),
                                TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EditProfile(),
                                  ),
                                );
                              },
                              child: const Text("Edit Profile"),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: const EdgeInsets.all(15.0),
              color: Colors.black12,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        child: Container(
                          width: 130,
                          height: 130,
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Gender:"),
                              SizedBox(
                                height: 15.0,
                              ),
                              Center(
                                child: Text(
                                  "Male",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          width: 130,
                          height: 130,
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Age:"),
                              SizedBox(
                                height: 15.0,
                              ),
                              Center(
                                child: Text(
                                  "21",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        child: Container(
                          width: 130,
                          height: 130,
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Height:"),
                              SizedBox(
                                height: 15.0,
                              ),
                              Center(
                                child: Text(
                                  "170 cm",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          width: 130,
                          height: 130,
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Weight:"),
                              SizedBox(
                                height: 15.0,
                              ),
                              Center(
                                child: Text(
                                  "60",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        child: Container(
                          width: 130,
                          height: 130,
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Blood:"),
                              SizedBox(
                                height: 15.0,
                              ),
                              Center(
                                child: Text(
                                  "O+",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          width: 130,
                          height: 130,
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Birth Date:"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: Text(
                                  "28-01-2023",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 120,
              width: double.infinity,
              child: Card(
                child: Text("Health Number"),
              ),
            ),
            const SizedBox(
              height: 120,
              width: double.infinity,
              child: Card(
                child: Text("Medical Claims"),
              ),
            ),
            const SizedBox(
              height: 120,
              width: double.infinity,
              child: Card(
                child: Text("Reports"),
              ),
            ),
          ],
        ),
      ),
    );
  }
  //     ),
  //   ),
  // );
}
