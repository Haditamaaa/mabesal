import 'package:flutter/material.dart';
import 'package:mabesal/common/data_list.dart';

class UserListDetail extends StatelessWidget {
  const UserListDetail({Key? key, required this.personal}) : super(key: key);
  final Personal personal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(personal.image),
                              fit: BoxFit.cover),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(.3)
                                ])),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  personal.name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ]
                          ),
                        ),
                      ),
                    ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  personal.nrp,
                                  style: const TextStyle(color: Colors.black, height: 1.4, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  personal.phone,
                                  style: const TextStyle(color: Colors.black, height: 1.4, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              personal.about,
                              style: const TextStyle(color: Colors.black, height: 1.4, fontSize: 18),
                            ),
                          ]
                      ),
                    )
                  ]
                  ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
