import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/functions_home.dart';
import 'manager/home_cubit.dart';
import 'widgets/home_page.dart';

class HomeController extends StatefulWidget {
  const HomeController({
    Key? key,
  }) : super(key: key);
  static const routeName = "/HomePage";

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> with FunctionsHome {
  @override
  void initState() {
    // Git List for home page
    BlocProvider.of<HomeCubit>(context).refreshHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ShowList) {
            return const HomePage();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
