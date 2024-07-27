import 'package:flutter/material.dart';
import 'contact_details.dart';

class MyHomePage extends StatefulWidget {
  final String id = '/MyHomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _contacts = [
    {
      'name': 'mukesh ambani',
      'image': 'assets/images/mukesh.jpeg',
      'phone': '+1 234 567 890'
    },
    {
      'name': 'Elon Musk',
      'image': 'assets/images/elon.png',
      'phone': '+1 987 654 321'
    },
    // Add more contacts here
  ];
  List<Map<String, String>> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    _filteredContacts = _contacts;
    _searchController.addListener(_filterContacts);
  }

  void _filterContacts() {
    setState(() {
      _filteredContacts = _contacts
          .where((contact) => contact['name']!
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasSearchQuery = _searchController.text.isNotEmpty;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/swarup.jpeg'),
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              if (hasSearchQuery) ...[
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = _filteredContacts[index];
                    return ListTile(
                      title: Text(contact['name']!),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactDetails(
                              contactName: contact['name']!,
                              contactImage: contact['image']!,
                              phoneNumber: contact['phone']!,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
              Container(
                height: 150.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70.0,
                      child: Image.asset(
                        'assets/images/gplogo.png',
                      ),
                    ),
                    Icon(
                      Icons.play_circle_fill_rounded,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          children: [
                            _buildElevatedButton(
                                Icons.qr_code_scanner, 'Scan any\nQR code'),
                            _buildElevatedButton(Icons.person, 'Pay\ncontacts'),
                            _buildElevatedButton(
                                Icons.phone, 'Pay phone\nnumber'),
                            _buildElevatedButton(
                                Icons.account_balance, 'Bank\ntransfer'),
                            _buildElevatedButton(
                                Icons.transfer_within_a_station,
                                'Self\ntransfer'),
                            _buildElevatedButton(Icons.receipt, 'Pay\nbills'),
                            _buildElevatedButton(
                                Icons.phone_android, 'Mobile\nrecharge'),
                            _buildElevatedButton(
                                Icons.payment, 'Pay UPI or\nnumber'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Text(
                          'People',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CirclePeople(
                              peopleImage: AssetImage('assets/images/elon.png'),
                              peopleName: 'Elon',
                            ),
                            CirclePeople(
                              peopleImage:
                                  AssetImage('assets/images/mark.jpeg'),
                              peopleName: 'Mark',
                            ),
                            CirclePeople(
                              peopleImage:
                                  AssetImage('assets/images/sundar.jpg'),
                              peopleName: 'Sundaram',
                            ),
                            CirclePeople(
                              peopleImage:
                                  AssetImage('assets/images/mukesh.jpeg'),
                              peopleName: 'Mukesh',
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CirclePeople(
                              peopleImage:
                                  AssetImage('assets/images/donald.jpg'),
                              peopleName: 'Donald',
                            ),
                            CirclePeople(
                              peopleImage:
                                  AssetImage('assets/images/ratan.jpg'),
                              peopleName: 'Ratan',
                            ),
                            CirclePeople(
                              peopleImage:
                                  AssetImage('assets/images/narendra.jpg'),
                              peopleName: 'Narendra',
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                    vertical: 10.0,
                                  ),
                                  height: 60.0,
                                  width: 60.0,
                                  child: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 50.0,
                                    color: Colors.grey,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                Text('More'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Businesses and bills',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CirclePeople(
                              peopleImage: AssetImage('assets/images/jio.png'),
                              peopleName: 'Jio Pre..',
                            ),
                            CirclePeople(
                              peopleImage: AssetImage('assets/images/oyo.png'),
                              peopleName: 'OYO Rooms',
                            ),
                            CirclePeople(
                              peopleImage: AssetImage('assets/images/vi.png'),
                              peopleName: 'VI Post..',
                            ),
                            CirclePeople(
                              peopleImage:
                                  AssetImage('assets/images/flipkart.png'),
                              peopleName: 'Flipkart..',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.currency_rupee),
          label: Text('New Payment'),
        ),
      ),
    );
  }

  ElevatedButton _buildElevatedButton(IconData icon, String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.blue,
          ),
          SizedBox(height: 5.0),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class CirclePeople extends StatelessWidget {
  final ImageProvider peopleImage;
  final String peopleName;

  const CirclePeople({required this.peopleImage, required this.peopleName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: peopleImage,
          ),
          SizedBox(height: 8.0),
          Text(
            peopleName,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
