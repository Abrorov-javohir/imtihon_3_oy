import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon_3_oy/admin/controller/user_controller.dart';
import 'package:imtihon_3_oy/widget/search_view_delegate.dart';

class Announcments extends StatefulWidget {
  const Announcments({super.key});

  @override
  State<Announcments> createState() => _AnnouncmentsState();
}

class _AnnouncmentsState extends State<Announcments> {
  final userController = UserController();
  List<String> data = [
    "BMW",
    "MERCEDES",
    "MAZDA",
    "PAGANI",
    "LAMBORGINI",
    "LAMBORGINI",
    "PORCHE",
    "BUGATTI",
    "ASTON MARTIN",
    "SKYLINE",
    "TOYOTA",
    "SUBARU",
  ];
  List filteredData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(44, 160, 187, 244),
                borderRadius: BorderRadius.circular(30)),
            child: ListTile(
              title: const Text("Search User"),
              trailing: SvgPicture.asset("assets/svg_icons/search.svg"),
            ),
          ),
          onTap: () async {
            String? result = await showSearch(
              context: context,
              delegate: SearchViewDelegate(data),
            );
            if (result != null) filteredData.add(result);
            setState(() {});
          },
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: FutureBuilder(
              future: userController.list,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                }
                return !snapshot.hasData || snapshot.data!.isEmpty
                    ? const Center(
                        child: Text("mahsulot mavjud emas"),
                      )
                    : ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (ctx, index) {
                          final user = snapshot.data![index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox(
                                      width: 200,
                                      child: Image.asset(
                                        'assets/lamborgini.png',
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Lamborgini 303',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '4.6',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.directions_car,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '400 hp',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Icon(
                                        Icons.settings,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Automatic',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '\$493.030.220',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          user.announcments.isFavorite =
                                              !user.announcments.isFavorite;
                                        });
                                      },
                                      icon: Icon(
                                        CupertinoIcons.heart_fill,
                                        color: user.announcments.isFavorite
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
