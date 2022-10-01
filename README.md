# Description

This project is part of this repository [simolus3/web3dart](https://github.com/simolus3/web3dart).

Since it is now maintained by another developer ([xclud/web3dart](https://github.com/xclud/web3dart))

who decided to remove the generator code after version 2.3.5,

in order to move this code as a separate dependency so that it can be placed in dev_dependencies,

a package was created web3dart_builders


Source code has not been edited except for imports

# Installation

1. Add to pubspec.yaml in your project: dev_dependencies: web3dart_builders: ^0.0.1
2. Remove all from file flutter/.pub-cache/hosted/pub.dartlang.org/web3dart-2.4.1/build.yaml file from web3dart package
 Or wait where ([xclud/web3dart](https://github.com/xclud/web3dart) accept a pull request [#30 remove build.yaml](https://github.com/xclud/web3dart/pull/30))


# Usage

    flutter pub run build_runner build

or

    flutter pub run build_runner watch