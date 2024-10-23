import 'package:app_agendamento/features/intro/pages/splash/splash_page_cubit.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashPageCubit cubit = SplashPageCubit();
  @override
  void initState() {
    super.initState();
    cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocListener<SplashPageCubit, SplashPageState>(
        listener: (context, state) {
          if (state.status == SplashPageStatus.goToOnboarding) {
            context.push('/onboarding');
          }
        },
        child: const Scaffold(
          body: Center(
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
