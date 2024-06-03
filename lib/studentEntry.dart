import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teachersapp/Login.dart';

class StudentEntryPage extends StatefulWidget {
  final String username;
  const StudentEntryPage({
    super.key,
    required this.username,
  });

  @override
  State<StudentEntryPage> createState() => _StudentEntryPageState();
}

class _StudentEntryPageState extends State<StudentEntryPage> {
  void clearData() {
    nameController.clear();
    _dateController.clear();
  }

  void saveData() {
    String name = nameController.text.trim();
    String dob = _dateController.text.trim();
    String? genda = value;

    nameController.clear();
    _dateController.clear();

    if (name != "" && dob != "" && genda != "") {
      Map<String, dynamic> userData = {
        "Name": name,
        "DOB": dob,
        "Gender": genda
      };
      FirebaseFirestore.instance.collection(widget.username).add(userData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('New student details saved'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the details'),
        ),
      );
    }
  }

  final gender = ["Male", "Female"];
  String? value;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(),
        ),
      );

  TextEditingController _dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
    );
    if (_picked != null) {
      setState(
        () {
          _dateController.text = _picked.toString().split(" ")[0];
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => signOut(),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Student entry form:',
                  style: GoogleFonts.dmSerifText(
                      fontSize: 25, color: Colors.black),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Enter the name ',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: 'Full Name (Required)',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Date of Birth',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    hintText: 'YYYY-MM-DD (Required)',
                    hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: Colors.grey[700],
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Select Gender",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                DropdownButton<String>(
                  hint: Text(
                    'Select',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  value: value,
                  iconSize: 36,
                  icon:
                      Icon(Icons.arrow_drop_down, color: Colors.grey.shade700),
                  items: gender.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() => this.value = value),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    saveData();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    clearData();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Clear all',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
