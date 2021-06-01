import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:salha_mobile_femme/constants.dart';


class AjoutProd extends StatefulWidget {
  @override
  _AjoutProdState createState() => _AjoutProdState();
}

class _AjoutProdState extends State<AjoutProd> {
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      color: bacgroundV,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<FormState> _globalFormKey = new GlobalKey<FormState>();
  String dropdownvalue = 'oeuf';
  var items =  ['oeuf','poulet'];
  String dropdownvalueNB = '1';
  var itemsNB =  ['1','2','3','4','5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: SingleChildScrollView(
            child:Column(
                children: <Widget>[
                  Form(
                      key: _globalFormKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height:150),
                            TextFormField(
                              onSaved: (input) =>  input,
                              keyboardType: TextInputType.emailAddress,
                              validator: (input){
                                if(input.isEmpty)
                                  return 'Remplir  email ';
                                if(input.indexOf('@')<0 )
                                  return 'email contient @';
                                if(input.indexOf('.com')<0 )
                                  return 'email contient .com';
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  //labelText: 'mot de passe' ,
                                  //  labelStyle: TextStyle(color:(Colors.white)),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  hintText:'Email', hintStyle:TextStyle(color:Colors.white,)),
                              style:TextStyle(color:Colors.white),
                              obscureText: false,
                            ),

                            SizedBox(height:10),
                            TextFormField(
                              onSaved: (input) => input,
                              keyboardType: TextInputType.text,
                              validator: (value){
                                if(value.isEmpty)
                                  return 'Remplir  mot de passe ';
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_open,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                    color:Colors.black,
                                    icon: Icon(Icons.visibility),
                                  ),
                                  hintText:'**********', hintStyle:TextStyle(color:Colors.white,)
                              ),
                              style:TextStyle(color:Colors.white),


                            ),
                            SizedBox(height: 10,),

                            DropdownButton(
                              value: dropdownvalue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items:items.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(items)
                                );
                              }
                              ).toList(),
                              onChanged: (String newValue){
                                setState(() {
                                  dropdownvalue = newValue;
                                });
                              },
                            ),


                            SizedBox(height: 10,),
                            DropdownButton(
                              value: dropdownvalueNB,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items:itemsNB.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(items)
                                );
                              }
                              ).toList(),
                              onChanged: (String newValue){
                                setState(() {
                                  dropdownvalue = newValue;
                                });
                              },
                            ),
                          ],),

                      )
                  ),]))
    );
    /*,
    Scaffold(
      appBar: AppBar(
        title: Text("DropDownList Example"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items:items.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Text(items)
                  );
                }
                ).toList(),
                onChanged: (String newValue){
                  setState(() {
                    dropdownvalue = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
    */
  }
}

/*
      Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Formfield Example'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'My workout',

                  hintText: 'Please choose one',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Running",
                      "value": "Running",
                    },
                    {
                      "display": "Climbing",
                      "value": "Climbing",
                    },
                    {
                      "display": "Walking",
                      "value": "Walking",
                    },
                    {
                      "display": "Swimming",
                      "value": "Swimming",
                    },
                    {
                      "display": "Soccer Practice",
                      "value": "Soccer Practice",
                    },
                    {
                      "display": "Baseball Practice",
                      "value": "Baseball Practice",
                    },
                    {
                      "display": "Football Practice",
                      "value": "Football Practice",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivityResult),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/
