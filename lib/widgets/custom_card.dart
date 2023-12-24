import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_challenge/assets/constants.dart';
import 'package:target_challenge/controllers/home_controller.dart';
import 'package:target_challenge/models/note.dart';
import 'package:target_challenge/widgets/custom_decoration.dart';

class CustomCard extends StatelessWidget {
  HomeController homeController = HomeController();
  var model = Note();

  CustomCard({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    //Colors
    Color colorError = const Color.fromARGB(255, 255, 157, 0);
    Color colorErrorBorder = Colors.red;
    Color colorStandard = Colors.white;
    Color colorWhite = const Color(0xffE5E5E5);
    //Strings
    String delete = Constants.DELETE;
    String yes = Constants.YES;
    String no = Constants.NO;
    String emptyList = Constants.EMPTY_LIST;
    String filled = Constants.FILLED_FIELD;
    String yourText = Constants.YOUR_TEXT;
    TextEditingController textController = TextEditingController();
    //Mesuare
    int selectedIndex = -1;
    double size_30 = 30;
    double size_300 = 300;
    double size_20 = 20;
    double size_48 = 48;
    double size_8 = 8;

    void alert(int index, String text) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(delete),
            content: Text(text),
            actions: [
              TextButton(
                onPressed: () {
                  homeController.deleteItemList(index);
                  Navigator.of(context).pop();
                },
                child: Text(yes),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(no),
              ),
            ],
          );
        },
      );
    }

    void editTextDialog(int index, Note note, HomeController controller) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edite o texto'),
            content: Observer(builder: (context) {
              return TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textAlign: TextAlign.center,
                controller: textController,
                onChanged: model.setText,
                keyboardType: TextInputType.text,
                maxLines: 1,
                maxLength: 80,
                autofocus: true,
                decoration: CustomDecorationFormField.textFieldStyle(
                  hintTextField: yourText,
                ),
              );
            }),
            actions: [
              TextButton(
                onPressed: () {
                  homeController.editItemList(index, note);
                  Navigator.of(context).pop();
                },
                child: Text(yes),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(no),
              ),
            ],
          );
        },
      );
    }

    return Observer(
      builder: (context) {
        return homeController.list.isEmpty
            ? Padding(
                padding: EdgeInsets.only(
                    top: size_20, left: size_48, right: size_48),
                child: Container(
                  alignment: Alignment.topCenter,
                  width: size_300,
                  height: size_300,
                  padding: EdgeInsets.all(size_8),
                  decoration: BoxDecoration(
                      color: colorStandard,
                      borderRadius: BorderRadius.circular(size_8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(size: size_30, Icons.not_interested_sharp),
                      Text(emptyList),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                    top: size_20, left: size_48, right: size_48),
                child: Container(
                  alignment: Alignment.center,
                  width: size_300,
                  height: size_300,
                  decoration: BoxDecoration(color: colorStandard),
                  child: ListView.builder(
                    itemCount: homeController.list.length,
                    itemBuilder: (_, index) {
                      var item = homeController.list[index];
                      return ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: size_48,
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    editTextDialog(
                                      index,
                                      model,
                                      homeController,
                                    );
                                  },
                                  child: const Icon(Icons.edit)),
                              InkWell(
                                  onTap: (() {
                                    alert(
                                      index,
                                      item,
                                    );
                                  }),
                                  child: const Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
      },
    );
  }
}
