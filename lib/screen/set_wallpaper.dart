
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper.dart';

class Set_walpaper_Android extends StatefulWidget {
  String url;
  Set_walpaper_Android({required this.url, super.key});

  @override
  State<Set_walpaper_Android> createState() => _Set_walpaper_AndroidState();
}

class _Set_walpaper_AndroidState extends State<Set_walpaper_Android> {

bool loading = true;
  SetWallpaper(String walpaper,String wal){
    var procesdownload = Wallpaper.imageDownloadProgress(widget.url);
        procesdownload.listen((event) {
          //loading =false;
          },onDone: (){
          loading =false;
            if(wal=="lock"){
              setLockWal();
            }else if(wal == "home"){
              setHomeWal();
            }else{
              setBothWal();
            }
            setState(() {

            });


          },onError: (error){
          print(error);
          });
  }
  setHomeWal() async{
    await Wallpaper.homeScreen(
      options: RequestSizeOptions.RESIZE_FIT,
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Walpaper Set your Lock Screen Properly",style: TextStyle(fontSize: 25,color: Colors.yellow),))));
   // print(data);
  }
  setLockWal() async{
    await Wallpaper.lockScreen();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Walpaper Set your Home Screen Properly")));
    // print(data);
  }
  setBothWal() async{
    await Wallpaper.bothScreen();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Walpaper Set your both Lock Screen and Home Screen")));

    // print(data);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: loading?Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(widget.url,fit: BoxFit.fitWidth,),
          ),
          Positioned(
            bottom: 10,
              height: 100,

              width: MediaQuery.of(context).size.width*1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 ElevatedButton(onPressed: (){
                    //print(widget.url);
                    SetWallpaper(widget.url,"lock");

                  }, child: Text("Set Lock Screen")),
                  ElevatedButton(onPressed: (){
                   // print(widget.url);
                    SetWallpaper(widget.url,"home");

                  }, child: Text("Set Home Screen")),
                  ElevatedButton(onPressed: (){
                    SetWallpaper(widget.url,"both");},
                      child: Text("Set Both")),

                ],
              ))
        ],
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
