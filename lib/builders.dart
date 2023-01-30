import 'package:build/build.dart';
import 'package:web3dart_builders/src/generator.dart';

Builder abiGenerator(BuilderOptions options) => const ContractGenerator();

PostProcessBuilder deleteSource(BuilderOptions options) {
  return FileDeletingBuilder(
    ['.abi.json'],
    isEnabled: options.config['enabled'] == true,
  );
}