import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/movie_entity.dart';

class CountryItem extends StatelessWidget {
  final MovieEntity country;
  const CountryItem({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/details', arguments: country);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.withOpacity(.2),
            width: .5,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Text(
              country.id.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                country.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
