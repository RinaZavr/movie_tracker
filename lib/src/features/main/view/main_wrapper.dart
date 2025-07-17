import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/src/common/consts/icons_consts.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/config/router/routes.dart';
import 'package:movie_tracker/src/features/main/data/main_wrapper_model.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final List<MainWrapperModel> items = [
    MainWrapperModel(icon: AppIcons.home, location: MoviesRoute().location),
    MainWrapperModel(icon: AppIcons.search, location: SearchRoute().location),
    MainWrapperModel(
      icon: AppIcons.favorite,
      location: FavouritesRoute().location,
    ),
    MainWrapperModel(icon: AppIcons.profile, location: ProfileRoute().location),
  ];

  late MainWrapperModel selectedItem;

  @override
  void initState() {
    selectedItem = items[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: kToolbarHeight - 16),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colorExt.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            return Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedItem = item;
                  });
                  context.go(item.location);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: selectedItem == item
                      ? BoxDecoration(
                          color: context.colorExt.accentColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [context.shadowExt.primaryShadow],
                        )
                      : null,
                  child: Icon(item.icon),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      body: widget.child,
    );
  }
}
