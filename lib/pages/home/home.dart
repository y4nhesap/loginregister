import 'dart:math';

import 'package:flutter/material.dart';
import 'package:model_test/pages/profile/profile_page.dart';
import 'package:model_test/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      //burada context kullanabiliriz
      context.read<ProfileViewModel>().getUsers(); ////Tum users map listesi getirilir
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final users = context.watch<ProfileViewModel>().users;
    return Scaffold(
      body: Column(
        children: [
          const Text("Users"),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: users.length, //tum liste uzunlugu
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () async {
                    await context.read<ProfileViewModel>().getUser(users[index].id!).then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(), //tıklanırsa o kişiyie gider
                        ))); // belli elemeanın özelliklerini al usera at
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                            height: size.height / 4,
                            decoration: BoxDecoration(color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1), borderRadius: BorderRadius.circular(15)),
                            child: Center(child: Text("${users[index].firstName!} ${users[index].lastName!}"))),
                        Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.network(users[index].avatar.toString())),
                            Text("${users[index].firstName!} ${users[index].lastName!}")
                          ],
                        ))
                      ],
                    ),
                  )); // user isimleri
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 1; i <= context.watch<ProfileViewModel>().totalPage; i++)
                (context.watch<ProfileViewModel>().page == i)
                    ? Text(i.toString())
                    : TextButton(
                        onPressed: () {
                          context.read<ProfileViewModel>().setPage(i);
                        },
                        child: Text(i.toString()))
            ],
          )
        ],
      ),
    );
  }
}
