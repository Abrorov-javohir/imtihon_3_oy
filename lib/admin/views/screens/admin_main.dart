import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imtihon_3_oy/admin/controller/admin_main_controller.dart';
import 'package:imtihon_3_oy/admin/views/screens/anouncement.dart';
import 'package:imtihon_3_oy/admin/views/screens/orders_and_payment.dart';
import 'package:imtihon_3_oy/admin/views/screens/user_controller.dart';
import 'package:lottie/lottie.dart';

class AdminMain extends StatefulWidget {
  const AdminMain({super.key});

  @override
  State<AdminMain> createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
  AdminMainController adminMainController = AdminMainController();
  bool isDark = true;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await adminMainController.getData();
    setState(() {
      isDark = adminMainController.isDark;
    });
  }

  void toggleTheme() async {
    setState(() {
      isDark = !isDark;
      adminMainController.isDark = isDark;
    });
    await adminMainController.saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr("admin")),
        actions: [
          IconButton(
            onPressed: () async {
              final themeMode = await AdaptiveTheme.getThemeMode();
              if (themeMode == AdaptiveThemeMode.dark) {
                AdaptiveTheme.of(context).setLight();
              } else {
                AdaptiveTheme.of(context).setDark();
              }
              toggleTheme();
            },
            icon: isDark
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(75, 15, 109, 8),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 2,
                                      color: Color.fromARGB(255, 202, 219, 233))
                                ]),
                            child: Row(
                              children: [
                                Lottie.asset("assets/animations/globus.json"),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${context.tr("users")}:",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Text(
                                          "1233",
                                          style: TextStyle(fontSize: 25),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const UsersControl(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 200,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(75, 15, 109, 8),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Color.fromARGB(255, 202, 219, 233),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Lottie.asset(
                                      "assets/animations/line_graph.json"),
                                  Gap(10),
                                  Text(
                                    context.tr("announcements"),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const Text(
                                    "124131",
                                    style: TextStyle(fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const Announcments(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(75, 15, 109, 8),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Color.fromARGB(255, 202, 219, 233),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 110,
                                    width: 110,
                                    child: Lottie.asset(
                                        "assets/animations/coin.json"),
                                  ),
                                  Gap(10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        context.tr("orders"),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const Text(
                                        "124131",
                                        style: TextStyle(fontSize: 25),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const OrdersAndPayments(),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Gap(120),
              Container(
                height: 370,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(75, 15, 109, 8),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                      color: Color.fromARGB(255, 202, 219, 233),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.tr("selectLanguage"),
                            style: const TextStyle(fontSize: 20),
                          ),
                          DropdownButton(
                            alignment: AlignmentDirectional.bottomEnd,
                            elevation: 8,
                            value: context.locale,
                            items: const [
                              DropdownMenuItem(
                                value: Locale("uz"),
                                child: Text("Uz"),
                              ),
                              DropdownMenuItem(
                                value: Locale("en"),
                                child: Text("En"),
                              ),
                              DropdownMenuItem(
                                value: Locale("ru"),
                                child: Text("Ru"),
                              )
                            ],
                            onChanged: (value) {
                              context.setLocale(value!);
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
