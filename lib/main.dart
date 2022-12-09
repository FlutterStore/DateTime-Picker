import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Datetimepicker(),
    );
  }
}

class Datetimepicker extends StatefulWidget {
  const Datetimepicker({super.key});

  @override
  State<Datetimepicker> createState() => _DatetimepickerState();
}

class _DatetimepickerState extends State<Datetimepicker> {

  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("Datetime Picker",style: TextStyle(fontSize: 15),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          onSurface: Colors.green,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) 
                {
                  String formattedDate = DateFormat('dd MMM, yyyy').format(pickedDate);
                  date.text =formattedDate;
                } 
                else {}
              },
              child: const Text("Select Date",style: TextStyle(color: Colors.white),)
              ),
              const SizedBox(height: 15,),
              SizedBox(
                height: 50,
                child: TextField(
                  autocorrect: false,
                  enableSuggestions: false,
                  controller: date,
                  cursorColor: Colors.black,
                  enabled: false,
                  style: const TextStyle(fontSize: 13,height: 1,color: Colors.green),
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 18,right: 18,),
                      child: Icon(Icons.date_range_rounded,color: Colors.green,),
                    ),
                    labelText: 'Date',
                    labelStyle: TextStyle(fontSize: 13,color: Colors.grey.withOpacity(.8)),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}