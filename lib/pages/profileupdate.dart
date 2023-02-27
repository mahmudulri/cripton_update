import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  var fileName = '';

  var selectedImagePath = '';

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    // final profileUpdateViewModel = Provider.of<ProfileUpdateViewModel>(context, listen: false);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Employee image management",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(2, 0),
                  ),
                ],
                color: Colors.white,
              ),
              height: screenHeight * 0.070,
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextField(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter User ID",
                            helperStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            // height: screenHeight * 0.200,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 5,
                right: 5,
                bottom: 5,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40))),
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(40))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.020,
                                  ),
                                  Text(
                                    "Change Image",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.010,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    child: Divider(
                                      height: 1.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.020,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Icon(Icons.camera),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.020,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          // await profileUpdateViewModel.getImage(ImageSource.camera);
                                          await getImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Take Photo",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.020,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Icon(Icons.photo_camera),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.020,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          // await profileUpdateViewModel.getImage(ImageSource.gallery);
                                          await getImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Upload Photo",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          imageFile == null
                              ? Container(
                                  height: 120,
                                  width: 120,
                                  color: Colors.amber,
                                  child: Image.asset(
                                    "assets/images/no-image.png",
                                  ))
                              : Container(
                                  height: 120,
                                  width: 120,
                                  child: Image(
                                    image: FileImage(imageFile!),
                                    fit: BoxFit.cover,
                                  ),
                                  // decoration: BoxDecoration(
                                  //   image: DecorationImage(
                                  //       image: FileImage(imageFile!)
                                  //           as ImageProvider),
                                  // ),
                                ),
                          // Visibility(
                          //   visible: profileUpdateViewModel.selectedImagePath == "" ? true : false ,
                          //   child: Text(
                          //     "Image not found",
                          //     style: TextStyle(
                          //       color: Colors.red,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "MD Mahmud Hasan",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.008,
                        ),
                        Text(
                          "Manager",
                        ),
                        Text(
                          "Business Automation",
                        ),
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        Text(
                          "Status",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        Row(
                          children: [
                            Container(
                              color: Color(0xff00AA44),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Permanent",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.timer_outlined),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "2 years ago",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("01580"),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                        Text("Emp. ID"),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        selectedImagePath = pickedFile.path;
        print(
            "immmmmmmmmmmmmmmmmmgggggggggggggg" + selectedImagePath.toString());

        imageFile = File(pickedFile.path);
      });
    } else {}
  }
}
