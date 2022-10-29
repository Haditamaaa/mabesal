import 'package:flutter/material.dart';
import 'package:mabesal/common/data_list.dart';
import 'package:mabesal/common/screen_data_helper.dart';
import 'package:mabesal/pages/beranda_page.dart';

class PersonalList extends StatefulWidget {
  const PersonalList({Key? key}) : super(key: key);

  @override
  State<PersonalList> createState() => _PersonalListState();
}

class _PersonalListState extends State<PersonalList> {
  final controller = TextEditingController();
  List<Personal> personals = allPersonal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary]
              )
          ),
        ),
        leading: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> (const BerandaPage())));
                },
                child: const Icon(Icons.arrow_back),
              );
            }
        ),
        title: SizedBox(
          height: 40,
          child: TextField(
            onChanged: searchPersonal,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(12),
                prefixIcon: Icon(Icons.search, color: Colors.blue.shade500,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none
                ),
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.blue.shade500
                ),
                hintText: "Search Name"
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: personals.length,
        itemBuilder: (context, index) {
          final personal = personals[index];
          return Card(
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(personal.image),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(personal.name),
                subtitle: Text(personal.nrp),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserListDetail(personal: personal))),
              ),
          );
          },
      ),
    );
  }

  void searchPersonal(String query) {
    final suggestions = allPersonal.where((personal) {
      final personalName = personal.name.toLowerCase();
      final input = query.toLowerCase();

      return personalName.contains(input);
    }).toList();

    setState(() => personals = suggestions);
  }
}
