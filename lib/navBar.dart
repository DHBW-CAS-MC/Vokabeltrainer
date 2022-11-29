import 'package:flutter/material.dart';
import 'mainPage.dart';

class NavBar extends StatelessWidget {
  final void Function(dynamic) setLanguage;
  final void Function() confirmationStartHome;
  final void Function() confirmationStartTrainer;
  final void Function() confirmationStartCards;

  NavBar(this.setLanguage, this.confirmationStartHome,
      this.confirmationStartTrainer, this.confirmationStartCards);

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
            leading: Icon(Icons.home),
            title: Text('Hauptseite'),
            onTap: confirmationStartHome,
          ),
          ListTile(
            leading: Icon(Icons.checklist_rtl_rounded),
            title: Text('Test'),
            onTap: confirmationStartTrainer,
          ),
          ListTile(
            leading: Icon(Icons.picture_in_picture_alt_sharp),
            title: Text('Karteikarten'),
            onTap: confirmationStartCards,
          ),
          Divider(),
          ListTile(
              leading: Image(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/640px-Flag_of_the_United_Kingdom.svg.png',
                      scale: 16)),
              title: Text('Englisch'),
              onTap: () => setLanguage(1)),
          ListTile(
              leading: Image(
                image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Bandera_de_Espa%C3%B1a.svg/640px-Bandera_de_Espa%C3%B1a.svg.png',
                    scale: 16),
                fit: BoxFit.scaleDown,
              ),
              title: Text('Spanisch'),
              onTap: () => setLanguage(2)),
          ListTile(
              leading: Image(
                image: NetworkImage(
                    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/france-flag-template-design-5ec2fe80aa53cdbf5f8d6db13e509ce8_screen.jpg?ts=1594238601',
                    scale: 17),
                fit: BoxFit.scaleDown,
              ),
              title: Text('Französisch'),
              onTap: () => setLanguage(3)),
          ListTile(
              leading: Image(
                image: NetworkImage(
                    'https://img5.goodfon.com/wallpaper/nbig/c/cf/italy-italia-flag-of-italy-italian-flag-flag.jpg',
                    scale: 33),
                fit: BoxFit.scaleDown,
              ),
              title: Text('Italienisch'),
              onTap: () => setLanguage(4)),
        ],
      ),
    );
  }
}
