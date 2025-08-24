import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CallToActionButtons extends StatefulWidget {
  final bool verticalOnMobile;

  const CallToActionButtons({super.key, this.verticalOnMobile = true});

  @override
  State<CallToActionButtons> createState() => _CallToActionButtonsState();
}

class _CallToActionButtonsState extends State<CallToActionButtons> {
  bool _hoverAdhere = false;
  bool _hoverDonate = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    Widget buildButton({
      required Widget child,
      required VoidCallback onPressed,
      required bool hover,
      required ValueChanged<bool> onHover,
      required Color bgColor,
      required Color fgColor,
      BorderSide? border,
    }) {
      return MouseRegion(
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: AnimatedScale(
          scale: hover ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              foregroundColor: fgColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              side: border,
              shadowColor: hover ? Colors.black45 : Colors.transparent,
              elevation: hover ? 8 : 2,
            ),
            onPressed: onPressed,
            child: child,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Flex(
        direction: (isMobile && widget.verticalOnMobile) ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildButton(
            hover: _hoverAdhere,
            onHover: (val) => setState(() => _hoverAdhere = val),
            onPressed: () => context.go('/adhesion'),
            bgColor: Colors.indigo.shade700,
            fgColor: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.how_to_vote),
                SizedBox(width: 8),
                Text("Adhérer au mouvement"),
              ],
            ),
          ),
          SizedBox(height: (isMobile && widget.verticalOnMobile) ? 16 : 0, width: (isMobile && widget.verticalOnMobile) ? 0 : 16),
          buildButton(
            hover: _hoverDonate,
            onHover: (val) => setState(() => _hoverDonate = val),
            onPressed: () => context.go('/don'),
            bgColor: Colors.transparent,
            fgColor: Colors.indigo.shade800,
            border: BorderSide(color: Colors.indigo.shade700, width: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(FontAwesomeIcons.handshakeAngle, size: 20),
                SizedBox(width: 8),
                Text("Faire un don"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
