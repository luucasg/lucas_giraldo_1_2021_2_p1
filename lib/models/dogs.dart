// class Dogs {
//   var message;
//   String status = '';

//   Dogs({ required this.message, required this.status});

//   Dogs.fromJson(Map<String, dynamic> json) {
//     //message = json['message'] != null ? new Message.fromJson(json['message']);
//     message = json['message'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.message != null) {
//       data['message'] = this.message.toJson();
//     }
//     data['status'] = this.status;
//     return data;
//   }
// }

class Dogs {
  var message;
  String status = '';

  Dogs(this.message, this.status);

  Dogs.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
  }
}