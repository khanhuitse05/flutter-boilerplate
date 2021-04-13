import 'package:flutter/material.dart';
import 'package:my_app/src/utils/index.dart';

class SearchField<T> extends StatelessWidget {
  const SearchField(
      {this.onShowSearch, this.value, this.child, this.validator});

  final T? value;
  final VoidCallback? onShowSearch;
  final Widget? child;
  final FormFieldValidator<T>? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: value,
      builder: (FormFieldState<T> field) {
        return Focus(
          canRequestFocus: false,
          skipTraversal: true,
          child: Builder(
            builder: (context) {
              final InputDecoration effectiveDecoration =
                  const InputDecoration().applyDefaults(
                Theme.of(field.context).inputDecorationTheme,
              );
              return InputDecorator(
                decoration:
                    effectiveDecoration.copyWith(errorText: field.errorText),
                isEmpty: isNullOrEmpty(value),
                isFocused: Focus.of(context).hasFocus,
                child: GestureDetector(
                    onTap: this.onShowSearch, child: this.child),
              );
            },
          ),
        );
      },
    );
  }
}
