
import 'package:flutter/material.dart';
import 'package:wall_paper/model/image_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_paper/screen/set_wallpaper.dart';

import '../walpaper_block/walpaper_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late WalpaperModel  walpaper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //walpaper =getWallpaper("horse");
    BlocProvider.of<WalpaperBloc>(context).add(getWallpaper("horse"));

  }
  TextEditingController search_controler =TextEditingController();
//bool ismobile =false;
  @override
  Widget build(BuildContext context) {
    // if(Platform.isAndroid || Platform.isIOS){
    //   ismobile =true;
    // }else{
    //   ismobile =false;
    // }
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.menu),
          // actions: [
          //   Center(
          //     child: Text("Walpaper"),
          //   )
          // ],
          title: Row(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width*0.6,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.red,width: 5)
                ),
                child: TextField(
                  controller: search_controler,

                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15),
                      hintText: "Search Wallpaper Image"
                  ),
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                  onTap: (){
                    BlocProvider.of<WalpaperBloc>(context).add(getWallpaper(search_controler.text.toString()??"horse"));
                    setState(() {

                    });
                  },
                  child: Icon(Icons.search,weight: 20,size: 30,))
            ],
          )
      ),
      body: BlocBuilder<WalpaperBloc,WalpaperState>(
          builder: (context,state){
            if(state is Walloading){
              return CircularProgressIndicator();
            }else if(state is Walloaded){
              walpaper = state.walpaperlist;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0
                  ),
                  itemCount: walpaper.photos!.length,
                  itemBuilder: (context,index){
                    return InkWell(
                        onTap: (){
                          print(walpaper.photos![index].src!.small.toString());
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Set_walpaper_Android(url:"${walpaper.photos![index].src!.original}")));
                        },
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.network("${walpaper.photos![index].src!.medium}",fit: BoxFit.fitWidth,)));
                  });
            }else if(state is Walerror){
              var st = state.error;
              return Text(st);
            }else{
              return Text("No Data");
            }

          }),
    );

  }
}