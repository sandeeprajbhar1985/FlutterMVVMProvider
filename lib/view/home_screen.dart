import 'package:flutter/material.dart';
import 'package:poc_mvvm_provider/view/movie_detail_screen.dart';
import 'package:poc_mvvm_provider/view_model/favorite_view_model.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';
import '../utils/utils.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final favouiteViewModel = Provider.of<FavouiteViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
          switch (value.moviesList.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.moviesList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.moviesList.data!.results!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(
                                  movie:
                                      value.moviesList.data!.results![index]),
                            ),
                          )
                        },
                        leading: Image.network(
                          value.moviesList.data!.results![index].url.toString(),
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
                        title: Text(value.moviesList.data!.results![index].title
                            .toString()),
                        subtitle: Text(value
                            .moviesList.data!.results![index].director
                            .toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.favorite),
                              color:
                                  Utils.getAllIds(favouiteViewModel.favItemList)
                                          .contains(value.moviesList.data!
                                              .results![index].episodeId!)
                                      ? Colors.black
                                      : Colors.red,
                              onPressed: () {
                                Utils.getAllIds(favouiteViewModel.favItemList)
                                        .contains(value.moviesList.data!
                                            .results![index].episodeId!)
                                    ? favouiteViewModel.removeFavItem(
                                        value.moviesList.data!.results![index])
                                    : favouiteViewModel.addFavItem(
                                        value.moviesList.data!.results![index]);
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  });
          }
          return Container();
        }),
      ),
    );
  }
}
