import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: checklist(),
      ),
    );
  }
}

class _LabeledCheckboxStateless extends StatelessWidget {
  const _LabeledCheckboxStateless({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: <Widget>[
          Checkbox(
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue);
            },
          ),
          Text(label),
        ],
      ),
    );
  }
}

class LabeledCheckbox extends StatefulWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  State<LabeledCheckbox> createState() => _LabledCheckbox(this.label);
}

class _LabledCheckbox extends State<LabeledCheckbox> {
  _LabledCheckbox(this.label);

  final String label;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return _LabeledCheckboxStateless(
      label: this.label,
      //padding: const EdgeInsets.symmetric(horizontal: 20.0),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }
}

class checklist extends StatefulWidget {
  List<String> items = ["ur mom", "test 1", "test 2"];
  checklist({Key? key}) : super(key: key);

  @override
  State<checklist> createState() => _checklistState();
}

class _checklistState extends State<checklist> {
  Future<void> addTask(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                background: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
                key: ValueKey<String>(widget.items[index]),
                direction: DismissDirection.endToStart,
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    widget.items.removeAt(index);
                  });
                },
                child: LabeledCheckbox(label: widget.items[index]));
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              addTask(context);
            });
          }),
    );
  }
}
