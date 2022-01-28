import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watamuki/src/providers/auth_provider.dart';
import 'package:watamuki/src/widgets/atoms/button.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        Consumer<AuthProvider>(builder: (_, value, __) {
          if (!value.loggedIn) {
            return const SizedBox.shrink();
          }
          return Button(
            type: ButtonType.transparent,
            icon: const Icon(Icons.directions_bus, size: 24),
            label: "Bus pass",
            textStyle: Theme.of(context).textTheme.subtitle1,
            disableBorder: true,
            onPressed: () {
              /*showModalBottomSheet<dynamic>(
              context: context,
              barrierColor: AppColors.greyDark.withAlpha(153),
              backgroundColor: Colors.white,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              builder: (_) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 20, right: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Title",
                                  style: Theme.of(context).textTheme.subtitle1,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.close),
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: const [
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data"),
                              ),
                              ListTile(
                                title: Text("data l "),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );*/
            },
          );
        }),
        Button(
          type: ButtonType.transparent,
          label: "Route",
          textStyle: Theme.of(context).textTheme.subtitle1,
          disableBorder: true,
          onPressed: () {},
        ),
        Button(
          type: ButtonType.transparent,
          label: "Timetable",
          textStyle: Theme.of(context).textTheme.subtitle1,
          disableBorder: true,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
