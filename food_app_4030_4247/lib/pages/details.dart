import 'package:flutter/material.dart';
import 'package:food_app_4030_4247/widget/widget_support.dart';
class Details extends StatefulWidget {
  String image, name, detail, price;
  Details(
      {required this.detail,
        required this.image,
        required this.name,
        required this.price});
  //const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  int a=1, total=0;
  String? id;

  // getthesharedpref() async {
  //   id = await SharedPreferenceHelper().getUserId();
  //   setState(() {});
  // }

  ontheload() async {
    //await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ontheload();
    total = int.parse(widget.price);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)),
              Image.network(
                widget.image,
              width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/2,fit: BoxFit.fill,),
              SizedBox(height: 15.0,),

              Row(

                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name, style: Appwidget.semiBooldTextFeildStyle(),),
                   // Text("Chickpea salad", style: Appwidget.boldTextFeildStyle(),),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    if(a>1){

                      --a;
                      total=total-int.parse(widget.price);
                    }

                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.remove, color: Colors.white,),
                  ),
                ),
                  SizedBox(width: 20.0,),
                  Text(a.toString(), style:Appwidget.semiBooldTextFeildStyle()),
                  SizedBox(width: 20.0,),
                  GestureDetector(
                    onTap: (){
                      ++a;
                      total=total+int.parse(widget.price);
                      setState(() {

                      });
                    },


                    child: Container(
                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.add, color: Colors.white,),
                    ),
                  )
              ],),
              SizedBox(height: 20.0,),
              Text(widget.detail,
              maxLines: 3,
                style: Appwidget.HeadlineTextFeildStyle(),),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Text("Delivery Time",style: Appwidget.LightTextFeildStyle(),),
                  SizedBox(height: 5.0,),
                  Icon(Icons.alarm,color: Colors.black54,),
                  SizedBox(height: 5.0,),
                  Text("30min",style: Appwidget.semiBooldTextFeildStyle(),)
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Total Price", style:Appwidget.semiBooldTextFeildStyle() ,),
                    Text("LKR" + total.toString(), style:Appwidget.boldTextFeildStyle() ,)
                  ],),
                  GestureDetector(
                    onTap:(){
                      Map<String, dynamic> addFoodtoCart = {
                        "Name": widget.name,
                        "Quantity": a.toString(),
                        "Total": total.toString(),
                        "Image": widget.image
                      };
                    } ,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(children: [
                        Text(
                          "Add to cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Poppins'),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0,),
                      ],),
                    ),
                  )
                ],),
              )
        ],
          ),
        )
    );
  }
}

