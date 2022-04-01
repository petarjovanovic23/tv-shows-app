import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/storage_repository.dart';
import 'package:tv_shows/providers/user_profile_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/user_profile_screen.dart';
import 'package:tv_shows/widgets/hidden_shows_widget.dart';
import 'package:tv_shows/widgets/show_screen_top_widget.dart';
import 'package:tv_shows/widgets/shows_list_widget.dart';

import '../gen/assets.gen.dart';
import '../models/user.dart';
import '../providers/show_screen_content_provider.dart';
import '../providers/shows_provider.dart';

class ShowScreen extends StatefulWidget {
  ShowScreen({this.user, Key? key}) : super(key: key);
  User? user;
  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  void showUserEditingModal(BuildContext contextShowScreen) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: contextShowScreen,
      builder: (contextUserProfile) {
        return UserProfileScreen(widget.user as User);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('user img ${widget.user?.imageUrl}');
    print(widget.user?.toJson());
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<ShowsProvider>(
            create: (context) =>
                ShowsProvider(context.read<NetworkingRepository>()),
          ),
          ChangeNotifierProvider<ShowsScreenContentProvider>(
            create: (context) => ShowsScreenContentProvider(),
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            ShowsProvider showsProvider = Provider.of<ShowsProvider>(context);
            return SafeArea(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => showUserEditingModal(context),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: Colors.transparent,
                          child: widget.user?.imageUrl == null
                              ? Assets.images.icProfilePlaceholderPng.image()
                              : Image.network(widget.user?.imageUrl as String),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 44),
                  const ShowScreenTopWidget(),
                  showsProvider.state.maybeWhen(
                    orElse: () => Container(),
                    loading: () => Expanded(
                        child: Center(
                            child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor))),
                    success: (shows) =>
                        Provider.of<ShowsScreenContentProvider>(context)
                                .isHidden
                            ? HiddenShowsWidget(constraints)
                            : ShowsListWidget(constraints, shows),
                    failure: (exception) => const Expanded(
                      child: Center(
                          child: Text(
                              'Error retrieving shows. Please try again!')),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
