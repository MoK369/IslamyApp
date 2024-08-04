import 'package:flutter/material.dart';

class SebhaLayout extends StatefulWidget {
  SebhaLayout({super.key});

  @override
  State<SebhaLayout> createState() => _SebhaLayoutState();
}

class _SebhaLayoutState extends State<SebhaLayout> {
  late ThemeData theme;
  late Size size;

  int numberOfHymns = 0, counter = 0;
  double rotation = 0;
  String kindOfHymn = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: size.height * 0.4,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Transform.rotate(
                angle: rotation,
                child: ImageIcon(
                  const AssetImage('assets/icons/body of sebha.png'),
                  size: (size.height * 0.4),
                ),
              ),
              Positioned(
                top: -(size.height * 0.4) * 0.05,
                child: ImageIcon(
                  const AssetImage('assets/icons/head of sebha.png'),
                  size: size.height * 0.1,
                ),
              ),
            ],
          ),
        ),
        Center(
            child: Text("عدد التسبيحات",
                textDirection: TextDirection.rtl,
                style: theme.textTheme.bodyLarge)),
        SizedBox(
          height: size.height * 0.005,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 69,
              height: 81,
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  '$numberOfHymns',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: ElevatedButton(
                onPressed: () {
                  onClick();
                },
                style: theme.elevatedButtonTheme.style,
                child: Text(kindOfHymn),
              ),
            ),
          ],
        )
      ],
    );
  }

  void onClick() {
    setState(() {
      numberOfHymns++;
      rotation += 0.5;
      rotation == 360 ? rotation = 0 : rotation = rotation;
      if (numberOfHymns == 33) {
        counter += 1;
        if (counter == 4) {
          counter = 0;
        }
        numberOfHymns = 0;
      }
      switch (counter) {
        case 0:
          kindOfHymn = 'سبحان الله';
          break;
        case 1:
          kindOfHymn = 'الحمد لله';
          break;
        case 2:
          kindOfHymn = 'الله أكبر';
          break;
        case 3:
          kindOfHymn = 'لا إله إلا الله';
          break;
        default:
          kindOfHymn = '';
          break;
      }
    });
  }
}
