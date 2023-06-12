import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:todo_app/providers/task_list_provider.dart';
import 'package:todo_app/ui/pages/task_creation_page.dart';
import 'package:todo_app/ui/widgets/task_item.dart';

import '../widgets/custom_header_delegate.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const TaskCreationPage()));
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: CustomScrollView(slivers: [
          SliverPersistentHeader(
            delegate: CustomHeaderDelegate(
                action: Icon(Icons.visibility,
                    color: Theme.of(context).colorScheme.primary),
                expandedTitle: Text(
                  'Мои дела',
                  style: textStyle.titleLarge,
                ),
                collapsedSubTitle:
                    Text('Выполнено — 5', style: textStyle.bodyMedium),
                collapsedTitle: Text(
                  'Мои дела',
                  style: textStyle.titleMedium,
                ),
                expandedHeight: 160.0,
                statusBarHeight: MediaQuery.of(context).padding.top),
            pinned: true,
          ),
          SliverStack(
            children: [
              SliverPositioned.fill(
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding, vertical: 4.0),
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
                            const BorderRadius.all(Radius.circular(8.0)))),
              ),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 4.0),
                  sliver: SliverList.builder(
                      itemCount: tasks.data.length,
                      itemBuilder: (context, index) {
                        return ProviderScope(
                          overrides: [
                            taskProvider.overrideWithValue(tasks.data[index])
                          ],
                          child: const TaskItem(),
                        );
                      }))
            ],
          ),
        ]));
  }

  static const horizontalPadding = 8.0;
}
