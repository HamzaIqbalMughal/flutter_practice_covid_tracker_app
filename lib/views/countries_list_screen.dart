import 'package:flutter/material.dart';
import 'package:flutter_practice_covid_tracker_app/Models/country_model.dart';
import 'package:flutter_practice_covid_tracker_app/Services/states_services.dart';
import 'package:flutter_practice_covid_tracker_app/views/country_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  static const screen_id = 'CountriesListScreen';

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value){
                  setState(() {

                  });
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with country name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: statesServices.fecthCountriesList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.hasData) {

                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {

                        String countryName = snapshot.data![index]['country'];

                        if(searchController.text.isEmpty){
                          return InkWell(
                            onTap: (){
                              // Navigator.pushNamed(context, CountryDetailScreen.screen_id);
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => CountryDetailScreen(countryModel: CountryModel.fromJson(snapshot.data![index]))
                                  )
                              );
                            },
                            child: ListTile(
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(
                                    snapshot.data![index]['countryInfo']['flag']),
                              ),
                              title: Text(snapshot.data![index]['country']),
                              subtitle:
                              Text(snapshot.data![index]['cases'].toString()),
                            ),
                          );
                        }
                        else if(countryName.toLowerCase().contains(searchController.text.toString())){
                          return InkWell(
                            onTap: (){
                              // Navigator.pushNamed(context, CountryDetailScreen.screen_id);
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => CountryDetailScreen(countryModel: CountryModel.fromJson(snapshot.data![index]))
                                  )
                              );
                            },
                            child: ListTile(
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(
                                    snapshot.data![index]['countryInfo']['flag']),
                              ),
                              title: Text(snapshot.data![index]['country']),
                              subtitle:
                              Text(snapshot.data![index]['cases'].toString()),
                            ),
                          );
                        }
                        else{
                          return Container();
                        }
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                            ),
                            title: Container(
                              height: 10,
                              width: 80,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              height: 10,
                              width: 80,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
