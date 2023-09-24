import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //esto hace referencia al provider counter_provider
    final int clickCounter = ref.watch( counterProvider );
    final bool isDarkmode = ref.watch(isDarkmodeProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            //icon: isDarkmode ? Icon(Icons.light_mode_outlined) : Icon(Icons.dark_mode_outlined),
            icon: Icon( isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined ),
            onPressed: () {
              //esto cambia el valor dentro del update(isDarkmode) a su valor opuesto
              ref.read(isDarkmodeProvider.notifier).update((isDarkmode) => !isDarkmode);
            }, 
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {
          //ref.read(counterProvider.notifier).state++;
          //ref.read(counterProvider.notifier).update((state) => state + 1);
          ref.read(counterProvider.notifier).state++;
        },
      )
    );
  }
}