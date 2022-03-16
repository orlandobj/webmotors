/*Classes utilizada para reproduzir o trapézio vermelho utilizado para destacar o preço dos carros.
 *O site utilizado foi https://fluttershapemaker.com/
*/
import 'package:flutter/cupertino.dart';

class CustomShape extends StatefulWidget {
  const CustomShape({Key? key}) : super(key: key);

  @override
  State<CustomShape> createState() => _CustomShapeState();
}

class _CustomShapeState extends State<CustomShape> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
          MediaQuery.of(context).size.width * 0.7,
          (MediaQuery.of(context).size.width * 0.12)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 192, 40, 43)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width * 0.7805917, size.height * 0.9976143);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
