import 'package:auvent_intership/core/network/local/cache_helper/cache_helper.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/auth_states.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/blocEvent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants/textStyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? name=FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(name==null?"user":name!),

            Center(
              child: BlocListener<AuthBloc,AuthState>(
                listener: (context, state) async{
                  if(state is LogoutSuccess)
                    {
                      print(state);
                     await CacheHelper.setData(key: "login", value: false);
                      Navigator.pushNamed(context, "login");
                    }
                },
                child: TextButton(
                  child: const Text("Home", style: CustomTextStyles.KnormalTextStyle),
                  onPressed: () {
                    context.read<AuthBloc>().add(LogOutEvent());
                  },
                ),

              ),
            ),
          ],
        ),
      ),

    );
  }
}
