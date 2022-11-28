import 'package:flutter/material.dart';
import 'mainPage.dart';
class NavBar extends StatelessWidget {
  final void Function() confirmationStartTrainer;
  final void Function() confirmationStartCards;

  NavBar(
      {Key? key,
      required this.confirmationStartTrainer,
      required this.confirmationStartCards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Simon'),
            accountEmail: Text('simon.hoch@web.de'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://m.media-amazon.com/images/I/91B3vW1Nd9L._AC_SL1500_.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picture.yatego.com/images/5bec4787bb8692.7/big_47ac62a9e1ea049aa2bde7d4d2236d0a-kqh/papagei-dschungel-kinder-poster-p0777.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.checklist_rtl_rounded),
            title: Text('Test'),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext (context) => new MainPage))),
          ),
          ListTile(
            leading: Icon(Icons.flip_rounded),
            title: Text('Karteikarten'),
            onTap: () => confirmationStartCards,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Einstellungen'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('Profil'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
