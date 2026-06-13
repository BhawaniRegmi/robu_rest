import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const CurrencyApp());

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const ExchangeScreen(),
    );
  }
}

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  final TextEditingController _amountController = TextEditingController();
  double _result = 0.0;
  String _targetCurrency = 'EUR';
  bool _isLoading = false;

  // List of common currencies for the dropdown
  final List<String> _currencies = ['EUR', 'GBP', 'JPY', 'INR', 'CAD', 'AUD', 'CHF'];

  Future<void> _convertCurrency() async {
    if (_amountController.text.isEmpty) return;

    setState(() => _isLoading = true);

    // API: Frankfurter (Free, no key needed for simple requests)
    final url = Uri.parse(
        'https://api.frankfurter.app/latest?amount=${_amountController.text}&from=USD&to=$_targetCurrency');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _result = data['rates'][_targetCurrency];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error fetching exchange rates')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Money Exchange (USD Base)')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount in USD',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _targetCurrency,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() => _targetCurrency = newValue!);
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              onPressed: _isLoading ? null : _convertCurrency,
              child: _isLoading 
                  ? const CircularProgressIndicator(color: Colors.white) 
                  : const Text('Convert'),
            ),
            const SizedBox(height: 40),
            Text(
              _result > 0 ? '$_result $_targetCurrency' : '0.00',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}