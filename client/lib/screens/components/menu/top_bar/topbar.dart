import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _availableViewModes = <String>['Normal mode', 'Edit mode'];

final currentViewModeProvider = StateProvider<String>((ref) {
  return _availableViewModes.first;
});

final _getCurrentViewMode = Provider<String>((ref) {
  final currentViewMode = ref.watch(currentViewModeProvider.state).state;
  return currentViewMode;
});

final _getCurrentViewModeButtonText = Provider<String>((ref) {
  final currentViewMode = ref.watch(currentViewModeProvider.state).state;
  if (currentViewMode == _availableViewModes[0]) {
    return _availableViewModes[1];
  } else {
    return _availableViewModes[0];
  }
});

void _selectViewMode(BuildContext context, WidgetRef ref, String viewMode) {
  if (ref.read(currentViewModeProvider.state).state != viewMode) {
    ref.read(currentViewModeProvider.state).state = viewMode;
  }
}

class TopBar extends ConsumerWidget implements PreferredSizeWidget {
  final ValueChanged<String>? onViewModeChanged;
  final IconButton? leading;

  const TopBar({Key? key, this.onViewModeChanged, required this.leading})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: leading,
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: GestureDetector(
              child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: OutlinedButton(
                      onPressed: () {
                        if (ref.watch(_getCurrentViewMode) ==
                            _availableViewModes[0]) {
                          _selectViewMode(context, ref, _availableViewModes[1]);
                        } else {
                          _selectViewMode(context, ref, _availableViewModes[0]);
                        }
                      },
                      child: Text(
                        ref.watch(_getCurrentViewModeButtonText),
                        style: const TextStyle(color: Colors.black),
                      ))),
            )),
      ],
      backgroundColor: Colors.white,
      elevation: 1,
    );
  }
}
