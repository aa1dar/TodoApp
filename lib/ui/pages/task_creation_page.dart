import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utils/style/app_themes.dart';

class TaskCreationPage extends StatefulWidget {
  const TaskCreationPage({super.key});

  @override
  State<TaskCreationPage> createState() => _TaskCreationPageState();
}

class _TaskCreationPageState extends State<TaskCreationPage> {
  late TextEditingController _textEditingController;
  final List<String> list = <String>['One', 'Two', 'Three'];
  String? dropdownValue;
  bool switcher = false;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    dropdownValue = list.first;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Theme.of(context).primaryIconTheme.color,
          ),
          splashRadius: AppTheme.appBarIconSplashRadius,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: TextButton(
                onPressed: () {},
                child: Text('СОХРАНИТЬ'),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 4.0)),
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Flexible(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          spreadRadius: 2,
                          blurRadius: 0.5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0))),
                  child: TextField(
                    minLines: 3,
                    maxLines: null,
                    autofocus: false,
                    scrollPadding: EdgeInsets.zero,
                    decoration: InputDecoration(
                      hintText: 'Что надо сделать...',
                    ),
                    controller: _textEditingController,
                  )),
            ),
            const SizedBox(height: 28.0),
            Flexible(
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Важность', style: textStyle.bodyMedium),
                        DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                          value: dropdownValue,
                          iconStyleData: const IconStyleData(
                              icon: const SizedBox.shrink()),
                          buttonStyleData:
                              ButtonStyleData(width: 164, height: 35),
                          isExpanded: false,
                          // style: textStyle.titleSmall,
                          selectedItemBuilder: (context) {
                            return list
                                .map<DropdownMenuItem<String>>((String value) {
                              TextStyle? style = textStyle.titleSmall;

                              return DropdownMenuItem<String>(
                                value: value,
                                enabled: true,
                                child: Text(
                                  value,
                                  style: style,
                                ),
                              );
                            }).toList();
                          },
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: textStyle.bodyMedium,
                              ),
                            );
                          }).toList(),
                        )),
                        const Divider(),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Сделать до',
                                    style: textStyle.bodyMedium,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        _showDatePicker();
                                      },
                                      child: Text('2 июня 2021',
                                          style: textStyle.labelLarge!.copyWith(
                                              color: colorScheme.primary)))
                                ],
                              ),
                            ),
                            Switch(
                                value: switcher,
                                onChanged: (change) {
                                  setState(() {
                                    switcher = change;
                                  });
                                })
                          ],
                        )
                      ])),
            ),
            const Divider(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        // iconColor: colorScheme.error,
                        foregroundColor: colorScheme.error,
                        textStyle: textStyle.bodyMedium,
                        disabledForegroundColor: colorScheme.surface),
                    icon: const Icon(Icons.delete),
                    label: const Text('Удалить'))),
          ])),
    );
  }

  void _showDatePicker({DateTime? selectedDay}) {
    showDatePicker(
      helpText: '',
      initialDatePickerMode: DatePickerMode.day,
      confirmText: 'ГОТОВО',
      cancelText: 'ОТМЕНА',
      context: context,
      initialDate: selectedDay ?? DateTime.now(),
      firstDate: DateTime(2023),
      builder: (context, child) => Container(
        child: child,
      ),
      lastDate: DateTime(2024),
    );
  }

  // TextStyle getByPriority
}
