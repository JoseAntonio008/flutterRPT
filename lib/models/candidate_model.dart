class Candidate {
  final int id;
  final String fname;
  final String mname;
  final String lname;
  final String studentNo;
  final String yearlvl;
  final String department;
  final String position;
  final String partylist;

  Candidate({
    required this.id,
    required this.fname,
    required this.mname,
    required this.lname,
    required this.studentNo,
    required this.yearlvl,
    required this.department,
    required this.position,
    required this.partylist,
  });

  @override
  String toString() {
    return 'Candidate(id: $id, fname: $fname, mname: $mname, lname: $lname, studentNo: $studentNo, yearlvl: $yearlvl, department: $department, position: $position, partylist: $partylist)';
  }

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
        id: json['id'],
        fname: json['fname'],
        mname: json['mname'],
        lname: json['lname'],
        studentNo: json['StudentNo'],
        yearlvl: json['yearlvl'],
        department: json['department'],
        position: json['position'],
        partylist: json['partylist']);
  }
}
