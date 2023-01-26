import 'package:flutter/material.dart';

// Variables
late Surah currentSurah;

final List<Surah> surahs = <Surah>[
  Surah("Al-Fatihah (the Opening)"),
  Surah("Al-Baqarah (the Cow)"),
  Surah("Aali Imran (the Family of Imran)"),
  Surah("An-Nisa’ (the Women)"),
  Surah("Al-Ma’idah (the Table)"),
  Surah("Al-An’am (the Cattle)"),
  Surah("Al-A’raf (the Heights)"),
  Surah("Al-Anfal (the Spoils of War)"),
  Surah("At-Taubah (the Repentance)"),
  Surah("Yunus (Yunus)"),
  Surah("Hud (Hud)"),
  Surah("Yusuf (Yusuf)"),
  Surah("Ar-Ra’d (the Thunder)"),
  Surah("Ibrahim (Ibrahim)"),
  Surah("Al-Hijr (the Rocky Tract)"),
  Surah("An-Nahl (the Bees)"),
  Surah("Al-Isra’ (the Night Journey)"),
  Surah("Al-Kahf (the Cave)"),
  Surah("Maryam (Maryam)"),
  Surah("Ta-Ha (Ta-Ha)"),
  Surah("Al-Anbiya’ (the Prophets)"),
  Surah("Al-Haj (the Pilgrimage)"),
  Surah("Al-Mu’minun (the Believers)"),
  Surah("An-Nur (the Light)"),
  Surah("Al-Furqan (the Criterion)"),
  Surah("Ash-Shu’ara’ (the Poets)"),
  Surah("An-Naml (the Ants)"),
  Surah("Al-Qasas (the Stories)"),
  Surah("Al-Ankabut (the Spider)"),
  Surah("Ar-Rum (the Romans)"),
  Surah("Luqman (Luqman)"),
  Surah("As-Sajdah (the Prostration)"),
  Surah("Al-Ahzab (the Combined Forces)"),
  Surah("Saba’ (the Sabeans)"),
  Surah("Al-Fatir (the Originator)"),
  Surah("Ya-Sin (Ya-Sin)"),
  Surah("As-Saffah (Those Ranges in Ranks)"),
  Surah("Sad (Sad)"),
  Surah("Az-Zumar (the Groups)"),
  Surah("Ghafar (the Forgiver)"),
  Surah("Fusilat (Distinguished)"),
  Surah("Ash-Shura (the Consultation)"),
  Surah("Az-Zukhruf (the Gold)"),
  Surah("Ad-Dukhan (the Smoke)"),
  Surah("Al-Jathiyah (the Kneeling)"),
  Surah("Al-Ahqaf (the Valley)"),
  Surah("Muhammad (Muhammad)"),
  Surah("Al-Fat’h (the Victory)"),
  Surah("Al-Hujurat (the Dwellings)"),
  Surah("Qaf (Qaf)"),
  Surah("Adz-Dzariyah (the Scatterers)"),
  Surah("At-Tur (the Mount)"),
  Surah("An-Najm (the Star)"),
  Surah("Al-Qamar (the Moon)"),
  Surah("Ar-Rahman (the Most Gracious)"),
  Surah("Al-Waqi’ah (the Event)"),
  Surah("Al-Hadid (the Iron)"),
  Surah("Al-Mujadilah (the Reasoning)"),
  Surah("Al-Hashr (the Gathering)"),
  Surah("Al-Mumtahanah (the Tested)"),
  Surah("As-Saf (the Row)"),
  Surah("Al-Jum’ah (Friday)"),
  Surah("Al-Munafiqun (the Hypocrites)"),
  Surah("At-Taghabun (the Loss & Gain)"),
  Surah("At-Talaq (the Divorce)"),
  Surah("At-Tahrim (the Prohibition)"),
  Surah("Al-Mulk – (the Kingdom)"),
  Surah("Al-Qalam (the Pen)"),
  Surah("Al-Haqqah (the Inevitable)"),
  Surah("Al-Ma’arij (the Elevated Passages)"),
  Surah("Nuh (Nuh)"),
  Surah("Al-Jinn (the Jinn)"),
  Surah("Al-Muzammil (the Wrapped)"),
  Surah("Al-Mudaththir (the Cloaked)"),
  Surah("Al-Qiyamah (the Resurrection)"),
  Surah("Al-Insan (the Human)"),
  Surah("Al-Mursalat (Those Sent Forth)"),
  Surah("An-Naba’ (the Great News)"),
  Surah("An-Nazi’at (Those Who Pull Out)"),
  Surah("‘Abasa (He Frowned)"),
  Surah("At-Takwir (the Overthrowing)"),
  Surah("Al-Infitar (the Cleaving)"),
  Surah("Al-Mutaffifin (Those Who Deal in Fraud)"),
  Surah("Al-Inshiqaq (the Splitting Asunder)"),
  Surah("Al-Buruj (the Stars)"),
  Surah("At-Tariq (the Nightcomer)"),
  Surah("Al-A’la (the Most High)"),
  Surah("Al-Ghashiyah (the Overwhelming)"),
  Surah("Al-Fajr (the Dawn)"),
  Surah("Al-Balad (the City)"),
  Surah("Ash-Shams (the Sun)"),
  Surah("Al-Layl (the Night)"),
  Surah("Adh-Dhuha (the Forenoon)"),
  Surah("Al-Inshirah (the Opening Forth)"),
  Surah("At-Tin (the Fig)"),
  Surah("Al-‘Alaq (the Clot)"),
  Surah("Al-Qadar (the Night of Decree)"),
  Surah("Al-Bayinah (the Proof)"),
  Surah("Az-Zalzalah (the Earthquake)"),
  Surah("Al-‘Adiyah (the Runners)"),
  Surah("Al-Qari’ah (the Striking Hour)"),
  Surah("At-Takathur (the Piling Up)"),
  Surah("Al-‘Asr (the Time)"),
  Surah("Al-Humazah (the Slanderer)"),
  Surah("Al-Fil (the Elephant)"),
  Surah("Quraish (Quraish)"),
  Surah("Al-Ma’un (the Assistance)"),
  Surah("Al-Kauthar (the River of Abundance)"),
  Surah("Al-Kafirun (the Disbelievers)"),
  Surah("An-Nasr (the Help)"),
  Surah("Al-Masad (the Palm Fiber)"),
  Surah("Al-Ikhlas (the Sincerity)"),
  Surah("Al-Falaq (the Daybreak)"),
  Surah("An-Nas (Mankind)"),
];

