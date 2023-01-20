import 'package:flutter/material.dart';

import '../../domain/entities/movie_entity.dart';

class MovieItem extends StatefulWidget {
  final MovieEntity movie;
  const MovieItem({super.key, required this.movie});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.withOpacity(.2),
              width: .5,
            ),
          ),
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _movieHeader,
              const SizedBox(height: 8),
              _labelValue(
                'Lançamento: ',
                widget.movie.releaseDate,
              ),
              const SizedBox(height: 8),
              Text(
                widget.movie.overview,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: _getColorAverage,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(8),
            child: Text(widget.movie.voteAverage.toString()),
          ),
        ),
      ],
    );
  }

  Widget get _movieHeader {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.movie.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          widget.movie.originalTitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget _labelValue(String label, String value) {
    return RichText(
      text: TextSpan(
        text: label,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
        children: [
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  Color get _getColorAverage {
    final mean = widget.movie.voteAverage;
    if (mean >= 0 && mean < 2.5) {
      return Colors.red;
    } else if (mean >= 2.5 && mean < 5) {
      return Colors.orange;
    } else if (mean >= 5 && mean < 7.5) {
      return Colors.yellow.shade600;
    } else {
      return Colors.green;
    }
  }
}
