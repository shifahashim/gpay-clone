import 'package:flutter/material.dart';
import 'package:gpay/views/payment_page.dart';

class ContactDetails extends StatelessWidget {
  final String contactName;
  final String contactImage;
  final String phoneNumber;

  ContactDetails({
    required this.contactName,
    required this.contactImage,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(contactImage),
              radius: 50,
            ),
            SizedBox(height: 16),
            Text(
              contactName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Banking name: $contactName',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              phoneNumber,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'Joined July 2020',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'Say "Hello!" 👋',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          contactName: contactName,
                          contactImage: contactImage,
                          phoneNumber: phoneNumber,
                        ),
                      ),
                    );
                  },
                  child: Text('Pay'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Request'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Message...',
                        suffixIcon: Icon(Icons.send),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
