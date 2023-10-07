import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/favorite_view_model.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final favouiteViewModel = Provider.of<FavouiteViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Favorite'),
      ),
      body: ListView.builder(
          itemCount: favouiteViewModel.favItemList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image.network(
                  favouiteViewModel.favItemList[index].url!,
                  errorBuilder: (context, error, stack) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                    );
                  },
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
                title: Text(
                    favouiteViewModel.favItemList[index].title!.toString()),
                subtitle: Text(
                    favouiteViewModel.favItemList[index].director!.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      color: Colors.black,
                      onPressed: () {
                        favouiteViewModel.removeFavItem(
                            favouiteViewModel.favItemList[index]);
                      },
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
