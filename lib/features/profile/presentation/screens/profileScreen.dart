import 'package:auvent_intership/core/network/local/cache_helper/cache_helper.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/auth_states.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/blocEvent.dart';
import 'package:auvent_intership/features/auth/presentation/widgets/customSnackbar.dart';
import 'package:auvent_intership/features/auth/presentation/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocListener<AuthBloc,AuthState>(
        listener: (context, state) async{
          if(state is LogoutSuccess)
            {
              await CacheHelper.setData(key: "login", value: false);
              CustomSnackBar(context, Colors.blue,"log out success");
              Navigator.pushNamed(context, "login");
            }
        },
        child: CustomButton(text: "Sign out ", onPressed: () {
        context.read<AuthBloc>().add(LogOutEvent());
        },),
      )
    );
  }
}
