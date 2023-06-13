import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/task_priority.dart';
import 'package:todo_app/providers/task_list_provider.dart';
import 'package:todo_app/ui/widgets/task_suffix_title_widget.dart';

import 'custom_dismissible.dart';

class TaskItem extends ConsumerWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final defaultTextTheme = Theme.of(context).textTheme.bodyMedium!;

    TextStyle? getTextStyle() {
      return task.isCompleted
          ? defaultTextTheme.copyWith(
              color: colorScheme.tertiary,
              decoration: TextDecoration.lineThrough)
          : defaultTextTheme;
    }

    Color? getCheckFillColor() {
      if (task.isCompleted) {
        return colorScheme.secondaryContainer;
      }

      if (task.priority == TaskPriority.high) {
        return colorScheme.error;
      }
      return null;
    }

    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: CustomDismissible(
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                if (!task.isCompleted) {
                  ref.read(taskListProvider.notifier).toogle(task.id);
                }
                return false;
              }
              return true;
            },
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                ref.read(taskListProvider.notifier).delete(task.id);
              }
            },
            stringKey: task.id,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 4.0,
                bottom: 4.0,
                right: 4.0,
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Checkbox(
                    value: task.isCompleted,
                    visualDensity: VisualDensity.compact,
                    fillColor: MaterialStatePropertyAll(getCheckFillColor()),
                    onChanged: (onChange) {
                      ref.read(taskListProvider.notifier).toogle(task.id);
                    }),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!task.isCompleted)
                              TaskSuffixTitleWidget(priority: task.priority),
                            Expanded(
                              child: Text(
                                task.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: getTextStyle(),
                              ),
                            ),
                            Container(
                                alignment: AlignmentDirectional.centerEnd,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0, vertical: 2),
                                child: Icon(
                                  Icons.info_outline,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ))
                          ],
                        ))),
              ]),
            )));
  }

  // TextStyle _getTextStyleByParams(BuildContext context, )
}
