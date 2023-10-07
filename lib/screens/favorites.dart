import 'package:flutter/material.dart';
import 'package:newproject/screens/playVideo.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../provider/HomeProvider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: homeProvider.favorites.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Text(homeProvider.favorites[index].title),
                leading: Container(
                    width: 100,
                    child:
                        Image.network(homeProvider.favorites[index].thumbnail)),
                trailing: IconButton(
                  onPressed: () {
                    homeProvider.favorites
                        .remove(homeProvider.favorites[index]);
                    setState(() {});
                  },
                  icon: Icon(Icons.close_rounded, color: primaryColor),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          PlayVideo(homeProvider.model[index].videoUrl)));
                },
              ),
            );
          }),
    );
  }
}
