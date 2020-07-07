import 'package:flutter/material.dart';
import 'package:trampo/shared/helpers/money_helper.dart';

import 'job_model.dart';

class JobCard extends StatelessWidget {
  final JobModel model;

  const JobCard({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              model.name ?? '',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 8),
            Text(
              model.description ?? '',
              style: Theme.of(context).textTheme.caption,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Chip(
                  label: Text(
                    MoneyHelper.parse(model.price.toDouble()),
                    style: Theme.of(context).textTheme.caption,
                  ),
                  backgroundColor:
                      Theme.of(context).accentColor.withOpacity(0.4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
