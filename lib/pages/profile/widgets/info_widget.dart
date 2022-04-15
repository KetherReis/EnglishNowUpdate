import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profile_info_tile.dart';

class InfoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('usersProfile').doc(
            FirebaseAuth.instance.currentUser?.uid).snapshots(),
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text(
                  'name_dot'.tr(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text('${snapshot.data?.data()?['name']}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle2,
                ),
                trailing: CircleAvatar(
                  radius: 25,
                  backgroundImage:  NetworkImage('${snapshot.data?.data()?['url']}',
                  ),
                  ) ,
                ),
              Divider(
                height: 1.5,
                color: Colors.grey[200],
                indent: 15,
                endIndent: 15,
              ),
              ProfileInfoTile(
                title: 'contact_number'.tr(),
                trailing: snapshot.data?.data()?['number'],
                hint: 'phone_add'.tr(),
              ),
              ProfileInfoTile(
                title: 'email'.tr(),
                trailing: snapshot.data?.data()?['email'],
                hint: 'add_email'.tr(),
              ),
              ProfileInfoTile(
                title: 'gender'.tr(),
                trailing: snapshot.data?.data()?['gender'],
                hint: 'add_gender'.tr(),
              ),
              ProfileInfoTile(
                title: 'date_of_birth'.tr(),
                trailing: snapshot.data?.data()?['birth'],
                hint: 'dd mm yyyy',
              ),
              ProfileInfoTile(
                title: 'experience_level'.tr(),
                trailing: snapshot.data?.data()?['experience'],
                hint: 'add_experience_level'.tr(),
              ),
            ],
          );
        });
  }
}
