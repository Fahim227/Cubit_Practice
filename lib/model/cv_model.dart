
// applicant_name
// DateofBirth:string
// comboBox two field identity type drop down list: NID, birthregistration
// attachment document upload as pdf




class CVModelFields{
  static final String? id = '_id';
  static final String? tableName = 'CVTable';
  static final String? applicant_name = 'applicant_name';
  static final String? DateofBirth = 'DateofBirth';
  static final String? identityType = 'identityType';
  static final String? identityNumber = 'identityNumber';
  static final String? identityImage = 'identityImage';
  static final String? nid = 'nid';
  static final String? birth_reg = 'birth_reg';
  static final String? passport_id = 'passport_id';

  static final String? nid_file = 'nid_file';
  static final String? birth_reg_file = 'birth_reg_file';
  static final String? passport_id_file = 'passport_id_file';
}



class CVModel {
  String? id = '_id';
  String? applicant_name = 'applicant_name';
  String? DateofBirth = 'DateofBirth';
  String? identityType = 'identityType';
  String? identityNumber = 'identityNumber';
  String? identityImage = 'identityImage';
  String? nid = 'nid';
  String? birth_reg = 'birth_reg';
  String? passport_id = 'passport_id';
  String? nid_file = 'nid_file';
  String? birth_reg_file = 'birth_reg_file';
  String? passport_id_file = 'passport_id_file';


  CVModel({this.id,
    this.applicant_name,
    this.DateofBirth,
    this.identityType,
    this.identityNumber,
    this.identityImage,
    this.nid,
    this.birth_reg,
    this.passport_id,
    this.nid_file,
    this.birth_reg_file,
    this.passport_id_file,
  });

  factory CVModel.fromMap(Map<String, dynamic> json) {
    print(json[CVModelFields.id].toString());
    return CVModel(
        id: json[CVModelFields.id].toString(),
        applicant_name: json[CVModelFields.applicant_name],
        DateofBirth: json[CVModelFields.DateofBirth],
        identityType: json[CVModelFields.identityType],
        identityNumber: json[CVModelFields.identityNumber],
        identityImage: json[CVModelFields.identityImage],
        nid: json[CVModelFields.nid],
        birth_reg: json[CVModelFields.birth_reg],
        passport_id: json[CVModelFields.passport_id],
        nid_file: json[CVModelFields.nid_file],
        passport_id_file: json[CVModelFields.passport_id_file],
        birth_reg_file: json[CVModelFields.birth_reg_file],

      );
}

  Map<String, dynamic> toMap() {
    return {
      CVModelFields.id! : id,
      CVModelFields.applicant_name! : applicant_name,
      CVModelFields.DateofBirth! : DateofBirth,
      CVModelFields.identityType! : identityType,
      CVModelFields.identityNumber! : identityNumber,
      CVModelFields.identityImage! : identityImage,
      // CVModelFields.nid! : nid,
      // CVModelFields.birth_reg! : birth_reg,
      // CVModelFields.passport_id! : passport_id,
      // CVModelFields.nid_file! : nid_file,
      // CVModelFields.passport_id_file! : passport_id_file,
      // CVModelFields.birth_reg_file! : birth_reg_file,
    };
  }
}