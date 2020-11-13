
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>{

  var _formKey=GlobalKey<FormState>();
  List<String> _currencies=["Rupees","Dollar","Euro","Others"];
  var _currentItemSelected;
  String _displayResult='';

  @override
  void initState(){
    super.initState();
    _currentItemSelected=_currencies[0];
  }

    TextEditingController _principalController =TextEditingController();
    TextEditingController _roiController =TextEditingController();
    TextEditingController _termController =TextEditingController();


  TextStyle textStyle = TextStyle(color: Colors.white,fontWeight: FontWeight.bold);
  TextStyle errorStyle = TextStyle(color: Colors.yellowAccent,fontWeight: FontWeight.bold,fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Interest Calculator"),
       centerTitle: true,),
       body: Form(
         key: _formKey,
         child: ListView(
        children: <Widget>[
          
           Image.asset("assets/tom.jpg",
           height: 200.0,
           width: 200.0,
           ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _principalController,
              validator: (String value){
                if(value.isEmpty)
                {
                return "Please enter principal amount";
                }                
              },
              decoration: InputDecoration(
                labelText: "Principal",
                labelStyle: textStyle,
                hintText: "Enter principal amount i.e. 20000",
                hintStyle: textStyle,
                errorStyle: errorStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _roiController,
              validator: (String value){
                if(value.isEmpty){
                  return "Please enter interest rate";
                }
              },
              decoration: InputDecoration(
                labelText: "Rate of Interest",
                labelStyle: textStyle,
                hintText: "In percent",
                hintStyle: textStyle,
                errorStyle: errorStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _termController,
                  validator: (String value){
                if(value.isEmpty){
                  return "Please enter term year";
                }
              },
                  decoration: InputDecoration(
                    labelText: "Term",
                    labelStyle: textStyle,
                    hintText: "In years",
                    hintStyle: textStyle,
                    errorStyle: errorStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))
                  ),
              ),
                ),

              SizedBox(width: 5.0,),

            Expanded(
                child: DropdownButton<String>(
                items: _currencies.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value)
                    );
                }).toList(),
                value: _currentItemSelected,
                onChanged: (String newValueSelected){
                  setState(() {
                    this._currentItemSelected=newValueSelected;
                  });
                },
              ),
            ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text("Calculate",style: textStyle,textScaleFactor: 1.5,),
                    onPressed: (){
                      setState(() {
                        if(_formKey.currentState.validate())
                        {
                          this._displayResult = _calculateTotalAmount();
                        }
                        
                      });
                    } )),

                    SizedBox(width: 10.0,),

                    Expanded(
                  child: RaisedButton(
                    color: Colors.grey,
                    child: Text("Reset",style: textStyle,textScaleFactor: 1.5,),
                    onPressed: (){
                      setState(() {
                        _reset();
                        });
                    } )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(this._displayResult,style: textStyle,textScaleFactor: 1.5,),
          ),
         ],),
       ),
    );
  }
  String _calculateTotalAmount(){
    double principal=double.parse(_principalController.text);
    double roi=double.parse(_roiController.text);
    double term=double.parse(_termController.text);

    double _totalMoney =principal +principal*roi*term/100;

    String result="After $term year, your investment will be worth of $_totalMoney $_currentItemSelected";
    return result;

  }
  void _reset(){
    _principalController.text='';
    _roiController.text='';
    _termController.text='';
    _displayResult='';
    _currentItemSelected=_currencies[0];
  }
}