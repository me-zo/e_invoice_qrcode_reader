import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../domain/models/tile_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  //#region Navigation lists

  List<TileModel> shownTileList = [
    TileModel(
      id: "add_customer",
      name: "ADD CUSTOMER",
    ),
    TileModel(
      id: "add_product",
      name: "ADD PRODUCT",
    ),
    TileModel(
      id: "add_discount",
      name: "ADD DISCOUNT",
    ),
  ];

  List<TileModel> drawerTilesList = [
    TileModel(
      id: "DRAWER0",
      name: "Customers",
    ),
    TileModel(
      id: "DRAWER1",
      name: "Products",
    ),
    TileModel(
      id: "DRAWER5",
      name: "Settings",
    ),
  ];

  TileModel addTile = TileModel(
    id: "add_tile",
    name: "ADD TILES",
    icon: Icons.add_box_outlined,
  );

//#endregion

  ///Call this method every time you want to refresh the home screen
  ///DO NOT Emit "SHOW LIST" from here manually
  void refreshHomePage() {
    emit(ShowList(tiles: shownTileList));
  }

  ///Loops through the given list until it finds a matching tile then it returns it otherwise it returns a red Error Tile
  TileModel findHomeTileById(String id, List<TileModel> tiles) {
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i].id == id) {
        return tiles[i];
      }
    }
    return TileModel(
      name: "Error Tile",
      id: "error_tile",
    );
  }

}
