import 'package:flutter/material.dart';
import 'package:lol_api/champions.dart' as chmp;

class ChampionDetails extends StatelessWidget {
  const ChampionDetails({Key? key, required this.champion}) : super(key: key);

  final chmp.Champion champion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(champion.name),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(child: Text('Version: ${champion.version}')),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Column(children: [
            Hero(
              tag: champion.name,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.image.full.replaceAll('.png', '')}_0.jpg"),
                      fit: BoxFit.cover),
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text('Name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(champion.name), Text(champion.title)],
              ),
            ),
            ListTile(
              title: const Text('Blurb',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              subtitle: Text(champion.blurb),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Champion Details',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Attack'),
                    subtitle: Text(champion.info.attack.toString()),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Defense'),
                    subtitle: Text(champion.info.defense.toString()),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Magic'),
                    subtitle: Text(champion.info.magic.toString()),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Difficult'),
                    subtitle: Text(champion.info.difficulty.toString()),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //for(var i in champion.tags) Text(i.toString(),style: TextStyle(fontSize: 20));
                for (var i in champion.tags) championType(i.toString()),



              ],
            )

          ]),
        ),
      ),
    );
  }
}

Widget championType(String tag){
  return Column(
    children: [
      Text(tag,style: const TextStyle(fontSize: 20)),
      Image.asset('roles/${tag.toLowerCase()}.png',width: 150,color: Colors.white,),
    ],
  );
}