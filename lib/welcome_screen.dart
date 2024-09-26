import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: VirtualChatFriendScreen(),
debugShowCheckedModeBanner: false,
));


class VirtualChatFriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
    
 
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackgroundShapes(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildBackgroundShapes() {
    return CustomPaint(
      
      painter: BackgroundShapesPainter(),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Твій помічник',
                  style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  'у світі риболовлі',
                  style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _buildDiscoverButton(),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildDiscoverButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
       
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Дослідити',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward, color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

  
    paint.color = Color(0xFF1E0B4B);
    canvas.drawPath(
      Path()
        ..moveTo(0, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, size.height * 0.7)
        ..quadraticBezierTo(size.width * 0.5, size.height * 0.8, 0, size.height * 0.6)
        ..close(),
      paint,
    );

    // Синя фігура
    paint.color = Color(0xFF2A5BDF);
    canvas.drawPath(
      Path()
        ..moveTo(size.width * 0.7, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, size.height * 0.6)
        ..quadraticBezierTo(size.width * 0.8, size.height * 0.3, size.width * 0.5, size.height * 0.4)
        ..close(),
      paint,
    );

    // Червона фігура
    paint.color = Color(0xFFFF416C);
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height * 0.65)
        ..quadraticBezierTo(size.width * 0.3, size.height * 0.7, size.width * 0.4, size.height)
        ..lineTo(0, size.height)
        ..close(),
      paint,
    );

     
    paint.color = Color(0xFF7FDBFE);
    final yetiRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.2, size.height * 0.25, size.width * 0.6, size.height * 0.35),
      Radius.circular(25),
    );
    canvas.drawRRect(yetiRect, paint);

 
    paint.color = Color(0xFFFF69B4);
    final yetiShape = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.35, size.height * 0.3, size.width * 0.3, size.height * 0.25),
      Radius.circular(20),
    );
    canvas.drawRRect(yetiShape, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}