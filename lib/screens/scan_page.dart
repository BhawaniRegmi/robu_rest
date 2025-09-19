import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:async';

import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:robu_rest/screens/resturant_detail.dart';

class ScanTab extends StatefulWidget {
  @override
  _ScanTabState createState() => _ScanTabState();
}

class _ScanTabState extends State<ScanTab> with WidgetsBindingObserver {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String _scanResult = 'Align the QR code within the frame';
  bool _isScanning = false;
  bool _showScanner = true;
  bool _cameraPermissionGranted = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkCameraPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    
    // Handle app lifecycle changes to properly manage camera
    if (state == AppLifecycleState.resumed) {
      // App came to foreground, resume camera if needed
      if (_showScanner && controller != null) {
        controller!.resumeCamera();
      }
    } else if (state == AppLifecycleState.paused) {
      // App went to background, pause camera to save resources
      if (controller != null) {
        controller!.pauseCamera();
      }
    }
  }

  Future<void> _checkCameraPermission() async {
    setState(() {
      _isLoading = true;
    });
    
    // Check camera permission status
    var status = await Permission.camera.status;
    
    if (!status.isGranted) {
      // Request permission if not granted
      status = await Permission.camera.request();
    }
    
    setState(() {
      _cameraPermissionGranted = status.isGranted;
      _isLoading = false;
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!_isScanning && scanData.code != null) {
        setState(() {
          _isScanning = true;
          _scanResult = 'Processing: ${scanData.code}';
        });
        
        // Process the scanned data
        _processScannedData(scanData.code!);
        
        // Pause camera after successful scan
        controller.pauseCamera();
      }
    });
  }

  void _processScannedData(String scanData) {
    // Simulate API call delay
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isScanning = false;
        _scanResult = 'Restaurant: Pizza Palace\nOffer: 15% OFF on all pizzas!';
      });
      
      // Show result with option to scan again
      _showScanResult();
    });
  }

void _showScanResult() {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Scan successful! Loading restaurant details...'),
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xFFFF6D00),
    ),
  );
  
  // Navigate directly to restaurant details after a short delay
  Future.delayed(Duration(seconds: 1), () {
    _navigateToRestaurantDetails();
  });
}

void _navigateToRestaurantDetails() {
  // Extract restaurant ID from scan data (in real app, parse the QR data)
  String restaurantId = 'restaurant_123'; // This should come from the scanned QR data
  
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RestaurantDetailScreen(restaurantId: restaurantId),
    ),
  );
  
  // Reset scanner after navigation
  _resetScanner();
}

  void _resetScanner() {
    setState(() {
      _scanResult = 'Align the QR code within the frame';
      _isScanning = false;
    });
    
    // Resume camera after a brief delay
    Future.delayed(Duration(milliseconds: 500), () {
      if (controller != null) {
        controller!.resumeCamera();
      }
    });
  }

  void _toggleFlash() {
    if (controller != null) {
      controller!.toggleFlash();
    }
  }

  void _flipCamera() {
    if (controller != null) {
      controller!.flipCamera();
    }
  }

  Widget _buildPermissionRequest() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt, size: 64, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'Camera Permission Required',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'RoboRest needs camera access to scan restaurant QR codes',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: _checkCameraPermission,
            child: Text('Grant Permission'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1A237E),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1A237E)),
          ),
          SizedBox(height: 20),
          Text(
            'Checking camera permissions...',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerView() {
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Color(0xFFFF6D00),
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 8,
            cutOutSize: MediaQuery.of(context).size.width * 0.7,
          ),
        ),
        
        // Semi-transparent overlay
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        
        // Scanner frame cutout
        CustomPaint(
          size: Size.infinite,
          painter: _ScannerOverlayPainter(),
        ),
        
        // Instructions and status
        Positioned(
          top: MediaQuery.of(context).padding.top + 20,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text(
              _scanResult,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        
        // Scanner controls
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Flash toggle button
              FloatingActionButton(
                onPressed: _toggleFlash,
                child: Icon(Icons.flash_on),
                backgroundColor: Color(0xFF1A237E).withOpacity(0.8),
                foregroundColor: Colors.white,
                mini: true,
              ),
              
              // Scan again button (shown only after a scan)
              if (_isScanning || _scanResult.contains('Processing'))
                FloatingActionButton(
                  onPressed: _resetScanner,
                  child: Icon(Icons.refresh),
                  backgroundColor: Color(0xFFFF6D00).withOpacity(0.8),
                  foregroundColor: Colors.white,
                )
              else
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: Color(0xFFFF6D00),
                      width: 3,
                    ),
                  ),
                ),
              
              // Camera flip button
              FloatingActionButton(
                onPressed: _flipCamera,
                child: Icon(Icons.cameraswitch),
                backgroundColor: Color(0xFF1A237E).withOpacity(0.8),
                foregroundColor: Colors.white,
                mini: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildLoadingIndicator();
    }
    
    if (!_cameraPermissionGranted) {
      return _buildPermissionRequest();
    }
    
    return _buildScannerView();
  }
}

// Custom painter for the scanner overlay
class _ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cutOutSize = size.width * 0.7;
    final cutOutRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: cutOutSize,
      height: cutOutSize,
    );
    
    // Draw background with hole
    final backgroundPaint = Paint()..color = Colors.black.withOpacity(0.4);
    final path = Path()..addRect(Rect.largest);
    path.addRect(cutOutRect);
    canvas.drawPath(path, backgroundPaint);
    
    // Draw corner markers
    final cornerPaint = Paint()
      ..color = Color(0xFFFF6D00)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    
    const cornerLength = 20.0;
    
    // Top-left corner
    canvas.drawLine(
      Offset(cutOutRect.left, cutOutRect.top),
      Offset(cutOutRect.left + cornerLength, cutOutRect.top),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(cutOutRect.left, cutOutRect.top),
      Offset(cutOutRect.left, cutOutRect.top + cornerLength),
      cornerPaint,
    );
    
    // Top-right corner
    canvas.drawLine(
      Offset(cutOutRect.right, cutOutRect.top),
      Offset(cutOutRect.right - cornerLength, cutOutRect.top),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(cutOutRect.right, cutOutRect.top),
      Offset(cutOutRect.right, cutOutRect.top + cornerLength),
      cornerPaint,
    );
    
    // Bottom-left corner
    canvas.drawLine(
      Offset(cutOutRect.left, cutOutRect.bottom),
      Offset(cutOutRect.left + cornerLength, cutOutRect.bottom),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(cutOutRect.left, cutOutRect.bottom),
      Offset(cutOutRect.left, cutOutRect.bottom - cornerLength),
      cornerPaint,
    );
    
    // Bottom-right corner
    canvas.drawLine(
      Offset(cutOutRect.right, cutOutRect.bottom),
      Offset(cutOutRect.right - cornerLength, cutOutRect.bottom),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(cutOutRect.right, cutOutRect.bottom),
      Offset(cutOutRect.right, cutOutRect.bottom - cornerLength),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

