import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/drawer_controller.dart';
import 'manager/home_cubit.dart';

import 'widgets/home_controller.dart';
import 'manager/functions_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  static const routeName = "/HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with FunctionsHome {
  @override
  void initState() {
    // Git List for home page
    BlocProvider.of<HomeCubit>(context).refreshHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: theme.iconTheme.color,
        actionsIconTheme: theme.iconTheme,
        toolbarHeight: theme.appBarTheme.toolbarHeight,
        centerTitle: true,
        title: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Text(
              "",
              style: theme.textTheme.bodyText1,
            );
          },
        ),
      ),
      drawer: OurDrawerController(
        drawerList: BlocProvider.of<HomeCubit>(context).drawerTilesList,
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state){},
        builder: (context, state) {
          if (state is ShowList) {
            return HomeController(tiles: state.tiles);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