void main() {
  runApp(Main());
}


class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aayath darse quran',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: _SurahsList(),
    );
  }
}

class _SurahsList extends StatefulWidget {
	_SurahsListState createState() => _SurahsListState();
}

class _SurahsListState extends State<_SurahsList>{
	@override
	Widget build(BuildContext context){
		return Scaffold(
			backgroundColor: Colors.blueGrey[700],
			appBar: AppBar(
				title: const Text("Surahs"),
				centerTitle: true,
				backgroundColor: Colors.blueGrey,
			),
			body: ListView.builder(
			  padding: const EdgeInsets.all(8),
	  	  itemCount: 114,
				itemBuilder: (BuildContext context, int index) {
					return Container(
						height: 50,
				  	padding: const EdgeInsets.all(2),
						child: ElevatedButton(
							onPressed: (){
								Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
										currentSurah =  surahs.elementAt(index);
                    return _AayatsList();
                }));
							},
							child: Text(surahs.elementAt(index).name),
						),
					);
				},
			)
		);
  }
}

class _AayatsList extends StatelessWidget{
	@override
  Widget build(BuildContext context) {
		return Scaffold(
		  appBar: AppBar(title: Text(currentSurah.name)),
			body: ListView.builder(
				itemCount: currentSurah.ayats.length,
				padding: const EdgeInsets.all(2),
				itemBuilder: (BuildContext context, int index){
					return Container(
						width: MediaQuery.of(context).size.width,
						height: 100,
						padding: const EdgeInsets.all(2),
						child: Card(
							shape: RoundedRectangleBorder(  
								borderRadius: BorderRadius.circular(15.0),  
							),  
							elevation: 50,

							shadowColor: Colors.black,					
							color: Colors.blueGrey,

							child: Center(
								child: ListTile(
									leading: Image.network(
										"https://i.ytimg.com/vi/O3ZUDDs9uo4/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAwInsAXExIcKBofURGaDN8_Aa3Vw",
										fit: BoxFit.fill,
									),
									title: Text("Ayats: " + currentSurah.ayats.elementAt(index).toString(), textScaleFactor: 1.5,),
									subtitle: Text("Time: " + currentSurah.time, textScaleFactor: 1.2,),
									trailing: Icon(Icons.radio_button_unchecked),
								),
							),
						),
				);},
			),
     );
  }
}
 

class Surah {
	late String name;
	String time = "2:20:09";
	List ayats = ["1-10", "1-11", "1-12"];

	Surah(name) {
		this.name = name;
		this.ayats = ayats;
		this.time = time;
	}
}

