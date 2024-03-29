import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_app/cubit/cubit.dart';
import 'package:social_app/layout/social_app/social_layout.dart';
import 'package:social_app/modules/social_app/login/social_login_screen.dart';
import 'package:social_app/shared/bloc_observer.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'package:social_app/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  // FireBase
  await Firebase.initializeApp();

  Widget widget;

  bool isDark = CacheHelper.getData(key: 'isDark');
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');


  uId = CacheHelper.getData(key: 'uId');

  if(uId != null){
    widget = SocialLayout();
  }else{
    widget = SocialLoginScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget{

  final bool isDark;
  final Widget startWidget;

  MyApp({
    this.isDark,
    this.startWidget
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context)=>AppCubit(),
          ),
          BlocProvider(
              create: (BuildContext context) => SocialCubit()..getUserData()
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state){

            },
            builder: (context, state){
              return  MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: ThemeMode.light,
                home: startWidget,
              );
            },
        ),
    );
  }
}




