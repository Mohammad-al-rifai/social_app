abstract class SocialStates{}

class SocialInitialState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates {
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialChangeBottomNavBarState extends SocialStates {}

class SocialNewPostState extends SocialStates {}


    // ======== ProfileImage ================ //

class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedErrorState extends SocialStates {}



// ======== CoverImage ================ //

class SocialCoverImagePickedSuccessState extends SocialStates {}

class SocialCoverImagePickedErrorState extends SocialStates {}


// ======== ProfileImage Upload ================ //

class SocialUploadProfileImageSuccessState extends SocialStates {}

class SocialUploadProfileImageErrorState extends SocialStates {}



// ======== CoverImage Upload ================ //

class SocialUploadCoverImageSuccessState extends SocialStates {}

class SocialUploadCoverImageErrorState extends SocialStates {}


// ======== User Update ERROR ================ //

class SocialUserUpdateErrorState extends SocialStates {}