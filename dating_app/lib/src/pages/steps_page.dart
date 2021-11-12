import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class StepsPage extends StatefulWidget {
  const StepsPage({Key? key}) : super(key: key);

  @override
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {

  int _currentStep = 0;
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ABOUT YOURSELF", style: TextStyle(color: PrimaryColor, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(primary: PrimaryColor)),
        child: Stepper(
          type: StepperType.vertical,
          steps: getSteps(),
          currentStep: _currentStep,
          onStepContinue: () {
            setState(() {
              final isLastStep = _currentStep == getSteps().length -1;
              if (isLastStep) {
                print("Completed");
                isCompleted = true;
                // send data to sever
              }
              else {
                _currentStep += 1;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              _currentStep == 0? null : _currentStep -= 1;
            });
          },
          onStepTapped: (step) => setState(() => _currentStep = step),
          controlsBuilder: (context, {onStepContinue, onStepCancel}) {
            final isLastStep = _currentStep == getSteps().length -1;
            return Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(child: RaisedButton(
                    child: Text( isLastStep? "Confirm" : "Next",
                    style: TextStyle(color: Colors.white),),
                    onPressed: onStepContinue,
                    color: PrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                  )),
                  if (_currentStep != 0)
                    SizedBox(width: 12,),
                  if (_currentStep != 0)
                    Expanded(child: RaisedButton(
                      child: Text("Back", style: TextStyle(color: Colors.white),),
                      onPressed: onStepCancel,
                      color: PrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                    )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Step> getSteps() =>[
    Step(
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: _currentStep >= 0,
      title: Text("Name"),
      content: _nameStep()
    ),
    Step(
      state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: _currentStep >= 1,
      title: Text("Birthday"),
      content: _birthdayStep()
    ),
    Step(
      state: _currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: _currentStep >= 2,
      title: Text("Gender"),
      content: Container()
    ),
    Step(
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 3,
        title: Text("Location"),
        content: Container()
    ),
    Step(
        state: _currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 4,
        title: Text("About yourself"),
        content: Container()
    ),
  ];

  _nameStep() => Container(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(142, 142, 147, 1.2),
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Center(
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(142, 142, 147, 1.2),
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Center(
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
              ),
            ),
          ),
        ),
      ],
    ),
  );

  _birthdayStep() => Container(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(142, 142, 147, 1.2),
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Center(
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Your birthday',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
              ),
            ),
          ),
        ),
        ElevatedButton(
          child: Text(
              "Show"
          ),
          onPressed:() async {
            final DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2010,1),
              lastDate: DateTime(2022,1),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData(
                    primarySwatch: Colors.pink,
                    primaryColor: PrimaryColor,
                    accentColor: PrimaryColor,
                    backgroundColor: PrimaryColor,

                  ),
                  child: child!,
                );
              }
            );
          },
        ),
      ],
    ),
  );



}
