import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final List message;

  const CardView({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(

        child: Container(
          
          height: 100,
          width: 350,
          alignment: Alignment.center,
          decoration:BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  message[1],
                  style: TextStyle(fontSize: 10, color:Theme.of(context).primaryColor),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                Flexible(
                  flex: 2,
                  child: Text(
                    message[0],
                    //maxLines: 2,
                    style:TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
