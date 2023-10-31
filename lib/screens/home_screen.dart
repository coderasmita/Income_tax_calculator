import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaxCalculator(),
    );
  }
}

class TaxCalculator extends StatefulWidget {
  const TaxCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaxCalculatorState createState() => _TaxCalculatorState();
}

class _TaxCalculatorState extends State<TaxCalculator> {
  double income = 0;
  double tax = 0;

  void calculateTax() {
    // Simplified tax calculation (10% tax rate)
    setState(() {
      tax = income * 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Income Tax Calculator'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Income'),
              onChanged: (value) {
                setState(() {
                  income = double.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            Text('Tax: $tax'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateTax,
              child: const Text('Calculate Tax'),
            ),
          ],
        ),
      ),
    );
  }
}
