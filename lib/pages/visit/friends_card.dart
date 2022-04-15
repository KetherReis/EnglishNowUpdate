import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../db/database_manager.dart';
class ProductCard extends StatefulWidget {
  const ProductCard({ Key? key }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = new CarouselController();

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        _products = resultant;
      });
    }
  }
  List _products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedIndex.length > 0 ? FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.person_add),
        backgroundColor: Colors.green,
      ): null,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        title:
        Text('Próximo de Você',
          style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w400,
        ),),
        actions: [Text(''),
          Container(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: false,
              value: _selectedDistance,
              onChanged: (String? value) {
                setState(() {
                  _selectedDistance = value ?? "";
                });
              },
              items: _dropDownDistance,
            ),
          ),
        )],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
          alignment: Alignment(0.00, -1.00),
        child: CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 550.0,
            aspectRatio: 16/9,
            viewportFraction: 0.70,
            enlargeCenterPage: true,
            pageSnapping: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }
          ),
          items: _products.map((movie) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedIndex == movie) {
                        _selectedIndex = {};
                      } else {
                        _selectedIndex = movie;
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: _selectedIndex == movie ? Border.all(color: Colors.green.shade500, width: 3) : null,
                      boxShadow: _selectedIndex == movie ? [
                        BoxShadow(
                          color: Colors.blue.shade100,
                          blurRadius: 30,
                          offset: Offset(0, 10)
                        )
                      ] : [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 20,
                          offset: Offset(0, 5)
                        )
                      ]
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 320,
                            //margin: EdgeInsets.only(top: 10),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(movie['url'], fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20,),
                          Text(movie['name'],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                          Image.network(movie['rating'], width: 150,),
                          Text(movie['description'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600
                          ),),
                          SizedBox(height: 20,),
                          Text(movie['experience'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent
                          ),),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList()
        ),
      ),
    );
  }
  late List<DropdownMenuItem<String>> _dropDownDistance;
  var _selectedDistance = 'Distance: 10km';
  var _distanceItems = <String>[
    'Distance: 10km',
    'Distance: 20km',
    'Distance: 30km',
    'Distance: 40km'
  ];
  _initDropDowns() {

    _dropDownDistance = _distanceItems
        .map((String value) => DropdownMenuItem<String>(
      value: value,
         child: Text(value),
    ))
        .toList();
  }
  @override
  void initState() {
    super.initState();
    _initDropDowns();
  }
}