import 'package:flutter/material.dart';
import 'sql_helper.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Data',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _bmiController = TextEditingController();

  // Function Caculate BMI
  double _calculateBMI(int weight, int height) {
    double heightInMeters = height / 100.0;
    return weight / (heightInMeters * heightInMeters);
  }

  void _showForm(int? id) async {
    if (id != null) {
      final exitingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _nameController.text = exitingJournal['name'];
      _weightController.text = exitingJournal['weight'].toString();
      _heightController.text = exitingJournal['height'].toString();
      double bmi = _calculateBMI(
        exitingJournal['weight'],
        exitingJournal['height'],
      );
      _bmiController.text = bmi.toStringAsFixed(2);
    }
    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _weightController,
              decoration: const InputDecoration(hintText: 'Weight'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _heightController,
              decoration: const InputDecoration(hintText: 'Height'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _bmiController,
              decoration: const InputDecoration(hintText: 'BMI'),
              enabled: false,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _addItem();
                } else {
                  await _updateItem(id);
                }
                _clearTextFields();
                Navigator.of(context).pop();
              },
              child: Text(id == null ? 'Create New' : 'Update'),
            )
          ],
        ),
      ),
    );
  }

  void _clearTextFields() {
    _nameController.clear();
    _weightController.clear();
    _heightController.clear();
    _bmiController.clear();
  }

  Future<void> _addItem() async {
    int weight = int.tryParse(_weightController.text) ?? 0;
    int height = int.tryParse(_heightController.text) ?? 0;
    double bmi = _calculateBMI(weight, height);
    await SQLHelper.createItem(
      _nameController.text,
      weight,
      height,
      bmi,
    );
    _refreshJournals();
  }

  Future<void> _updateItem(int id) async {
    int weight = int.tryParse(_weightController.text) ?? 0;
    int height = int.tryParse(_heightController.text) ?? 0;
    double bmi = _calculateBMI(weight, height);
    await SQLHelper.updateItem(
      id,
      _nameController.text,
      weight,
      height,
      bmi,
    );
    _refreshJournals();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Data'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                color: Colors.orange[200],
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(_journals[index]['name']),
                  subtitle: Text(
                      'Weight: ${_journals[index]['weight']} kg | Height: ${_journals[index]['height']} cm  BMI: ${_journals[index]['bmi'].toStringAsFixed(2)}'),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showForm(_journals[index]['id']),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteItem(_journals[index]['id']),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
