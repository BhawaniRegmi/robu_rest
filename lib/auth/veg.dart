import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: VeggieHome(), debugShowCheckedModeBanner: false));

class VeggieHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fresh Veggies'), backgroundColor: Colors.green),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 0.8,
          crossAxisSpacing: 10, 
          mainAxisSpacing: 10
        ),
        itemCount: vegList.length,
        itemBuilder: (context, index) {
          final veg = vegList[index];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VegDetail(veg: veg))),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Expanded(child: Image.network(veg.image, fit: BoxFit.contain)),
                  Text(veg.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(veg.price, style: TextStyle(color: Colors.green)),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}