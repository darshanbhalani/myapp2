import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ShowProfiles extends StatefulWidget {
  const ShowProfiles({Key? key}) : super(key: key);

  @override
  State<ShowProfiles> createState() => _ShowProfilesState();
}

class _ShowProfilesState extends State<ShowProfiles> {

  int _current=0;
  List imgList =[
    "https://i.pinimg.com/736x/92/be/4e/92be4e0e6e2de50500d2da4b0ce55eaf.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSls9J90A9Hs7PuWOdwaH1MSFwf9B9TFFswM4CV3fxdpX-ea70jKENR4PVR4DpZpE-7d7Q&usqp=CAU",
    "https://img.freepik.com/free-vector/night-ocean-landscape-full-moon-stars-shine_107791-7397.jpg?w=2000",
    "https://cdn.pixabay.com/photo/2020/04/10/11/54/nature-5025462__340.jpg",
    "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg",
    "https://i.pinimg.com/736x/a3/1d/ff/a31dff627b8a9664a865ea105d4f4ab0.jpg",
    "https://t3.ftcdn.net/jpg/05/27/44/52/360_F_527445207_LfBZ3V7U0Azb2SA81zyoGeR6WGXG9CNn.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3vhLCl8RsrAMzjqJrwcAYBK1RSg0NWBGjx9Lbec_JEI30Dr4TnJCeqt5VLp0AzfSx_EQ&usqp=CAU",
    "https://i.pinimg.com/736x/98/07/fa/9807fa0eca0ddb4d64589a8d7fe5bab6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profiles"),
      ),
      // body:Container(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children:<Widget> [
      //       CarouselSlider(
      //           items: imgList.map((imagUrl){
      //             return Builder(
      //                 builder: (BuildContext context){
      //                   return Container(
      //                     width: MediaQuery.of(context).size.width,
      //                     margin: EdgeInsets.symmetric(horizontal: 10),
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(20),
      //                       color: Colors.green,
      //                       image: DecorationImage(
      //                         image: NetworkImage(imagUrl),
      //                         fit: BoxFit.fill
      //                       )
      //                     ),
      //                     // child: Image.network(imagUrl,fit: BoxFit.fill,),
      //                   );
      //                 });}).toList(),
      //           options: CarouselOptions(
      //             height: 600,
      //             initialPage: 0,
      //             // onPageChanged: (index){
      //             //   setState(() {
      //             //     _current=index;
      //             //   });
      //             // },
      //           )
      //       )
      //     ],
      //   ),
      // )

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
              items: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)
                          )
                        ),
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(radius: 30,),
                          ),
                        ),
                      )
                    ],
                  ),

                )
              ],
                options: CarouselOptions(
                        height: 600,
                        initialPage: 0,
            //             // onPageChanged: (index){
            //             //   setState(() {
            //             //     _current=index;
            //             //   });
            //             // },
            //           )
          ),
          )
        ],
      ),
    );
  }
}
