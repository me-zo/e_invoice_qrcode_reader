import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/home_cubit.dart';
import '../manager/functions_home.dart';

class TileListController extends StatefulWidget {
  const TileListController({Key? key}) : super(key: key);

  @override
  State<TileListController> createState() => _TileListControllerState();
}

class _TileListControllerState extends State<TileListController>
    with FunctionsHome {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<HomeCubit>(context).refreshHomePage();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              BlocProvider.of<HomeCubit>(context).refreshHomePage();
              Navigator.of(context).pop();
            },
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is ShowList) {
              //builds a navigational list
              //takes (TilePreview)
              return ListView.separated(
                itemCount: state.tiles.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  thickness: 2,
                  height: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      state.tiles[index].name,
                      style: theme.textTheme.bodyText1,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  );
                },
              );

            } else {
              return const Center(
                child: Text("Loading..."),
              );
            }
          },
        ),
      ),
    );
  }
}
