<div align="center">

<h1>GbuAgenda</h1>

A New Schedule App for Gautam Buddha University that doesn't suck.

![Flutter CI](https://github.com/imsk17/GBU-Agenda/workflows/Flutter%20CI/badge.svg)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/imsk17/Gbu-Agenda/graphs/commit-activity)
[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![Last Commit](https://img.shields.io/github/last-commit/imsk17/gbu-agenda)](https://github.com/imsk17/GBU-Agenda/commits/master)
[![Stars](https://img.shields.io/github/stars/imsk17/gbu-agenda?style=social)](https://github.com/imsk17/gbu-agenda/stargazers)
</div>


## Download

The Latest Releases Can be Found in This Repo's Releases Section.

## Screenshots

| | | 
|:-------------------------:|:-------------------------:|
|<img width="200" alt="Welcome Screen" src="./art/welcome_screen.jpg">  |  <img width="200" alt="School Screen" src="./art/school_screen.jpg">|
|<img width="200" alt="Section Screen" src="./art/section_screen.jpg">  |  <img width="200" alt="Timetable Screen" src="./art/timetable_screen.jpg">|


GBUAgenda is an app that attempts to use the latest cutting edge libraries and tools. As a summary:

- Uses [Riverpod](https://riverpod.dev) for State Management needs.
- Uses [GetIt](https://pub.dev/packages/get_it) for Dependency Injection.

## Development setup

First off, you require the Latest Android Studio and The Flutter SDK to be able to build the app. You will also need to host your own [Backend](https://github.com/imsk17/GBU-Agenda-Backend)

### Code style

This project uses [lint](https://pub.dev/packages/lint), for Linting in Dart.

If you find that one of your pull reviews does not pass the CI server check due to a code style conflict, you can
easily fix it by running: `flutter format --set-exit-if-changed . && flutter analyze .`

## Contributions

If you've found an error in this sample, please file an issue.

Patches are encouraged and may be submitted by forking this project and
submitting a pull request.

## License

```
MIT License

Copyright (c) 2021 Sumit Kumar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
