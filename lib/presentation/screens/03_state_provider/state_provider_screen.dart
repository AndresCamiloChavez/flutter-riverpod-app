import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(countProvider);
    final isDark = ref.watch(isDarkProvider);
    final nameRandom = ref.watch(randomNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            icon: Icon(
                isDark
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                size: 100),
            onPressed: () {
              ref.read(isDarkProvider.notifier).update((state) => state = !state);
            },
          ),
          const Text('Fernando Herrera', style: TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label:
                Text(counter.toString(), style: const TextStyle(fontSize: 100)),
            onPressed: () {
              ref
                  .read(countProvider.notifier)
                  .update((state) => state = state + 1);
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(nameRandom),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          ref.invalidate(randomNameProvider); // vuelve a ejecutar esta función
        },
      ),
    );
  }
}
