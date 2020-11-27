import 'package:fisheller_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PaymentSelectionPopUp extends StatefulWidget{
  String currentSelected;
  PaymentSelectionPopUpState state;

  PaymentSelectionPopUp(this.currentSelected);

  @override
  PaymentSelectionPopUpState createState() => (state= PaymentSelectionPopUpState(currentSelected));

  PaymentSelectionPopUpState getState(){
    return state;
  }
}

class PaymentSelectionPopUpState extends State<PaymentSelectionPopUp>{
  String currentSelected;

  List<PaymentMethod> methods = [
    PaymentMethod('PayPal','assets/icons/payPal.png'),
    PaymentMethod('Card Payment','assets/icons/creditCard.png'),
    PaymentMethod('MbWay','assets/icons/MBWay.png')
  ];

  PaymentSelectionPopUpState(this.currentSelected);



  Widget _getListItemTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(!methods[index].isSelected){
            for(PaymentMethod m in methods){
              m.isSelected = false;
            }
            methods[index].isSelected = true;
            currentSelected = methods[index].data;
          }
        });
      },

      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(methods[index].icon, width: 50, color: methods[index].isSelected ? null :Colors.black12),
              SizedBox(width: 5),
              Text(
                  methods[index].data,
                  style: TextStyle(
                      color: methods[index].isSelected ?
                      PRIMARY_COLOUR : Colors.black,
                      fontWeight: methods[index].isSelected ?
                      FontWeight.w600: FontWeight.normal
                  )
              ),

            ]
          )
        ),
      ),
    );
  }

  @override
  void initState() {
      super.initState();
      for(PaymentMethod m in methods){
        if(m.data == currentSelected){
          m.isSelected = true;
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
          height:260,
          width: 600,
          child:Stack(
              children: <Widget>[

                Scaffold(
                  backgroundColor: Colors.white,
                  body: Stack(
                    children: <Widget>[
                      Text('Select Payment Method:', style:TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child:ListView.builder(
                          itemCount: methods.length,
                          itemBuilder: _getListItemTile,
                        ),
                      ),
                    Padding(
                        padding: EdgeInsets.only(left: 170, top: 230.0),
                        child:
                        FlatButton(
                          color: PRIMARY_COLOUR,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Text('Done', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Colors.white)),
                          onPressed: ((){
                            Navigator.pop(context);

                        }),
                      ))
                    ]
                  )
                )
              ]
          )
        )
    );
  }
}

class PaymentMethod{
  bool isSelected = false; //Selection property to highlight or not
  String data;
  String icon;//Data of the user
  PaymentMethod(this.data, this.icon);
}

class PaymentMethodButton extends StatefulWidget{

  String currentPaymentMethod;

  PaymentMethodButton(this.currentPaymentMethod);



  @override
  State<StatefulWidget> createState() =>
      PaymentMethodButtonState(currentPaymentMethod);
  
}

class PaymentMethodButtonState extends State<PaymentMethodButton>{
  String currentPaymentMethod;
  PaymentSelectionPopUp pay;

  PaymentMethodButtonState(this.currentPaymentMethod );

  @override
  Widget build(BuildContext context) {

    pay = PaymentSelectionPopUp(currentPaymentMethod);

    return FlatButton(
      minWidth: 100,
      child: Text(currentPaymentMethod, style: TextStyle(fontSize: 13, color: PRIMARY_COLOUR)),
      onPressed: ((){
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return pay;
            }).whenComplete((){
              setState(() {
                currentPaymentMethod = pay.getState().currentSelected;
                pay = PaymentSelectionPopUp(currentPaymentMethod);
              });
        });
      }),
    );
  }

}