import 'package:flutter/material.dart';
//import 'package:gpay/pin_entry_page.dart';
import 'package:gpay/sucessanimationDialog.dart';

class ConfirmationPage extends StatelessWidget {
  final String contactName;
  final String contactImage;
  final String amount;
  final String note;

  const ConfirmationPage({
    required this.contactName,
    required this.contactImage,
    required this.amount,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Contact image
            CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage(contactImage),
            ),
            SizedBox(height: 16.0),

            // Paying contact name
            Text(
              'Paying $contactName',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40.0),

            // Amount
            Text(
              '\$$amount',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),

            // Note
            Text(
              note,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
            Spacer(),

            // Pay button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (contactName == 'Elon Musk' && amount == '800') {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SuccessAnimationDialog();
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  'Pay \$$amount',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
