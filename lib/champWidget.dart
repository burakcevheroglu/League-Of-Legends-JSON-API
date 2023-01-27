import 'package:flutter/material.dart';
import 'package:lol_api/championDetails.dart';
import 'package:lol_api/champions.dart' as chmp;

class ChampionWidget extends StatelessWidget {
  const ChampionWidget({Key? key, required this.champion}) : super(key: key);

  final chmp.Champion champion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChampionDetails(champion: champion)));
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: BoxDecoration(
            image:  DecorationImage(
                image: NetworkImage(
                    "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.image.full.replaceAll('.png', '')}_0.jpg"),
                fit: BoxFit.cover),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0, 5.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Hero(tag: champion.name, child: Image.network("http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.image.full.replaceAll('.png', '')}_0.jpg",width: double.infinity,fit: BoxFit.cover,)),
              Center(
                child: Text(
                  champion.name,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Positioned.fill(
                child: Opacity(
                  opacity: 0.2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF000000),
                    ),
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
