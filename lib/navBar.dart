import 'package:flutter/material.dart';
import 'mainPage.dart';

class NavBar extends StatelessWidget {
  final void Function(dynamic) setLanguage;
  final void Function() confirmationStartHome;
  final void Function() confirmationStartTrainer;
  final void Function() confirmationStartCards;
  final int emoji;
  final String userName;

  NavBar(
      this.setLanguage,
      this.confirmationStartHome,
      this.confirmationStartTrainer,
      this.confirmationStartCards,
      this.emoji,
      this.userName);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          if (emoji == 0) ...[
            UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    'https://images.emojiterra.com/google/android-11/512px/1f98d.png',
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
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxmbz8wm76mEs0d-XYaG7NKIRrPDEkU-sKECeNiJb2Idcw0T2QTiLOImbfoHLM3gaXesU&usqp=CAU',
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
                title: Text('🇬🇧     Englisch'), onTap: () => setLanguage(1)),
            ListTile(
                title: Text('🇪🇸     Spanisch'), onTap: () => setLanguage(2)),
            ListTile(
                title: Text('🇫🇷     Französisch'),
                onTap: () => setLanguage(3)),
            ListTile(
                title: Text('🇮🇹     Italienisch'),
                onTap: () => setLanguage(4)),
          ],
          if (emoji == 1) ...[
            UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    'https://images.emojiterra.com/twitter/v13.1/512px/1f41e.png',
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
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxmbz8wm76mEs0d-XYaG7NKIRrPDEkU-sKECeNiJb2Idcw0T2QTiLOImbfoHLM3gaXesU&usqp=CAU',
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
                title: Text('🇬🇧     Englisch'), onTap: () => setLanguage(1)),
            ListTile(
                title: Text('🇪🇸     Spanisch'), onTap: () => setLanguage(2)),
            ListTile(
                title: Text('🇫🇷     Französisch'),
                onTap: () => setLanguage(3)),
            ListTile(
                title: Text('🇮🇹     Italienisch'),
                onTap: () => setLanguage(4)),
          ],
          if (emoji == 2) ...[
            UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    'https://images.emojiterra.com/google/android-pie/512px/1f428.png',
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
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxmbz8wm76mEs0d-XYaG7NKIRrPDEkU-sKECeNiJb2Idcw0T2QTiLOImbfoHLM3gaXesU&usqp=CAU',
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
                title: Text('🇬🇧     Englisch'), onTap: () => setLanguage(1)),
            ListTile(
                title: Text('🇪🇸     Spanisch'), onTap: () => setLanguage(2)),
            ListTile(
                title: Text('🇫🇷     Französisch'),
                onTap: () => setLanguage(3)),
            ListTile(
                title: Text('🇮🇹     Italienisch'),
                onTap: () => setLanguage(4)),
          ],
          if (emoji == 3) ...[
            UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    'https://images.emojiterra.com/twitter/v13.1/512px/1f981.png',
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
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxmbz8wm76mEs0d-XYaG7NKIRrPDEkU-sKECeNiJb2Idcw0T2QTiLOImbfoHLM3gaXesU&usqp=CAU',
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
                title: Text('🇬🇧     Englisch'), onTap: () => setLanguage(1)),
            ListTile(
                title: Text('🇪🇸     Spanisch'), onTap: () => setLanguage(2)),
            ListTile(
                title: Text('🇫🇷     Französisch'),
                onTap: () => setLanguage(3)),
            ListTile(
                title: Text('🇮🇹     Italienisch'),
                onTap: () => setLanguage(4)),
          ],
        ],
      ),
    );
  }
}
