// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

enum SingingCharacter { male, female }

class _EditProfileState extends State<EditProfile> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _age = TextEditingController();
  final _height = TextEditingController();
  // final SingingCharacter _character = SingingCharacter.male;
  TextEditingController dateinput = TextEditingController();

  String radioButtonItem = 'Male';
  int _genid = 1;
  String profileURL = '';
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String gender;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 200,
        centerTitle: true,
        elevation: 0.0,
        title: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Column(
                children: [
                  const Text(
                    "Edit Profile",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          radius: 45.0,
                          // backgroundImage: ,
                        ),
                        IconButton(
                          alignment: Alignment.topLeft,
                          onPressed: () async {
                            ImagePicker profileImage = ImagePicker();
                            XFile? file = await profileImage.pickImage(
                                source: ImageSource.camera);
                            print('${file?.path}');

                            if (file != null) return;
                            // String uniqueFileName = DateTime.now()
                            //     .millisecondsSinceEpoch
                            //     .toString();
                            //ref to storage root
                            //Reference referenceRoot=FirebaseStorage.instance.ref();
                            //Reference referenceDirImage=referenceRoot.child('image');
                            //creating refere for image to be uploaded
                            //Reference referenceImageToUpload=referenceDirImage.child('${file?.path}');
                            //or
                            // Reference referenceImageToUpload=referenceDirImage.child(uniqueFileName);
                            // try{
                            //store
                            //   await referenceImageToUpload.putFile(File(file!.path));
                            //   profileURL=await referenceImageToUpload.getDownloadURL();
                            // }
                            // catch(error)
                            // {
                            //

                            // }
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ButtonTheme(
                minWidth: 200,
                child: TextButton(
                  onPressed: () {
                    final name = _name.text;
                    final email = _email.text;
                    final genid = _genid;
                    final age = _age.text;
                    final height = _height.text;
                    createUser(
                      name: name,
                      email: email,
                      genid: genid,
                      age: age,
                      height: height,
                    );
                  },
                  child: const Text("Save!"),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        // decoration: BoxDecoration(
        //   color: Colors.black12,
        //   borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(15),
        //     topLeft: Radius.circular(15),
        //   ),
        //   // BorderRadius.circular(15),
        // ),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Full Name:"),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Email:"),
                  TextFormField(
                    controller: _email,
                    decoration:
                        const InputDecoration(hintText: 'abcd@example.com'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Text("Gender:"),
                      Radio(
                        value: 1,
                        groupValue: _genid,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Male';
                            _genid = 1;
                          });
                        },
                      ),
                      const Text(
                        'Male',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      Radio(
                        value: 2,
                        groupValue: _genid,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Female';
                            _genid = 2;
                          });
                        },
                      ),
                      const Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Column(
                          children: [
                            const Text("Age(Years):"),
                            TextFormField(
                              controller: _age,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Column(
                          children: [
                            const Text("Height(In cm):"),
                            TextFormField(
                              controller: _height,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Weight:"),
                  TextFormField(
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Blood Group:"),
                  TextFormField(),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Birth Date:"),
                  TextFormField(
                    controller: dateinput,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  Future createUser({
    required String name,
    required String email,
    required int genid,
    required String age,
    required String height,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(name);
    String id = docUser.id;
    final user = User(
      id = docUser.id,
      name: name,
      email: email,
      age: age,
      birthday: DateTime(2001, 7, 28),
      genid: genid,
      height: height,
    );
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  final int genid;
  String id;
  final String height;
  final String name;
  final String email;
  final String age;
  final DateTime birthday;

  User(
    String s, {
    this.id = '',
    required this.height,
    required this.name,
    required this.email,
    required this.age,
    required this.birthday,
    required this.genid,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'height': height,
        'age': age,
        'birthday': birthday,
      };
}
