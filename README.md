# Description

This project is part of this repository [simolus3/web3dart](https://github.com/simolus3/web3dart).
Since it is now maintained by another developer ([xclud/web3dart](https://github.com/xclud/web3dart))
who decided to remove the generator code after version 2.3.5,
in order to move this code as a separate dependency so that it can be placed in dev_dependencies,
a package was created web3dart_builders

# Installation

1. Add to pubspec.yaml of your project in dev_dependencies web3dart_builders
2. Remove build.yaml file from web3dart package

# Usage

    flutter pub run build_runner build

or

    flutter pub run build_runner watch