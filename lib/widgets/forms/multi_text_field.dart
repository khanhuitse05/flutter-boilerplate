import 'package:flutter/material.dart';
import 'package:myapp/src/utils/utils.dart';

class XMultiTextField extends StatelessWidget {
  XMultiTextField(
      {super.key, this.value, this.hintText, this.onChanged, this.validator});

  final ValueChanged? onChanged;
  final String? hintText;
  final List<String>? value;
  final FormFieldValidator<List<String>>? validator;

  @override
  Widget build(BuildContext context) {
    final value = this.value ?? [];
    return FormField(
      validator: validator,
      initialValue: value,
      builder: (FormFieldState<List<String>> field) {
        return Focus(
          child: Builder(
            builder: (context) {
              final InputDecoration effectiveDecoration =
                  const InputDecoration(contentPadding: EdgeInsets.all(0))
                      .applyDefaults(
                Theme.of(field.context).inputDecorationTheme,
              );
              return InputDecorator(
                decoration:
                    effectiveDecoration.copyWith(errorText: field.errorText),
                isEmpty: value.isEmpty,
                isFocused: Focus.of(context).hasFocus,
                child: Column(
                  children: [
                    for (int i = 0; i < value.length; i++)
                      _buildItem(context, value[i]),
                    _buildAddItem(context),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _addItem(String val) {
    final value = this.value ?? [];
    if (value.contains(val) != true) {
      value.add(val);
      onChanged?.call(value);
    }
  }

  void _removeItem(String id) {
    final value = this.value ?? []
      ..remove(id);
    onChanged?.call(value);
  }

  Widget _buildItem(BuildContext context, String item) {
    final theme = Theme.of(context).inputDecorationTheme;

    return Container(
      padding: const EdgeInsets.only(left: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(
            item,
            style: theme.labelStyle,
          )),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => _removeItem(item),
          ),
        ],
      ),
    );
  }

  Widget _buildAddItem(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;
    return InkWell(
      onTap: () => _showAddItem(context),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 8),
              child: const Icon(Icons.add),
            ),
            Expanded(
              child: Text(
                hintText ?? '',
                style: theme.hintStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _textController = TextEditingController();

  Future _showAddItem(BuildContext context) async {
    final result = await _showAddItemModal(context);
    if (isNullOrEmpty(result) == false) {
      _addItem(result);
    }
  }

  Future<String> _showAddItemModal(BuildContext context) async {
    _textController.text = "";
    String valueInput = '';
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(width: 24),
                    Text(
                      hintText ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const CloseButton(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _textController,
                        autofocus: true,
                        decoration: InputDecoration(
                            hintText: hintText,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              onPressed: () {
                                valueInput = _textController.text;
                                Navigator.pop(context);
                              },
                            )),
                        onFieldSubmitted: (value) {
                          valueInput = _textController.text;
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    return valueInput;
  }
}
