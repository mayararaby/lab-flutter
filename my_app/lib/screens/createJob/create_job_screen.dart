import 'package:flutter/material.dart';
import 'package:iti_aswan_tutorial/data/users_service.dart';
// import 'package:iti_aswan_tutorial/services/services_handler.dart';

class CreateJobScreen extends StatefulWidget {
  @override
  _CreateJobScreenState createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  var nameController = TextEditingController();
  var jobController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  dynamic _postUser(body) async {
    return UserServices().postUser(body);
  }
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Job',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if(value.isEmpty) return 'Name must not be empty';
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        prefix: Icon(
                          Icons.person,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: jobController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if(value.isEmpty) return 'Job must not be empty';
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Job',

                        prefix: Icon(
                          Icons.work,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          3.0,
                        ),
                        color: Colors.blue,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if(formKey.currentState.validate()) {
                            // todo implement post request to api
                            dynamic body = {
                              'name': nameController.text,
                              'job': jobController.text,
                            };
                            print(_postUser(body));
                          }
                        },
                        height: 40.0,
                        child: Text(
                          "create job".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
