import 'package:flutter/material.dart';

class CarotPainter extends StatelessWidget {
  const CarotPainter({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomPaint(
      size: Size(
        width,
        (width * 1.163265306122449).toDouble(),
      ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
  }
}
//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6726939, size.height * 0.07690456);
    path_0.cubicTo(
        size.width * 0.6776327,
        size.height * 0.03898175,
        size.width * 0.6463571,
        size.height * 0.004738158,
        size.width * 0.6022429,
        size.height * 0.0004930684);
    path_0.cubicTo(
        size.width * 0.5581286,
        size.height * -0.004035018,
        size.width * 0.5182939,
        size.height * 0.02313351,
        size.width * 0.5133571,
        size.height * 0.06105632);
    path_0.cubicTo(
        size.width * 0.5074306,
        size.height * 0.1043561,
        size.width * 0.5156612,
        size.height * 0.1561461,
        size.width * 0.5261959,
        size.height * 0.2093509);
    path_0.cubicTo(
        size.width * 0.5554959,
        size.height * 0.2169930,
        size.width * 0.5838082,
        size.height * 0.2280298,
        size.width * 0.6101449,
        size.height * 0.2410474);
    path_0.cubicTo(
        size.width * 0.6384571,
        size.height * 0.1835982,
        size.width * 0.6661102,
        size.height * 0.1267137,
        size.width * 0.6726939,
        size.height * 0.07690456);
    path_0.close();
    path_0.moveTo(size.width * 0.9824816, size.height * 0.2433123);
    path_0.cubicTo(
        size.width * 0.9650327,
        size.height * 0.2082193,
        size.width * 0.9176265,
        size.height * 0.1923702,
        size.width * 0.8768061,
        size.height * 0.2073702);
    path_0.cubicTo(
        size.width * 0.8231429,
        size.height * 0.2274632,
        size.width * 0.7675082,
        size.height * 0.2668018,
        size.width * 0.7115408,
        size.height * 0.3072719);
    path_0.cubicTo(
        size.width * 0.7326102,
        size.height * 0.3251000,
        size.width * 0.7523633,
        size.height * 0.3451947,
        size.width * 0.7691531,
        size.height * 0.3669860);
    path_0.cubicTo(
        size.width * 0.8326918,
        size.height * 0.3601930,
        size.width * 0.8935939,
        size.height * 0.3519860,
        size.width * 0.9406714,
        size.height * 0.3344404);
    path_0.cubicTo(
        size.width * 0.9814939,
        size.height * 0.3188737,
        size.width * 1.000259,
        size.height * 0.2781211,
        size.width * 0.9824816,
        size.height * 0.2433123);
    path_0.close();
    path_0.moveTo(size.width * 0.8471755, size.height * 0.05822614);
    path_0.cubicTo(
        size.width * 0.8116224,
        size.height * 0.03558579,
        size.width * 0.7612531,
        size.height * 0.04181193,
        size.width * 0.7349163,
        size.height * 0.07237649);
    path_0.cubicTo(
        size.width * 0.6947510,
        size.height * 0.1187895,
        size.width * 0.6677571,
        size.height * 0.1881263,
        size.width * 0.6384571,
        size.height * 0.2557649);
    path_0.cubicTo(
        size.width * 0.6483327,
        size.height * 0.2614246,
        size.width * 0.6575510,
        size.height * 0.2670842,
        size.width * 0.6664388,
        size.height * 0.2730281);
    path_0.cubicTo(
        size.width * 0.6730245,
        size.height * 0.2775561,
        size.width * 0.6799367,
        size.height * 0.2823667,
        size.width * 0.6868510,
        size.height * 0.2871772);
    path_0.cubicTo(
        size.width * 0.7540102,
        size.height * 0.2435947,
        size.width * 0.8238020,
        size.height * 0.2011439,
        size.width * 0.8639653,
        size.height * 0.1547312);
    path_0.cubicTo(
        size.width * 0.8903020,
        size.height * 0.1241665,
        size.width * 0.8827306,
        size.height * 0.08086667,
        size.width * 0.8471755,
        size.height * 0.05822614);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.6944224, size.height * 0.6123509);
    path_1.cubicTo(
        size.width * 0.6697327,
        size.height * 0.6352737,
        size.width * 0.6433959,
        size.height * 0.6565000,
        size.width * 0.6154122,
        size.height * 0.6771596);
    path_1.cubicTo(
        size.width * 0.5762367,
        size.height * 0.7063088,
        size.width * 0.5364020,
        size.height * 0.7346088,
        size.width * 0.4959082,
        size.height * 0.7617772);
    path_1.cubicTo(
        size.width * 0.4524531,
        size.height * 0.7388544,
        size.width * 0.4211776,
        size.height * 0.7272509,
        size.width * 0.4159102,
        size.height * 0.7331947);
    path_1.cubicTo(
        size.width * 0.4113020,
        size.height * 0.7385719,
        size.width * 0.4294082,
        size.height * 0.7583825,
        size.width * 0.4620000,
        size.height * 0.7841351);
    path_1.cubicTo(
        size.width * 0.3527020,
        size.height * 0.8540368,
        size.width * 0.2371490,
        size.height * 0.9157333,
        size.width * 0.1130365,
        size.height * 0.9663912);
    path_1.cubicTo(
        size.width * 0.09361327,
        size.height * 0.9743158,
        size.width * 0.07320204,
        size.height * 0.9799754,
        size.width * 0.05312020,
        size.height * 0.9862018);
    path_1.cubicTo(
        size.width * 0.04785286,
        size.height * 0.9879000,
        size.width * 0.04225633,
        size.height * 0.9879000,
        size.width * 0.03995184,
        size.height * 0.9881825);
    path_1.cubicTo(
        size.width * 0.008347592,
        size.height * 0.9912947,
        size.width * -0.001199512,
        size.height * 0.9839368,
        size.width * 0.0001173312,
        size.height * 0.9590333);
    path_1.cubicTo(
        size.width * 0.004067857,
        size.height * 0.8814895,
        size.width * 0.03205082,
        size.height * 0.8087561,
        size.width * 0.06102122,
        size.height * 0.7363070);
    path_1.cubicTo(
        size.width * 0.06892245,
        size.height * 0.7164965,
        size.width * 0.07715265,
        size.height * 0.6966860,
        size.width * 0.08571204,
        size.height * 0.6768754);
    path_1.cubicTo(
        size.width * 0.1294971,
        size.height * 0.6998000,
        size.width * 0.1607722,
        size.height * 0.7116860,
        size.width * 0.1660396,
        size.height * 0.7057421);
    path_1.cubicTo(
        size.width * 0.1716361,
        size.height * 0.6992333,
        size.width * 0.1452992,
        size.height * 0.6731965,
        size.width * 0.1011851,
        size.height * 0.6406509);
    path_1.cubicTo(
        size.width * 0.1327892,
        size.height * 0.5704667,
        size.width * 0.1680149,
        size.height * 0.5014123,
        size.width * 0.2094959,
        size.height * 0.4351895);
    path_1.cubicTo(
        size.width * 0.2924571,
        size.height * 0.4881105,
        size.width * 0.3662000,
        size.height * 0.5229211,
        size.width * 0.3744306,
        size.height * 0.5132982);
    path_1.cubicTo(
        size.width * 0.3826592,
        size.height * 0.5036772,
        size.width * 0.3217571,
        size.height * 0.4524526,
        size.width * 0.2378082,
        size.height * 0.3989649);
    path_1.lineTo(size.width * 0.2341857, size.height * 0.3967000);
    path_1.cubicTo(
        size.width * 0.2486714,
        size.height * 0.3754754,
        size.width * 0.2638143,
        size.height * 0.3542491,
        size.width * 0.2799469,
        size.height * 0.3335895);
    path_1.cubicTo(
        size.width * 0.3000286,
        size.height * 0.3075544,
        size.width * 0.3247184,
        size.height * 0.2837807,
        size.width * 0.3490816,
        size.height * 0.2605754);
    path_1.cubicTo(
        size.width * 0.3816735,
        size.height * 0.2297263,
        size.width * 0.4238122,
        size.height * 0.2192561,
        size.width * 0.4708878,
        size.height * 0.2283123);
    path_1.cubicTo(
        size.width * 0.6216673,
        size.height * 0.2571789,
        size.width * 0.7263571,
        size.height * 0.3316088,
        size.width * 0.7757388,
        size.height * 0.4592456);
    path_1.cubicTo(
        size.width * 0.7856143,
        size.height * 0.4852807,
        size.width * 0.7767265,
        size.height * 0.5107526,
        size.width * 0.7612531,
        size.height * 0.5342421);
    path_1.cubicTo(
        size.width * 0.7507184,
        size.height * 0.5500895,
        size.width * 0.7391959,
        size.height * 0.5650895,
        size.width * 0.7263571,
        size.height * 0.5792386);
    path_1.cubicTo(
        size.width * 0.6466878,
        size.height * 0.5291474,
        size.width * 0.5775531,
        size.height * 0.4968842,
        size.width * 0.5696510,
        size.height * 0.5059404);
    path_1.cubicTo(
        size.width * 0.5620796,
        size.height * 0.5149965,
        size.width * 0.6170592,
        size.height * 0.5616930,
        size.width * 0.6944224,
        size.height * 0.6123509);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
