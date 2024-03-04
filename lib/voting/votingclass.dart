import 'dart:html';

import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';

class Voting extends StatefulWidget {
  const Voting({Key? key}) : super(key: key);

  @override
  State<Voting> createState() => _VotingState();
}

class _VotingState extends State<Voting> {
  ///variables
  late Client httpClient;

  late Web3Client ethClient;

// Ethereum address
  final String myAddress = "0x3C3f0990BAcd02C0ed689bf4Dd6CE18cD3D6A0bF";

// URL from Infura
  final String blockchainUrl =
      "https://sepolia.infura.io/v3/4887f9655ec94842a2d3206deae69ad2";

// Store the value of alpha and beta
  var totalVotesA;
  var totalVotesB;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
