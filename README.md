# Flutter Jaspr Web

A small [Jaspr](https://jaspr.site) static site that shows how a Flutter-like Dart UI compiles to plain HTML/CSS/JS.

**Live demo:** [https://redjadet.github.io/flutter_jaspr_web/](https://redjadet.github.io/flutter_jaspr_web/)

> If that link 404s, enable GitHub Pages in the repo settings: **Settings → Pages → Source: GitHub Actions**.

## What it demonstrates

- **Static site generation** — pages are pre-rendered to HTML under `build/jaspr/`
- **Multi-page routing** with `jaspr_router` (`/` and `/about`)
- **`@client` components** — Home and About hydrate in the browser after SSR
- **Interactive state** — a client-side counter with `setState`
- **CSS-in-Dart** — typed styles via `@css` / `Styles`

## Requirements

- [Dart SDK](https://dart.dev/get-dart) `^3.10.0`
- [Flutter](https://flutter.dev) (stable) — required by this project’s `jaspr.flutter: plugins` config
- Jaspr CLI matching the package version:

```bash
dart pub global activate jaspr_cli 0.22.1
```

Ensure `~/.pub-cache/bin` is on your `PATH`.

## Run (development)

```bash
dart pub get
jaspr serve
```

Open [http://localhost:8080](http://localhost:8080).

## Analyze & build

```bash
dart analyze
jaspr build
```

Production output is written to `build/jaspr/`.

For a GitHub Pages project-site build (assets under `/flutter_jaspr_web/`):

```bash
jaspr build --dart-define=BASE_PATH=flutter_jaspr_web
```

## Project layout

```
lib/
  app.dart                 # Shell + router
  main.server.dart         # SSR / static entry
  main.client.dart         # Browser entry
  components/              # Header, Counter
  pages/                   # Home, About
  constants/               # Theme + site base/title
web/                       # Static assets (favicon, images)
```
