import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon_3_oy/admin/controller/user_controller.dart';
import 'package:imtihon_3_oy/widget/search_view_delegate.dart';

class UsersControl extends StatefulWidget {
  const UsersControl({super.key});

  @override
  State<UsersControl> createState() => _UsersControlState();
}

class _UsersControlState extends State<UsersControl> {
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
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final imageController = TextEditingController();
  final newNameController = TextEditingController();
  final newEmailController = TextEditingController();
  final newImageController = TextEditingController();

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
              title: Text(context.tr("searchUser")),
              trailing: const Icon(Icons.search),
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
      body: FutureBuilder(
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
                    return Dismissible(
                      background: Container(
                        color: const Color.fromARGB(255, 158, 195, 226),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(context.tr("edit")),
                              ],
                            ),
                          ),
                        ),
                      ),
                      secondaryBackground: Container(
                        color: user.isBlocked
                            ? const Color.fromARGB(255, 158, 195, 226)
                            : const Color.fromARGB(255, 255, 88, 77),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(user.isBlocked
                                    ? context.tr("unblock")
                                    : context.tr("block")),
                              ],

                            ),
                          ),
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          setState(() {
                            user.isBlocked = !user.isBlocked;
                          });
                        } else if (direction == DismissDirection.startToEnd) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        hintText: context.tr("name"),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        hintText: context.tr("email"),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: imageController,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        hintText: context.tr("imageUrl"),
                                      ),
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        child: Text(context.tr("close")),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FilledButton(
                                        child: Text(context.tr("save")),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        return null;
                      },
                      key: UniqueKey(),
                      child: GestureDetector(
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey, width: 0.7),
                                bottom:
                                    BorderSide(color: Colors.grey, width: 0.6)),
                          ),

                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
                              ),
                              radius: 50,
                            ),
                            title: Text(
                              user.name,
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(user.adress),
                            trailing: user.isBlocked
                                ? Text(
                                    context.tr("blocked"),
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.red),
                                  )
                                : Text(
                                    context.tr("free"),
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ),
                          ),
                        ),
                        onLongPress: () {
                          print("object");
                        },
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: newNameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: context.tr("name"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: newEmailController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: context.tr("email"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: newImageController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: context.tr("imageUrl"),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: Text(context.tr("close")),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FilledButton(
                        child: Text(context.tr("save")),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}