import 'package:flutter/material.dart';
import '../theme.dart';

/// Bondly logo — a crystal diamond "B" with purple→cyan gradient.
class BondlyLogo extends StatelessWidget {
  final double size;
  final bool showText;
  const BondlyLogo({super.key, this.size = 40, this.showText = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: _LogoPainter(),
        ),
        if (showText) ...[
          const SizedBox(width: 10),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [BColor.logoA, BColor.logoB],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              'bondly',
              style: TextStyle(
                fontSize: size * 0.55,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.5,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Background circle with gradient
    final bgPaint = Paint()
      ..shader = const LinearGradient(
        colors: [BColor.logoA, BColor.logoB],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect);

    final rr = RRect.fromRectAndRadius(rect, Radius.circular(size.width * 0.28));
    canvas.drawRRect(rr, bgPaint);

    // Draw stylized "B" letter
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'B',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 0, // we'll scale manually
          letterSpacing: -1,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    // Draw diamond accent at top-right
    final diamondPaint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..style = PaintingStyle.fill;

    final diamondPath = Path();
    final cx = size.width * 0.72;
    final cy = size.height * 0.28;
    final r = size.width * 0.10;
    diamondPath.moveTo(cx, cy - r);
    diamondPath.lineTo(cx + r * 0.7, cy);
    diamondPath.lineTo(cx, cy + r);
    diamondPath.lineTo(cx - r * 0.7, cy);
    diamondPath.close();
    canvas.drawPath(diamondPath, diamondPaint);

    // Draw "b" shape manually using paths
    final bPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Stem
    final stemLeft = size.width * 0.22;
    final stemTop = size.height * 0.18;
    final stemBottom = size.height * 0.82;
    final stemWidth = size.width * 0.13;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(stemLeft, stemTop, stemWidth, stemBottom - stemTop),
        Radius.circular(stemWidth / 2),
      ),
      bPaint,
    );

    // Upper bump
    final bumpPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.12
      ..strokeCap = StrokeCap.round;

    // Upper curve
    final upperRect = Rect.fromLTWH(
      stemLeft + stemWidth * 0.5,
      size.height * 0.20,
      size.width * 0.32,
      size.height * 0.28,
    );
    canvas.drawArc(upperRect, -1.57, 3.14, false, bumpPaint);

    // Lower curve (bigger)
    final lowerRect = Rect.fromLTWH(
      stemLeft + stemWidth * 0.5,
      size.height * 0.47,
      size.width * 0.40,
      size.height * 0.32,
    );
    canvas.drawArc(lowerRect, -1.57, 3.14, false, bumpPaint);

    textPainter.layout();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
