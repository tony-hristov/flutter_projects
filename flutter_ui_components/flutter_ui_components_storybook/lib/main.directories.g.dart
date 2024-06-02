// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_ui_components_storybook/arrow_indicator_use_cases.dart'
    as _i2;
import 'package:flutter_ui_components_storybook/score_line_use_cases.dart'
    as _i3;
import 'package:flutter_ui_components_storybook/score_ring_use_cases.dart'
    as _i4;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'arrow_indicator',
        children: [
          _i1.WidgetbookFolder(
            name: 'src',
            children: [
              _i1.WidgetbookComponent(
                name: 'ArrowIndicator',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'ArrowIndicator: Negative',
                    builder: _i2.arrowIndicator_Negative,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'ArrowIndicator: Positive',
                    builder: _i2.arrowIndicator_Positive,
                  ),
                ],
              )
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'score_line',
        children: [
          _i1.WidgetbookFolder(
            name: 'src',
            children: [
              _i1.WidgetbookComponent(
                name: 'ScoreLine',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'ScoreLine: Excellent Rating',
                    builder: _i3.scoreLine_excellenRating,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'ScoreLine: Fair Rating',
                    builder: _i3.scoreLine_fairRating,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'ScoreLine: Good Rating',
                    builder: _i3.scoreLine_goodRating,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'ScoreLine: Poor Rating',
                    builder: _i3.scoreLine_poorRating,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'ScoreLine: Undefined Rating',
                    builder: _i3.scoreLine_undefinedRating,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'ScoreLine: Very Poor Rating',
                    builder: _i3.scoreLine_veryPoorRating,
                  ),
                ],
              )
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'score_ring',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ScoreRing',
            useCase: _i1.WidgetbookUseCase(
              name: 'ScoreRing: Default',
              builder: _i4.scoreRing_default,
            ),
          )
        ],
      ),
    ],
  )
];
