import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/layout/social_app/cubit/cubit.dart';
import 'package:social_app/layout/social_app/cubit/state.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;

        nameController.text = userModel.name;
        bioController.text = userModel.bio;
        phoneController.text = userModel.phone;

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              defaultTextButton(
                function: () {
                  SocialCubit.get(context).updateUser(
                      name: nameController.text,
                      bio: bioController.text,
                      phone: phoneController.text);
                },
                text: 'Update',
              ),
              SizedBox(
                width: 15.0,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 190.0,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0)),
                                  image: DecorationImage(
                                    image: coverImage == null
                                        ? NetworkImage('${userModel.cover}')
                                        : FileImage(coverImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 18.0,
                                  ),
                                ),
                                onPressed: () {
                                  SocialCubit.get(context).getCoverImage();
                                },
                              ),
                            ],
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: profileImage == null
                                    ? NetworkImage(
                                        '${userModel.image}',
                                      )
                                    : FileImage(profileImage),
                              ),
                            ),
                            IconButton(
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 18.0,
                                ),
                              ),
                              onPressed: () {
                                SocialCubit.get(context).getProfileImage();
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Name Must Not Be Empty!';
                      }
                      return null;
                    },
                    label: 'Name',
                    prefix: IconBroken.User,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    controller: bioController,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Bio Must Not Be Empty!';
                      }
                      return null;
                    },
                    label: 'Bio',
                    prefix: IconBroken.Info_Circle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Phone Must Not Be Empty!';
                      }
                      return null;
                    },
                    label: 'Phone',
                    prefix: IconBroken.Calling,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
