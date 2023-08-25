import 'package:flutter/material.dart';
import 'package:god_father/screens/naming_screen.dart';
import '../providers/settings.dart';

class Home extends StatelessWidget {
  // const Home({super.key, Key? keym});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/S6GodFather.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('God Father'),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final settings = Settings(); // Create an instance of the Settings class

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: SizedBox(
          width: 300,
          height: 300,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.86),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              textDirection: TextDirection.ltr,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NamingScreen.routeName);
                  },
                  icon: Icon(
                    Icons.play_circle_filled_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 90,
                  ),
                  // Apply the theme's icon color
                ),
                const SizedBox(height: 50),
                // TextButton.icon(
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => DriftDbViewer(_db)));
                //   },
                //   icon: const Icon(Icons.help_center_rounded),
                //   label: const Text(
                //     'Help',
                //   ),
                //   style: TextButton.styleFrom(
                //     foregroundColor: theme.textTheme.labelLarge
                //         ?.color, // Apply the theme's labelLarge text color
                //     textStyle: settings
                //         .buttonLabelStyle, // Apply the custom labelLarge label text style
                //   ),
                // ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings_rounded),
                  label: const Text('Settings'),
                  style: TextButton.styleFrom(
                    foregroundColor: theme.textTheme.labelLarge
                        ?.color, // Apply the theme's labelLarge text color
                    textStyle: settings
                        .buttonLabelStyle, // Apply the custom labelLarge label text style
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.exit_to_app_rounded),
                  label: const Text('Exit'),
                  style: TextButton.styleFrom(
                    foregroundColor: theme.textTheme.labelLarge
                        ?.color, // Apply the theme's labelLarge text color
                    textStyle: settings
                        .buttonLabelStyle, // Apply the custom labelLarge label text style
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
