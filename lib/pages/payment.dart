import 'package:snkrs_demo/pages/bill.dart';
import 'package:snkrs_demo/pages/card.dart';
import 'package:snkrs_demo/pages/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:snkrs_demo/pages/lists.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    int calculateTotalAmount() {
      int sum = 0;
      basket.forEach((item) {
        sum += item[4] as int;
      });
      return sum;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Sähköposti'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Koko nimi'),
              ),
              Divider(),
              const Text(
                'Kuljetustiedot',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Osoite'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Kaupunki'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Alue'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Postinumero'),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? result = await showPaymentOptionsDialog(context);
                  setState(() {
                    selectedPaymentMethod = result ?? '';
                  });
                },
                child: Text('Valitse maksutapa'),
              ),
              if (selectedPaymentMethod.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    'Selected payment method: $selectedPaymentMethod',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(height: 16.0),
              Text(
                'Yhteenveto',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: Text('Kuljetusmaksu'),
                trailing: Text('10 €'),
              ),
              ListTile(
                title: Text('Ostoskorin summa'),
                trailing: Text('${calculateTotalAmount()} €'),
              ),
              ListTile(
                title: Text(
                  'Yhteensä',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  '${calculateTotalAmount() + 10} €',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Visibility(
                visible: selectedPaymentMethod.isNotEmpty,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedPaymentMethod == 'Lasku') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BillPage()),
                      );
                    } else if (selectedPaymentMethod == 'Card') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CardPage()),
                      );
                    }
                  },
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
