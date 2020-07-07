import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trampo/modules/jobs/job_model.dart';

class JobRepository {
  final _collection = Firestore.instance.collection('jobs');

  Future<QuerySnapshot> getDocuments() async {
    return _collection.getDocuments();
  }

  Future<DocumentSnapshot> getById(String id) async {
    return _collection.document(id).get();
  }

  Future<Stream<QuerySnapshot>> stream() async {
    return _collection.snapshots();
  }

  Future<DocumentReference> create(JobModel model) async {
    return _collection.add(model.toMap());
  }

  Future update(String id, JobModel model) {
    return _collection.document(id).updateData(model.toMap());
  }

  Future delete(String id) async {
    return _collection.document(id).delete();
  }
}
