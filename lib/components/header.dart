import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    var activePath = context.url;

    // Relative hrefs resolve against <base>, so local (`/`) and GitHub Pages
    // project-site (`/flutter_jaspr_web/`) builds both work with full page loads.
    return header([
      nav([
        for (var route in [
          (label: 'Home', path: '/', href: './'),
          (label: 'About', path: '/about', href: 'about'),
        ])
          div(classes: activePath == route.path ? 'active' : null, [
            a(href: route.href, [Component.text(route.label)]),
          ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('header', [
      css('&').styles(
        display: Display.flex,
        padding: Padding.all(1.em),
        justifyContent: JustifyContent.center,
      ),
      css('nav', [
        css('&').styles(
          display: Display.flex,
          height: 3.em,
          radius: BorderRadius.circular(10.px),
          overflow: Overflow.clip,
          justifyContent: JustifyContent.spaceBetween,
          backgroundColor: primaryColor,
        ),
        css('a', [
          css('&').styles(
            display: Display.flex,
            height: 100.percent,
            padding: Padding.symmetric(horizontal: 2.em),
            alignItems: AlignItems.center,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            textDecoration: TextDecoration(line: TextDecorationLine.none),
          ),
          css('&:hover').styles(
            backgroundColor: const Color('#0005'),
          ),
        ]),
        css('div.active', [
          css('&').styles(position: Position.relative()),
          css('&::before').styles(
            content: '',
            display: Display.block,
            position: Position.absolute(bottom: 0.5.em, left: 20.px, right: 20.px),
            height: 2.px,
            radius: BorderRadius.circular(1.px),
            backgroundColor: Colors.white,
          ),
        ])
      ]),
    ]),
  ];
}
