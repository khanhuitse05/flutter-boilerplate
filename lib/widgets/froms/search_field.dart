import 'package:flutter/material.dart';
import 'package:my_app/src/utils/utils.dart';

class XSearchField<T> extends StatelessWidget {
  const XSearchField(
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
