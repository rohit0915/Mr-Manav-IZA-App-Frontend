import 'package:flutter/material.dart';

class BrandScreen extends StatefulWidget {
  @override
  _BrandScreenState createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> allBrands = [
    "Anastasia Beverly Hills",
    "Benefit Cosmetics",
    "Bobbi Brown",
    "Chanel",
    "Clinique",
    "Dior",
    "Estee Lauder",
    "Fenty Beauty",
    "Glossier",
    "Huda Beauty",
    "Kiehl's",
    "L'Oréal",
    "Lancome",
    "MAC",
    "Maybelline",
    "Milani",
    "NARS",
    "NYX",
    "Olay",
    "Revlon",
    "Sephora",
    "Shiseido",
    "The Body Shop",
    "Too Faced",
    "Urban Decay",
    "Wet n Wild",
    "Yves Saint Laurent",
  ]; // Full list of beauty brands

  List<String> filteredBrands = []; // Filtered list to display
  String selectedLetter = ""; // Selected alphabet letter

  @override
  void initState() {
    super.initState();
    filteredBrands = allBrands; // Initially show all brands
  }

  void _filterBrands(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredBrands = allBrands;
      } else {
        filteredBrands = allBrands
            .where((brand) => brand.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _filterByLetter(String letter) {
    setState(() {
      selectedLetter = letter;
      filteredBrands =
          allBrands.where((brand) => brand.startsWith(letter)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brands"),
        // backgroundColor: Colors.pink,
      ),
      body: Row(
        children: [
          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterBrands,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search brands...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),

                // Filtered Brands List
                Expanded(
                  child: filteredBrands.isNotEmpty
                      ? ListView.builder(
                          itemCount: filteredBrands.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(filteredBrands[index]),
                              onTap: () {
                                // Navigate to brand details or any action
                                print("Selected: ${filteredBrands[index]}");
                              },
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "No brands found",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.grey),
                          ),
                        ),
                ),
              ],
            ),
          ),

          // Alphabet Scroller
          Container(
            width: 40.0,
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: 26,
              itemBuilder: (context, index) {
                String letter = String.fromCharCode(65 + index); // A-Z
                return GestureDetector(
                  onTap: () => _filterByLetter(letter),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      letter,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: selectedLetter == letter
                            ? Colors.pink
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
