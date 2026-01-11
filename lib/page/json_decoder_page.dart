import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/provider/json_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JsonDecoderPage extends ConsumerWidget {
  const JsonDecoderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //initialize the async provider
    final todosAsync = ref.watch(todosProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Json Decoder')),
          //make a async.when => data, loading, error
          todosAsync.when(
            data:
                (todos) => Expanded(
                  child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return ListTile(
                        title: Text(
                          (todo.id).toString(),
                          style: TextStyle(
                            color: todo.completed ? Colors.black : Colors.red,
                          ),
                        ),
                        subtitle: Text(
                          todo.title,
                          style: TextStyle(
                            color: todo.completed ? Colors.black : Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            error: (e, stack) => Text(e.toString()),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
