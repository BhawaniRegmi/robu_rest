import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MakeupProductPage extends StatefulWidget {
  @override
  _MakeupProductPageState createState() => _MakeupProductPageState();
}

class _MakeupProductPageState extends State<MakeupProductPage> {
  Color selectedColor = Colors.redAccent;

  final List<Color> shadeOptions = [
    Color(0xFFD32F2F), // Deep Red
    Color(0xFFC2185B), // Pink
    Color(0xFF880E4F), // Berry
    Color(0xFFE91E63), // Rose
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF7F2), // Soft cream background
      body: Column(
        children: [
          _buildImageHeader(),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: _buildProductDetails(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageHeader() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1586495777744-4413f21062fa?q=80&w=1000&auto=format&fit=crop'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "GLOSS",
              style: GoogleFonts.montserrat(
                letterSpacing: 2,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Text("\$24.00", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "Velvet Matte Lipstick",
          style: GoogleFonts.playfairDisplay(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text("Select Shade", style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        SizedBox(height: 12),
        Row(
          children: shadeOptions.map((color) => _buildColorDot(color)).toList(),
        ),
        SizedBox(height: 20),
        Text(
          "A long-wearing, full-coverage lipstick with a soft matte finish that feels weightless on the lips.",
          style: GoogleFonts.poppins(color: Colors.grey[600], height: 1.5),
        ),
        Spacer(),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: Text("ADD TO CART", style: TextStyle(color: Colors.white, letterSpacing: 1.5)),
          ),
        )
      ],
    );
  }

  Widget _buildColorDot(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () => setState(() => selectedColor = color),
      child: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? Colors.black : Colors.transparent),
        ),
        child: CircleAvatar(backgroundColor: color, radius: 15),
      ),
    );
  }
}