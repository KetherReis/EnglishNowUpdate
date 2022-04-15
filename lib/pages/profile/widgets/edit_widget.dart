import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:englishnow/components/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/constants.dart';

class EditWidget extends StatefulWidget {
  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {


  final ImagePicker _picker = ImagePicker();
  var _selectedGender = 'male'.tr();
  String userID = "";

  List userProfileList = [];

  fetchUserInfo() async {
    User? getUser = FirebaseAuth.instance.currentUser;
    userID = getUser!.uid;
  }


  var name;
  var email;
  var gender;
  var experience;
  var number;
  var photo;
  var imageName = FirebaseAuth.instance.currentUser?.uid;
  var birth;
  var storage = FirebaseStorage.instance;


  var _selectedExperienceGroup = 'Sem experiência';
  var _genderItems = <String>['male'.tr(), 'female'.tr()];
  var _experienceItems = <String>[
    'Sem experiência',
    'Iniciante',
    'Intermediário',
    'Avançado',
    'Fluente',
    'Nativo',
  ];

  var _birthDate = '01/01/2000';
  var myFormat = DateFormat('d-MM-yyyy');

  late List<DropdownMenuItem<String>> _dropDownGender;
  late List<DropdownMenuItem<String>> _dropDownExperience;

  File? _image;

  Future _getImage(ImageSource imageSource) async {
    PickedFile? _imageFile;
    _imageFile = await _picker.getImage(source: imageSource);
    if (_imageFile != null) {
      setState(() {
        _image = File(_imageFile!.path);
      });
      //uploadPic();
    }
  }

  _initDropDowns() {
    _dropDownGender = _genderItems
        .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
        .toList();

    _dropDownExperience = _experienceItems
        .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _initDropDowns();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  _openBottomSheet(context);
                },
                child: _image == null
                    ? CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.grey,
                        //backgroundImage: NetworkImage(avatarUrl),
                      )
                    : CircleAvatar(
                        radius: 100,
                        backgroundImage: FileImage(_image!),
                      ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  _openBottomSheet(context);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(4)),
                child: Text(
                  'change_avatar'.tr(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(height: 15),
            TextFormField(
              onChanged: (value){
                name = value;
                },
              decoration: const InputDecoration(
                labelText: 'Name *',
                hintText: 'Your name here',
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              onChanged: (value){
                number = value;
              },
                keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
              labelText: 'Number *',
              hintText: 'Your number here',
            ),

            ),
            SizedBox(height: 15),
            TextFormField(
              onChanged: (value){
                email = value;
              },
              decoration: const InputDecoration(
                labelText: 'Email *',
                hintText: 'Your email here',
              ),
            ),
            SizedBox(height: 15),
            Text(
              'gender_dot'.tr(),
              style: kInputTextStyle,
            ),
            DropdownButton(
              isExpanded: true,
              value: _selectedGender,
              //hint: ,
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value!;
                  gender = value;
                });
              },
              items: _dropDownGender,
            ),
            SizedBox(height: 15),
            Text(
              'date_of_birth_dot'.tr(),
              style: kInputTextStyle,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(_birthDate),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  initialEntryMode: DatePickerEntryMode.calendar,
                ).then((DateTime? value) {
                  if (value != null) {
                    setState(() {
                      _birthDate = value.toString();
                      birth = value.toString();
                    });
                  }
                });
              },

            ),
            SizedBox(height: 15),
            Text(
              'add_experience_level'.tr(),
              style: kInputTextStyle,
            ),
            DropdownButton(
              isExpanded: true,
              value: _selectedExperienceGroup,
              //hint: ,
              onChanged: (String? value) {
                setState(() {
                  _selectedExperienceGroup = value!;
                  experience = value;
                });
              },
              items: _dropDownExperience,
            ),
            SizedBox(height: 15),
            CustomButton(
              onPressed: () {
                updateProfile();
                Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
              },
              text: 'update_info'.tr(),
            ),
          ],
        ),
      ),
    );
  }

  _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.camera,
                  size: 20,
                ),
                title: Text(
                  'take_a_photo'.tr(),
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  size: 20,
                ),
                title: Text(
                  'choose_a_photo'.tr(),
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.gallery);
                },
              ),
            ],
          );
        });
  }

  Future<void> updateProfile() async{
    TaskSnapshot snapshot = await storage
        .ref()
        .child("images/$imageName")
        .putFile(_image!);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    FirebaseFirestore.instance.collection('usersProfile').doc(
        FirebaseAuth.instance.currentUser?.uid).set({'name': name, 'gender': gender, 'experience': experience, 'number': number, 'birth': birth, 'email': email,"url": downloadUrl});
  }
}
