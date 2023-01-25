import 'package:flutter/material.dart';

class Classwork extends StatelessWidget {
  const Classwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        thickness: 8,
        radius: Radius.circular(30),
        child: ListView.separated(
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: index%2==0 ? AssetImage('assets/images/bookwallpaper.jpg'):AssetImage('assets/images/bookwallpaper2.jpg'),
                      // image: AssetImage('assets/images/bookwallpaper.jpg'),
                      fit:BoxFit.cover
                    ),
                    color: Colors.lightBlueAccent[100],
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              );
            },
            // separatorBuilder: (context,index){
            //   return Divider(
            //     height: 0,
            //     thickness: 1,
            //   );
            // },
            separatorBuilder: (context,index){return SizedBox(height: 0,);},
            itemCount: 6
        ),
      ),
    );
  }
}
