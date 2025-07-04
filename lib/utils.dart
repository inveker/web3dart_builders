import 'package:code_builder/code_builder.dart' hide FunctionType;
import 'package:web3dart/web3dart.dart';

const web3package = 'package:web3dart/web3dart.dart';
const walletPackage = 'package:wallet/wallet.dart';

TypeReference referType(String name, [String? uri]) {
  return TypeReference((b) => b
    ..symbol = name
    ..url = uri);
}

final dartInt = referType('int', 'dart:core');
final dartBool = referType('bool', 'dart:core');
final string = referType('String', 'dart:core');
final bigInt = referType('BigInt', 'dart:core');
final uint8List = referType('Uint8List', 'dart:typed_data');
final dynamicType = referType('dynamic', 'dart:core');
final listType = listify(dynamicType);

final web3Client = referType('Web3Client', web3package);
final ethereumAddress = referType('EthereumAddress', walletPackage);
final blockNum = referType('BlockNum', web3package);
final credentials = referType('Credentials', web3package);
final contractAbi = referType('ContractAbi', web3package);
final deployedContract = referType('DeployedContract', web3package);
final generatedContract = referType('GeneratedContract', web3package);
final transactionType = referType('Transaction', web3package);
final filterOptions = referType('FilterOptions', web3package);
final filterEvent = referType('FilterEvent', web3package);
final stateMutability = referType('StateMutability', web3package);

final mutabilities = {
  StateMutability.pure: stateMutability.property('pure'),
  StateMutability.view: stateMutability.property('view'),
  StateMutability.nonPayable: stateMutability.property('nonPayable'),
  StateMutability.payable: stateMutability.property('payable'),
};

final functionTypes = {
  ContractFunctionType.function:
      refer('ContractFunctionType.function', web3package),
  ContractFunctionType.fallback:
      refer('ContractFunctionType.fallback', web3package),
  ContractFunctionType.constructor:
      refer('ContractFunctionType.constructor', web3package),
};

Reference futurize(Reference r) {
  return TypeReference((b) => b
    ..symbol = 'Future'
    ..types.add(r));
}

Reference streamOf(Reference r) {
  return TypeReference((b) => b
    ..symbol = 'Stream'
    ..types.add(r));
}

TypeReference listify(Reference r) {
  return TypeReference((b) => b
    ..symbol = 'List'
    ..types.add(r));
}

Expression callSuper(List<Expression> args) {
  return refer('super')(args);
}

/// Functions
final funSendTransaction = refer('client.sendTransaction');
final funCall = refer('client.call');

/// Arguments
final argCredentials = refer('credentials');

final argContract = refer('self');
final argFunction = refer('function');
final argParams = refer('params');

final argPrivateKey = refer('privateKey');

final argContractAddress = refer('contractAddress');

extension AbiTypeToDart on AbiType {
  TypeReference toDart() {
    if (this is AddressType) {
      return ethereumAddress;
    } else if (this is UintType || this is IntType) {
      return bigInt;
    } else if (this is StringType) {
      return string;
    } else if (this is BoolType) {
      return dartBool;
    } else if (this is FixedBytes || this is DynamicBytes) {
      return uint8List;
    } else if (this is StringType) {
      return string;
    } else if (this is BaseArrayType) {
      return listify((this as BaseArrayType).type.toDart());
    } else {
      return dynamicType;
    }
  }

  TypeReference erasedDartType() {
    if (this is BaseArrayType) {
      return listType;
    } else {
      return toDart();
    }
  }
}
