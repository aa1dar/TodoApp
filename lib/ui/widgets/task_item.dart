import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/task_list_provider.dart';

import 'custom_dismissible.dart';

class TaskItem extends ConsumerWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskProvider);

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
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              child: Row(children: [
                Checkbox(
                    value: task.isCompleted,
                    onChanged: (onChange) {
                      ref.read(taskListProvider.notifier).toogle(task.id);
                    }),
                Text(
                  task.description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                ),
                const Spacer(),
                Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.tertiary,
                )
              ]),
            )));
  }

  // TextStyle _getTextStyleByParams(BuildContext context, )
}
