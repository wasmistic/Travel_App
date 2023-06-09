
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/widgets/destination_carousel.dart';
import 'package:flutter_travel_app/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab=0;
  int _selectedIndex= 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,

  ];
  Widget _buildIcon (int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Theme.of(context).hintColor : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],size: 25.0,
          color: _selectedIndex == index ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right:120.0),
                child: Text(
                  'What would you like to find ?',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons.asMap().entries.map(
                      (MapEntry map) => _buildIcon(map.key),
                ).toList(),
              ),
              SizedBox(height: 20.0),
              DestinationCarousel(),
              SizedBox(height: 20.0),
              HotelCarousel(),
            ],
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentTab,
        onTap: (int value){
          setState(() {
            _currentTab = value;
          });
        },
        items: [

          BottomNavigationBarItem(
            backgroundColor:Theme.of(context).hintColor,
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            label: 'Search',

          ),
          BottomNavigationBarItem(
              backgroundColor:Theme.of(context).hintColor,
            icon: Icon(
              Icons.home,
              size: 30.0,
            ),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              backgroundColor:Theme.of(context).hintColor,
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: AssetImage('assets/images/me.jpg'),
            ),
              label: 'Person'
          ),
        ],
      ),
    );
  }
}
