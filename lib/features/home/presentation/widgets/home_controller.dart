import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/tile_model.dart';
import '../manager/home_cubit.dart';
import '../manager/functions_home.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key, required this.tiles}) : super(key: key);
  final List<TileModel> tiles;

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> with FunctionsHome {

  @override
  Widget build(BuildContext context) {
    ///
    ///Builds a single tile widget
    Widget buildTile(TileModel tile, bool isAddTile) {
      return GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isAddTile ? Colors.grey.withOpacity(0.2):Colors.blue.withOpacity(1),
            borderRadius: BorderRadius.only(
              topLeft: isAddTile ?  const Radius.circular(10): const Radius.circular(20),
              topRight: isAddTile ?  const Radius.circular(10): const Radius.circular(20),
              bottomLeft: isAddTile ?  const Radius.circular(10): const Radius.circular(0),
              bottomRight: isAddTile ?  const Radius.circular(10): const Radius.circular(0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    tile.icon,
                    size: tile.hasTitleText ? 40 : 30,
                  ),
                  Container(),
                ],
              ),
              Text(
                tile.name,
                maxLines: tile.hasTitleText ? 2 : 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: tile.hasTitleText ? 20 : 15,
                ),
              ),
            ],
          ),
        ),
      );
    }

    /// when the reorder completes remove the list entry from its old position
    /// and insert it at its new index
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        final item = widget.tiles.removeAt(oldIndex);
        widget.tiles.insert(newIndex, item);
      });
    }

    return ReorderableGridView.count(
      padding: const EdgeInsets.all(10),
      childAspectRatio: 1.7,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: List.generate(
        widget.tiles.length,
        (index) => buildTile(widget.tiles[index], false),
      ),
      onReorder: _onReorder,
      footer: [buildTile(BlocProvider.of<HomeCubit>(context).addTile, true)],
    );
  }

}
