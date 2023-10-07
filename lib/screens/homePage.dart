import 'package:flutter/material.dart';
import 'package:newproject/constants/colors.dart';
import 'package:newproject/provider/loginprovider.dart';
import 'package:newproject/screens/LoginPage.dart';
import 'package:newproject/screens/favorites.dart';
import 'package:newproject/screens/playVideo.dart';
import 'package:provider/provider.dart';
import '../provider/HomeProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    HomeProvider home = Provider.of(context, listen: false);
    if (mounted) home.OnInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context);
    LoginProvider login = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: whiteColor),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FavoritesPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: whiteColor),
            onPressed: () {
              login.passwordController.text = "";
              login.emailController.text = "";

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: homeProvider.model.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Text(homeProvider.model[index].title),
                leading: Container(
                    width: 100,
                    child: Image.network(homeProvider.model[index].thumbnail)),
                trailing: IconButton(
                  onPressed: () {
                    if (homeProvider.favorites
                        .contains(homeProvider.model[index])) {
                      homeProvider.favorites.remove(homeProvider.model[index]);
                      setState(() {});
                    } else {
                      homeProvider.favorites.add(homeProvider.model[index]);
                      setState(() {});
                    }
                  },
                  icon: Icon(
                      homeProvider.favorites.contains(homeProvider.model[index])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: primaryColor),
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
