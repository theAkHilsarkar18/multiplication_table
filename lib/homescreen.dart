import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

TextEditingController txtInput = TextEditingController();
List<int> tableAns = [];
int inputNumber = 1;
bool check = true;
var formkey = GlobalKey<FormState>();

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          elevation: 0,
          title: Text("Table App", style: TextStyle(letterSpacing: 2)),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    tableAns.clear();
                  });
                },
                icon: Icon(Icons.refresh)),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTapOutside: (event) => false,
                    keyboardType: TextInputType.number,
                    controller: txtInput,
                    validator: (value) {
                      if (inputNumber < 0 || check == false) {
                        return "enter valid number !";
                      } else {
                        null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Table no.",
                         labelStyle: TextStyle( color: Colors.cyan),
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan,width: 2)
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Colors.cyan),
                        ),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan,width: 1)),
                        border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.cyan),
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tableAns.clear();
                        inputNumber = int.parse(txtInput.text);
                        formkey.currentState!.validate();
                        for (int i = 1; i <= 10; i++) {
                          tableAns.add(i);
                        }
                        print(inputNumber);
                        formkey.currentState!.deactivate();
                      });
                    },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.cyan)),
                    child: Text("Submit"),),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                      margin:  EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.cyan.shade700,width: 2),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.cyan.shade200,
                      ),
                      alignment: Alignment.center,
                      child: Center(
                        child: ListView.builder(

                          itemBuilder: (context, index) => Center(
                            child: Text(
                                "${inputNumber} * ${index + 1} = ${inputNumber * (index + 1)}",style: TextStyle(fontSize: 30)),
                          ),
                          itemCount: tableAns.length,
                          shrinkWrap: true,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
