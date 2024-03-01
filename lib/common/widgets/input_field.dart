import 'package:flutter/material.dart';
import '../theme.dart';

class InputMessage extends StatelessWidget {
  const InputMessage({
    super.key,
    this.controller,
    required this.onPressed,
    this.onChanged,
  });

  final TextEditingController? controller;
  final VoidCallback onPressed;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    // Calculate responsive font size based on device width
    const baseWidth = 360;
    double w = MediaQuery.sizeOf(context).width;
    double fem = w / baseWidth;
    double fFem = fem * 0.97;
    const sendButtonWidth = 50.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Input field container
          Container(
            width: w - (fem * (sendButtonWidth + 10)),
            constraints: BoxConstraints(
              maxHeight: 100 * fem,
              minHeight: 40 * fem,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(fem * 30),
              color: kDarkTextFieldBgColor,
            ),
            child: Row(
              children: [
                // Smileys icon
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: SizedBox(
                    width: fem * 40,
                    height: fem * 40,
                    child: const Icon(Icons.insert_emoticon),
                  ),
                ),
                // Text input field
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: TextStyle(fontSize: fFem * 15),
                    onChanged: onChanged,
                    maxLines: null,
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                // Attach file icon
                Transform.rotate(
                  angle: 0.5,
                  child: SizedBox(
                    width: fem * 40,
                    height: fem * 40,
                    child: const Icon(
                      Icons.attach_file_sharp,
                    ),
                  ),
                ),
                // Currency icon
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: SizedBox(
                    width: fem * 40,
                    height: fem * 40,
                    child: const Icon(
                      Icons.currency_rupee,
                    ),
                  ),
                ),
                // Camera icon
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: SizedBox(
                    width: fem * 40,
                    height: fem * 40,
                    child: const Icon(
                      Icons.camera_alt,
                    ),
                  ),
                ),
                const SizedBox(width: 5)
              ],
            ),
          ),
          // Send button
          SizedBox(
            width: fem * sendButtonWidth,
            height: fem * 40,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onPressed,
              child: const Material(
                elevation: 1,
                color: kPrimaryColor,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
