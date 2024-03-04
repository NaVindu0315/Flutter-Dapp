import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/src/client.dart';
import 'package:web3dart/web3dart.dart';

class Voting extends StatefulWidget {
  const Voting({Key? key}) : super(key: key);

  @override
  State<Voting> createState() => _VotingState();
}

class _VotingState extends State<Voting> {
  void snackBar({required String label}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(label),
        duration: const Duration(seconds: 2),
      ),
    );
  }

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

  Future<DeployedContract> getContract() async {
    // Obtain our smart contract using rootbundle to access our json file
    String abiFile = await rootBundle.loadString("assets/contract.json");

    String contractAddress = "0x87B966dABb5DCE6bc588Ddbaa2CC5184dbE0DD7B";

    final contract = DeployedContract(ContractAbi.fromJson(abiFile, "Voting"),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<List<dynamic>> callFunction(String name) async {
    final contract = await getContract();
    final function = contract.function(name);
    final result = await ethClient
        .call(contract: contract, function: function, params: []);
    return result;
  }

  Future<void> getTotalVotes() async {
    List<dynamic> resultsA = await callFunction("getTotalVotesAlpha");
    List<dynamic> resultsB = await callFunction("getTotalVotesBeta");
    totalVotesA = resultsA[0];
    totalVotesB = resultsB[0];

    setState(() {});
  }

  Widget voteButton(String label, bool voteValue) {
    return ElevatedButton(
      onPressed: () async {
        await vote(voteValue);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Vote recorded for $label'),
          ),
        );
      },
      child: Text(label),
    );
  }

  Future<void> vote(bool voteAlpha) async {
    snackBar(label: "Recording vote");

    // Obtain private key for write operation
    Credentials key = EthPrivateKey.fromHex(
        "f6417d3d4c5cc294ace85aa196fcde0ca792550e085f65fff459423e597ff306");

    // Obtain our contract from abi in json file
    final contract = await getContract();

    // Extract function from json file
    final function = contract.function(
      voteAlpha ? "voteAlpha" : "voteBeta",
    );

    // Send transaction using the our private key, function and contract
    await ethClient.sendTransaction(
        key,
        Transaction.callContract(
            contract: contract, function: function, parameters: []),
        chainId: 4);
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    snackBar(label: "verifying vote");

    // Set a 20 seconds delay to allow the transaction to be verified before trying to retrieve the balance
    Future.delayed(const Duration(seconds: 20), () {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      snackBar(label: "retrieving votes");
      getTotalVotes();

      ScaffoldMessenger.of(context).clearSnackBars();
    });
  }

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(blockchainUrl, httpClient as Client);
    getTotalVotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Spacer(),
            Row(
              children: [
                Spacer(),
                Text('Total Count'),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                ElevatedButton(onPressed: () {}, child: Text('Vote A')),
                ElevatedButton(onPressed: () {}, child: Text('Vote B')),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
