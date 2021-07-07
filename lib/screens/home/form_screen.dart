import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_aswan_tutorial/models/user.dart';
import 'package:http/http.dart' as http;

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

Future<DataModel> submitData (String name,job) async {
  var response = await http.post(Uri.https('reqres.in', 'api/users'),
      body: {"name":name,"job":job});
  var data = response.body;
  print(data);
  if(response.statusCode == 200|| response.statusCode == 201){
    String responseString = response.body;
    dataModelFromJson(responseString);
  }
  else return null;
}

class _FormScreenState extends State<FormScreen> {

  DataModel _dataModel;
  var nameController = TextEditingController();

  var jobController = TextEditingController();

  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType:TextInputType.name,



                    validator: (value)
                    {
                      if(value.isEmpty){
                        return 'name must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(
                        Icons.drive_file_rename_outline,
                      ),

                      border:OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: jobController,
                    keyboardType:TextInputType.multiline,
                    validator: (value)
                    {
                      if(value.isEmpty){
                        return 'job must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Job',
                      prefixIcon: Icon(
                        Icons.account_circle,
                      ),

                      border:OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(onPressed: () async
                  {
                    String name = nameController.text;
                    String job = jobController.text;
                    DataModel data = await submitData(name, job);

                    setState(() {
                      _dataModel  =data;
                    });
                    if(formKey.currentState.validate()){

                    }

                  }
                  , child: Text('Submit')),




                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
