import 'package:flutter/material.dart';
import 'globals.dart' as globals;

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
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            CheckBoxWrapper(),
            LabeledCheckbox(label: "stuff", value: false, onChanged: dummy)
          ],
        ),
      ),
    );
  }
}

bool dummy() {
  return true;
}

class CheckBoxWrapper extends StatefulWidget {
  const CheckBoxWrapper({Key? key}) : super(key: key);

  @override
  State<CheckBoxWrapper> createState() => _CheckBoxWrapperState();
}

class _CheckBoxWrapperState extends State<CheckBoxWrapper> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

// class LabeledCheckbox extends StatefulWidget {
//   const LabeledCheckbox(
//       {Key? key,
//       this.label = "urmom",
//       this.value = false,
//       this.onChanged = globals.dummy()})
//       : super(key: key);

//   final String label;
//   final bool value;
//   final Function onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         onChanged(!value);
//       },
//       child: Row(
//         children: <Widget>[
//           Checkbox(
//             value: value,
//             onChanged: (bool? newValue) {
//               onChanged(newValue);
//             },
//           ),
//           Text(label),
//         ],
//       ),
//     );
//   }
// }

// class _LabeledCheckboxState extends State<LabeledCheckbox> {
//   bool _isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return LabeledCheckbox(
//       label: 'This is the label text',
//       //padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       value: _isSelected,
//       onChanged: (bool newValue) {
//         setState(() {
//           _isSelected = newValue;
//         });
//       },
//     );
//   }
// }
// class CheckBoxWrapper extends StatefulWidget {
//   const CheckBoxWrapper({Key? key}) : super(key: key);

//   @override
//   State<CheckBoxWrapper> createState() => _CheckBoxWrapperState();
// }

class LabeledCheckbox extends StatefulWidget {
  const LabeledCheckbox({
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

  @override
  State<LabeledCheckbox> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return LabeledCheckbox(
      label: 'This is the label text',
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
