import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:trampo/modules/jobs/job_model.dart';
import 'package:trampo/modules/jobs/job_repository.dart';
import 'package:trampo/shared/helpers/firebase_intercept.dart';
part 'job_controller.g.dart';

class JobController = _JobControllerBase with _$JobController;

abstract class _JobControllerBase with Store {
  JobRepository _repository;

  _JobControllerBase() {
    _repository = JobRepository();
  }

  @observable
  bool busy = false;

  @observable
  String name;

  @observable
  String description;

  @observable
  double price;

  @action
  void setName(value) => name = value;

  @action
  void setDescription(value) => description = value;

  @action
  void setPrice(value) => price = value;

  @observable
  ObservableList<JobModel> list = ObservableList<JobModel>();

  @action
  void addJobModel(value) {
    busy = true;
    list.add(value);
    busy = false;
  }

  @action
  Future fetch() async {
    busy = true;
    await FirebaseIntercept.intercept(() async {
      final snapshot =
          await _repository.getDocuments().whenComplete(() => busy = false);

      if (snapshot.documents.isNotEmpty) {
        list = snapshot.documents
            .map((e) => JobModel.fromMap(e.data))
            .toList()
            .asObservable();
      }
    });

    return list;
  }

  @action
  Future create() async {
    busy = true;
    return await FirebaseIntercept.intercept(() async {
      final user = await FirebaseAuth.instance.currentUser();
      final model = JobModel(
        uid: user.uid,
        name: name,
        description: description,
        price: price,
      );

      await _repository.create(model).whenComplete(() => busy = false);

      return model;
    });
  }

/*
  @action
  Future update() async {}

  @action
  Future delete() async {}
*/
}
