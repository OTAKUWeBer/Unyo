import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unyo/notification/notification_manager.dart';
import 'package:unyo/sources/sources.dart';
import 'package:unyo/widgets/widgets.dart';

class WrongTitleDialogManager {
  static final WrongTitleDialogManager _instance =
      WrongTitleDialogManager._internal();

  WrongTitleDialogManager._internal();

  factory WrongTitleDialogManager() => _instance;

  bool manualTitleSelection = false;
  List<DropdownMenuEntry> wrongTitleEntries = [];
  String oldWrongTitleSearch = "";
  String? currentSearchString;
  int? currentSearchIndex;
  Timer wrongTitleSearchTimer = Timer(const Duration(milliseconds: 500), () {});
  void Function() wrongTitleSearchFunction = () {};
  TextEditingController wrongTitleSearchController = TextEditingController();
  List<String> results = [];

  void openWrongTitleDialog(BuildContext context, double width, double height,
      {AnimeSource? currentAnimeSource, MangaSource? currentMangaSource}) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            setWrongTitleSearch(setState,
                currentAnimeSource: currentAnimeSource,
                currentMangaSource: currentMangaSource);
            return AlertDialog(
              title: Text(context.tr("select_title"),
                  style: const TextStyle(color: Colors.white)),
              backgroundColor: const Color.fromARGB(255, 44, 44, 44),
              content: WrongTitleDialog(
                width: width,
                height: height,
                wrongTitleSearchController: wrongTitleSearchController,
                wrongTitleEntries: wrongTitleEntries,
                currentSearchString: manualTitleSelection
                    ? currentSearchString!
                    : results.isNotEmpty
                        ? results[0]
                        : "",
                onPressed: () async {
                  wrongTitleSearchTimer.cancel();
                  //NOTE dirty fix for a bug
                  if (!context.mounted) return;
                  NotificationManager().showWarningNotification(
                      context,
                      "Updating Title, don't close...",
                      DesktopSnackBarPosition.topCenter);
                  await Future.delayed(const Duration(seconds: 1));
                  if (!context.mounted) return;
                  NotificationManager().showSuccessNotification(context,
                      "Title Updated", DesktopSnackBarPosition.topCenter);
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                },
                onSelected: (value) {
                  manualTitleSelection = true;
                  currentSearchString = results[value];
                  currentSearchIndex = value!;
                },
              ),
            );
          },
        );
      },
    );
  }

  void setWrongTitleSearch(void Function(void Function()) setDialogState,
      {AnimeSource? currentAnimeSource, MangaSource? currentMangaSource}) {
    oldWrongTitleSearch = "";
    //reset listener
    wrongTitleSearchController.removeListener(wrongTitleSearchFunction);
    wrongTitleSearchFunction = () {
      wrongTitleSearchTimer.cancel();
      wrongTitleSearchTimer =
          Timer(const Duration(milliseconds: 500), () async {
        if (wrongTitleSearchController.text != oldWrongTitleSearch &&
            wrongTitleSearchController.text != "") {
          if (currentMangaSource == null) {
            results = await currentAnimeSource!
                .getAnimeTitles(wrongTitleSearchController.text);
          } else {
            results = [];
            // searches = await currentMangaSource!.get(title);
          }
          setDialogState(() {
            wrongTitleEntries = [
              ...results.mapIndexed(
                (index, title) {
                  return DropdownMenuEntry(
                    style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    value: index,
                    label: title,
                  );
                },
              ),
            ];
          });
        }
        oldWrongTitleSearch = wrongTitleSearchController.text;
      });
    };
    wrongTitleSearchController.addListener(wrongTitleSearchFunction);
  }

  void clearProperties() {
    manualTitleSelection = false;
    currentSearchIndex = null;
    currentSearchString = null;
  }
}

class WrongTitleDialog extends StatelessWidget {
  const WrongTitleDialog({
    super.key,
    required this.width,
    required this.height,
    required this.wrongTitleSearchController,
    required this.onSelected,
    required this.onPressed,
    required this.wrongTitleEntries,
    required this.currentSearchString,
  });

  final double width;
  final double height;
  final TextEditingController wrongTitleSearchController;
  final void Function(dynamic)? onSelected;
  final void Function() onPressed;
  final List<DropdownMenuEntry<dynamic>> wrongTitleEntries;
  final String currentSearchString;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.5,
      height: height * 0.5,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
          opacity: 0.1,
          image: NetworkImage("https://i.imgur.com/fUX8AXq.png"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Text("select_new_title_text".tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 22)),
              const SizedBox(
                height: 30,
              ),
              // TODO Review DropdownMenu manualSelection field
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownMenu(
                    // hintText: context.tr("search_from_website"),
                    width: width * 0.4,
                    textStyle: const TextStyle(color: Colors.white),
                    menuStyle: const MenuStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 44, 44, 44),
                      ),
                    ),
                    controller: wrongTitleSearchController,
                    onSelected: onSelected,
                    initialSelection: /*manualSelection ?? 0*/ null,
                    dropdownMenuEntries: wrongTitleEntries,
                    menuHeight: height * 0.3,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "${context.tr("current_selection")}: $currentSearchString",
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledButton(
                text: "confirm".tr(),
                onPressed: onPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
