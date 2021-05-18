import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.elevatedButtonKey,
    required this.child,
    this.function,
    this.isFraction = true,
  }) : super(key: key);

  final String child;
  final Function()? function;
  final Key? elevatedButtonKey;

  /// Each screen specify if [ElevatedButton] needs [FractionallySizedBox].
  ///
  /// By default, it's true.
  /// It means [ElevatedButton] is using [FractionallySizedBox]
  final bool isFraction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: !isFraction
            ? _buildElevatedButton()
            : FractionallySizedBox(
                widthFactor: 1.0,
                child: _buildElevatedButton(),
              ),
      ),
    );
  }

  ElevatedButton _buildElevatedButton() {
    return ElevatedButton(
      key: elevatedButtonKey,
      onPressed: function,
      style: function == null
          ? ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff949494)),
              minimumSize: MaterialStateProperty.all(const Size(250, 60)))
          : ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(250, 60))),
      child: Text(
        child,
        style: const TextStyle(
          fontFamily: 'Rubik',
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
