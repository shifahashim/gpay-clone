import 'package:flutter/material.dart';
import 'package:gpay/confirmation_pay.dart';
//import 'confirmation_page.dart';

class PaymentPage extends StatefulWidget {
  final String contactName;
  final String contactImage;
  final String phoneNumber;

  const PaymentPage({
    required this.contactName,
    required this.contactImage,
    required this.phoneNumber,
  });

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  bool _isAmountValid = false;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_validateAmount);
  }

  void _validateAmount() {
    setState(() {
      _isAmountValid = _amountController.text.isNotEmpty &&
          double.tryParse(_amountController.text) != null &&
          double.parse(_amountController.text) > 0;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the contact image
            CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage(widget.contactImage),
            ),
            SizedBox(height: 16.0),

            // Display the contact name
            Text(
              'Paying ${widget.contactName}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),

            // Display the banking name
            Text(
              'Banking Name: ${widget.contactName}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),

            // Display the phone number
            Text(
              '${widget.phoneNumber}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),

            // Input field for amount without underline or container
            TextField(
              textAlign: TextAlign.center,
              controller: _amountController,
              decoration: InputDecoration.collapsed(hintText: '0'),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              cursorColor: Colors.black,
            ),
            SizedBox(height: 16.0),

            // Input field for notE

            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 130.0),
              child: TextField(
                controller: _noteController,
                decoration: InputDecoration(
                  labelText: 'Add a note',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Spacer(),

            // Check button
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: _isAmountValid
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmationPage(
                              contactName: widget.contactName,
                              contactImage: widget.contactImage,
                              amount: _amountController.text,
                              note: _noteController.text,
                            ),
                          ),
                        );
                      }
                    : null,
                child: Icon(Icons.arrow_forward),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isAmountValid ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
