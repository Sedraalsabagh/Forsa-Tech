import 'package:flutter/material.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  final List<String> allLanguages = [
    'French',
    'Arabic',
    'Persian',
    'Spanish',
    'English',
    'German',
    'Chinese',
    'Turkish',
    'Russian',
  ];

  Map<String, int> selectedLanguages = {}; // language: level (1 to 5)

  void _openLanguagePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        TextEditingController searchController = TextEditingController();
        List<String> filteredLanguages = List.from(allLanguages);

        return StatefulBuilder(builder: (context, setModalState) {
          void _filterLanguages(String query) {
            setModalState(() {
              filteredLanguages = allLanguages
                  .where((lang) =>
                      lang.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            });
          }

          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              top: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Choose your languages",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: searchController,
                  onChanged: _filterLanguages,
                  decoration: InputDecoration(
                    hintText: "Search here",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 12),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredLanguages.length,
                    itemBuilder: (context, index) {
                      final lang = filteredLanguages[index];
                      final isSelected = selectedLanguages.containsKey(lang);
                      return ListTile(
                        title: Text(lang),
                        trailing: isSelected
                            ? Icon(Icons.check_circle, color: Colors.blue)
                            : Icon(Icons.circle_outlined),
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedLanguages.remove(lang);
                            } else {
                              selectedLanguages[lang] = 3; // default level
                            }
                          });
                          setModalState(() {}); // refresh inside bottom sheet
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Widget _buildStarRating(String lang) {
    final level = selectedLanguages[lang] ?? 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            Icons.star,
            color: index < level ? Colors.amber : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              selectedLanguages[lang] = index + 1;
            });
          },
        );
      }),
    );
  }

  Widget _buildSelectedLanguages() {
    if (selectedLanguages.isEmpty) {
      return Center(child: Text("No languages selected."));
    }
    return Column(
      children: selectedLanguages.entries.map((entry) {
        final lang = entry.key;
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(lang),
            subtitle: _buildStarRating(lang),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  selectedLanguages.remove(lang);
                });
              },
            ),
          ),
        );
      }).toList(),
    );
  }

  void _saveLanguages() {
    print("Saved languages:");
    selectedLanguages.forEach((lang, level) {
      print("$lang: $level stars");
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Languages saved successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Languages"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Color(0xFFF5F7FA),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Adding all languages will increase your chances to get the best job",
              style: TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _openLanguagePicker,
              icon: Icon(Icons.add),
              label: Text("Add Languages"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: _buildSelectedLanguages()),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveLanguages,
              child: Text("Save"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
