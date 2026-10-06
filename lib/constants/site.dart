/// GitHub Pages project sites are served under `/<repo>/`.
/// Local `jaspr serve` keeps the default `/` base; CI Pages builds pass
/// `--dart-define=BASE_PATH=flutter_jaspr_web`.
const String siteBase = String.fromEnvironment('BASE_PATH', defaultValue: '/');

const String siteTitle = 'Flutter Jaspr Web';
