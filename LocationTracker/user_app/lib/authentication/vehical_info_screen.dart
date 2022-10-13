import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_app/splashScreen/splash_screen.dart';

import '../global/global.dart';

class VehicleInfoScreen extends StatefulWidget
{

  @override
  State<VehicleInfoScreen> createState() => _VehicleInfoScreenState();
}

class _VehicleInfoScreenState extends State<VehicleInfoScreen> {

  TextEditingController vehicleNumberTextEditingController = TextEditingController();
  TextEditingController vehicleIdTextEditingController = TextEditingController();

  String vehicleIdText = "";
  

  saveVehicleInfo()
  {
    if(accessRequest(vehicleIdText.toString().trim()))
      {
        Map userVehicleInfoMap =
        {
          "vehicle_number": vehicleNumberTextEditingController.toString().trim(),
          //"vehicle_id": vehicleIdTextEditingController.toString().trim(),
        };

        DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");
        usersRef.child(currentFirebaseUser!.uid).child("vehicle_detail").child(vehicleIdText.toString().trim()).set(userVehicleInfoMap);

        Fluttertoast.showToast(msg: "Vehicle added.");
        Navigator.push(context, MaterialPageRoute(builder: (c) => const MySplashScreen()));


      }
    else
    {
      Fluttertoast.showToast(msg: "Request rejected");
      Navigator.push(context, MaterialPageRoute(builder: (c) => VehicleInfoScreen()));
    }

  }

  
  
  accessRequest(String firebaseVehicleId)
  {

    //todo

    return true;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [

              const SizedBox(height: 24,),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("images/img.png"),
              ),

              const SizedBox(height: 10,),

              const Text(
                "Vehicle Details",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextField(
                controller: vehicleNumberTextEditingController,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: "Vehicle Number",
                  hintText: "Vehicle Number",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),

              TextField(
                controller: vehicleIdTextEditingController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: "Vehicle ID",
                  hintText: "Vehicle ID",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    vehicleIdText = text;
                  });
                },
              ),

              const SizedBox(height: 24,),

              ElevatedButton(
                onPressed: ()
                {
                  if(vehicleNumberTextEditingController.text.isNotEmpty
                  && vehicleIdText.toString().isNotEmpty)
                    {
                      saveVehicleInfo();
                    }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent
                ),
                child: const Text(
                  "Connect",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
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
