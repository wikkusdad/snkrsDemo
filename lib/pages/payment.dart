import 'package:flutter/material.dart';
import 'package:snkrs_demo/pages/bill.dart';
import 'package:snkrs_demo/pages/card.dart';
import 'package:snkrs_demo/pages/dialogs.dart';
import 'package:snkrs_demo/pages/lists.dart';
import 'package:snkrs_demo/pages/transfer.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    double calculateTotalAmount(List<List<dynamic>> basket) {
      double sum = 0.0;
      basket.forEach((item) {
        sum += double.parse(item[4].toString());
      });
      return sum;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Kassa'),
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
                style: ElevatedButton.styleFrom(primary: Colors.black),
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
                    'Olet valinnut maksutavaksi $selectedPaymentMethod',
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
                trailing: Text(
                    '${calculateTotalAmount(basket).toStringAsFixed(2)} €'),
              ),
              ListTile(
                title: Text(
                  'Yhteensä',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  '${(calculateTotalAmount(basket) + 10).toStringAsFixed(2)} €',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Visibility(
                visible: selectedPaymentMethod.isNotEmpty,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    if (selectedPaymentMethod == 'Lasku') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BillPage()),
                      );
                    } else if (selectedPaymentMethod == 'Kortti') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CardPage()),
                      );
                    } else if (selectedPaymentMethod == 'Tilisiirto') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => bankTransfer()),
                      );
                    }
                  },
                  child: Text('Seuraava'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
