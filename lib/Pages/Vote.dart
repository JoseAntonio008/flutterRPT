import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/models/candidate_model.dart';
import '../services/api_service.dart';

class VotingPage extends StatelessWidget {
  const VotingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Candidates();
  }
}

class Candidates extends StatefulWidget {
  const Candidates({super.key});

  @override
  State<Candidates> createState() => _CandidatesState();
}

class _CandidatesState extends State<Candidates> {
  late Future<Map<String, List<Candidate>>> _candidatesFuture;

  @override
  void initState() {
    super.initState();
    _candidatesFuture = ApiService.fetchCandidate();
  }

  @override
  Widget build(BuildContext context) {
    print("on voting page");
    return Scaffold(
      appBar: AppBar(
        title: Text('hello vote here'),
      ),
      body: SizedBox(
        child: Column(
          children: [
            FutureBuilder<Map<String, List<Candidate>>>(
              future: _candidatesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No candidates found.'));
                }

                final candidates = snapshot.data!;

                return Expanded(
                  child: ListView(
                    children: [
                      _buildCandidateSection('President', candidates['pres']!),
                      _buildCandidateSection('Secretary', candidates['sec']!),
                      _buildCandidateSection('Treasurer', candidates['tres']!),
                    ],
                  ),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  print(
                      "Pres: ${selectedPres?.studentNo},Sec: ${selectedSec?.studentNo},Tres:${selectedTres?.studentNo}");
                },
                child: Text("submit"))
          ],
        ),
      ),
    );
  }

  Widget _buildCandidateSection(String title, List<Candidate> candidates) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: candidates
                .map((candidate) => _buildCandidateTile(candidate))
                .toList(),
          ),
        )
      ],
    );
  }

  Candidate? selectedPres;
  Candidate? selectedSec;
  Candidate? selectedTres;
  Candidate? selectedRep;
  Widget _buildCandidateTile(Candidate candidate) {
    bool isSelected = false;

    if (candidate.position == "pres") {
      isSelected = selectedPres == candidate;
    } else if (candidate.position == "sec") {
      isSelected = selectedSec == candidate;
    } else if (candidate.position == "tres") {
      isSelected = selectedTres == candidate;
    } else if (candidate.position == "rep") {
      isSelected = selectedRep == candidate;
    }

    return Container(
      width: 200, // Fixed width for each tile
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color:
            isSelected ? Colors.lightBlueAccent.withOpacity(0.2) : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isSelected ? Colors.lightBlueAccent : Colors.grey.shade300,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CheckboxListTile(
        
        title: Text('${candidate.fname} ${candidate.mname} ${candidate.lname}'),
        subtitle: Text(
            'Partylist: ${candidate.partylist} | Position: ${candidate.position} | Student No.: ${candidate.studentNo}'),
        value: isSelected,
        onChanged: (bool? value) {
          if (value == true) {
            setState(() {
              if (candidate.position == "pres") {
                selectedPres = candidate;
              } else if (candidate.position == "sec") {
                selectedSec = candidate;
              } else if (candidate.position == "tres") {
                selectedTres = candidate;
              } else if (candidate.position == "rep") {
                selectedRep = candidate;
              }
            });
          }
        },
      ),
    );
  }
}
