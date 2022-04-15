import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/tile_model.dart';
import '../manager/home_cubit.dart';
import '../manager/functions_home.dart';

//drawer controller is a reserved name
class OurDrawerController extends StatelessWidget with FunctionsHome {
  OurDrawerController({Key? key, required this.drawerList}) : super(key: key);
  final List<TileModel> drawerList;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return SizedBox(
                  height: 160,
                  child: UserAccountsDrawerHeader(
                    currentAccountPictureSize: const Size.square(65),
                    currentAccountPicture: Image.asset("assets/images/1x/logo.png"),
                    accountName: const Text("name",
                        ),
                    accountEmail: const Text("email@gmail.com",
                        ),
                  ),
                );
              },
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: drawerList.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(
                color: Colors.black12,
                height: 0,
                thickness: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  title: Text(drawerList[index].name),
                  //leading: Icon(drawerList[index].icon),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: OutlinedButton(
                onPressed: () {
                },
                child: Text(
                  "Lock Screen".toUpperCase(),
                  style: const TextStyle(color: Colors.lightBlue),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.lightBlue)),
                  elevation: MaterialStateProperty.all<double>(1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: OutlinedButton(
                  onPressed: (){},
                  child: Text(
                    "Log out".toUpperCase(),
                    style: const TextStyle(color: Colors.red),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(color: Colors.red)),
                    elevation: MaterialStateProperty.all<double>(1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
