import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated_output.freezed.dart';
part 'generated_output.g.dart';

/// Converter that handles both String and List<String> from JSON
class StringOrListConverter implements JsonConverter<List<String>, dynamic> {
  const StringOrListConverter();

  @override
  List<String> fromJson(dynamic json) {
    if (json == null) return [];
    if (json is String) return [json];
    if (json is List) return json.map((e) => e.toString()).toList();
    return [];
  }

  @override
  dynamic toJson(List<String> object) => object;
}

/// Converter for costs and compensations (can be string or complex object)
class CostsConverter implements JsonConverter<String?, dynamic> {
  const CostsConverter();

  @override
  String? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is String) return json;
    if (json is Map) {
      final parts = <String>[];
      
      final costs = json['costs'];
      if (costs is List && costs.isNotEmpty) {
        final costStrings = costs.map((c) {
          if (c is String) return c;
          if (c is Map) return c['cost']?.toString() ?? c.toString();
          return c.toString();
        }).toList();
        parts.add('Costs: ${costStrings.join(", ")}');
      }
      
      final compensators = json['compensators'];
      if (compensators is List && compensators.isNotEmpty) {
        final compStrings = compensators.map((c) {
          if (c is String) return c;
          if (c is Map) return c['compensation']?.toString() ?? c.toString();
          return c.toString();
        }).toList();
        parts.add('Compensators: ${compStrings.join(", ")}');
      }
      
      final avoided = json['avoidedMedicine'];
      if (avoided is List && avoided.isNotEmpty) {
        parts.add('Avoided: ${avoided.join(", ")}');
      }
      
      return parts.isNotEmpty ? parts.join('. ') : null;
    }
    return json.toString();
  }

  @override
  dynamic toJson(String? object) => object;
}

@freezed
class GeneratedOutput with _$GeneratedOutput {
  const factory GeneratedOutput({
    required StoryOutput story,
    required IdentificationOutput identification,
    required FunctioningOutput functioning,
    required ActionsOutput actions,
    required LifeDomainsOutput lifeDomains,
    required MetaOutput meta,
    ExamplesOutput? examples,
  }) = _GeneratedOutput;

  factory GeneratedOutput.fromJson(Map<String, dynamic> json) =>
      _$GeneratedOutputFromJson(json);
}

@freezed
class StoryOutput with _$StoryOutput {
  const factory StoryOutput({
    required String mythSummary,
    required String centralTension,
    required String guidingSentence,
    String? northStarScene,
    String? currentChapter,
  }) = _StoryOutput;

  factory StoryOutput.fromJson(Map<String, dynamic> json) =>
      _$StoryOutputFromJson(json);
}

@freezed
class IdentificationOutput with _$IdentificationOutput {
  const factory IdentificationOutput({
    required ArchetypeBlock ego,
    required ArchetypeBlock persona,
    required ArchetypeBlock shadow,
    ArchetypeBlock? shadowVirtue,
    required ArchetypeBlock feelingFunction,
    ArchetypeBlock? erosAxis,
    ArchetypeBlock? moralOrientation,
    @Default([]) List<EvidenceItem> evidence, // Keep for backward compatibility
  }) = _IdentificationOutput;

  factory IdentificationOutput.fromJson(Map<String, dynamic> json) =>
      _$IdentificationOutputFromJson(json);
}

@freezed
class FunctioningOutput with _$FunctioningOutput {
  const factory FunctioningOutput({
    required List<String> coreTraits,
    required String symbolicEssence,
    required String narrativeArc,
    required String redemptionArc,
    @CostsConverter() String? costsAndCompensations,
    String? powerStance,
    AlignmentIndicators? alignmentIndicators,
  }) = _FunctioningOutput;

  factory FunctioningOutput.fromJson(Map<String, dynamic> json) =>
      _$FunctioningOutputFromJson(json);
}

@freezed
class ActionsOutput with _$ActionsOutput {
  const factory ActionsOutput({
    required List<SituationBlock> situationBlocks,
    required String guidingQuestion,
  }) = _ActionsOutput;

  factory ActionsOutput.fromJson(Map<String, dynamic> json) =>
      _$ActionsOutputFromJson(json);
}

@freezed
class LifeDomainsOutput with _$LifeDomainsOutput {
  const factory LifeDomainsOutput({
    required DomainBlock work,
    required DomainBlock leadership,
    required DomainBlock truth,
    required DomainBlock intimacy,
    required DomainBlock social,
    required DomainBlock innerLife,
  }) = _LifeDomainsOutput;

  factory LifeDomainsOutput.fromJson(Map<String, dynamic> json) =>
      _$LifeDomainsOutputFromJson(json);
}

@freezed
class ArchetypeBlock with _$ArchetypeBlock {
  const factory ArchetypeBlock({
    required String title,
    required String summary,
    required List<String> characters,
    String? details,
  }) = _ArchetypeBlock;

  factory ArchetypeBlock.fromJson(Map<String, dynamic> json) =>
      _$ArchetypeBlockFromJson(json);
}

// Keep for backward compatibility
@freezed
class EvidenceItem with _$EvidenceItem {
  const factory EvidenceItem({
    required String targetPath,
    required List<String> characterRefs,
    required List<String> assessmentRefs,
  }) = _EvidenceItem;

  factory EvidenceItem.fromJson(Map<String, dynamic> json) =>
      _$EvidenceItemFromJson(json);
}

@freezed
class SituationBlock with _$SituationBlock {
  const factory SituationBlock({
    String? title,
    required String situation,
    required List<String> alignedResponse,
    required List<String> beWaryOf,
  }) = _SituationBlock;

  factory SituationBlock.fromJson(Map<String, dynamic> json) =>
      _$SituationBlockFromJson(json);
}

@freezed
class DomainBlock with _$DomainBlock {
  const factory DomainBlock({
    required String title,
    @StringOrListConverter() required List<String> iAm,
    @StringOrListConverter() required List<String> iTendTo,
    @StringOrListConverter() required List<String> typicalSituations,
    @StringOrListConverter() required List<String> watchOuts,
    @StringOrListConverter() required List<String> toRealizePotential,
    required String selfDirection,
  }) = _DomainBlock;

  factory DomainBlock.fromJson(Map<String, dynamic> json) =>
      _$DomainBlockFromJson(json);
}

@freezed
class AlignmentIndicators with _$AlignmentIndicators {
  const factory AlignmentIndicators({
    required List<String> aligned,
    required List<String> unaligned,
  }) = _AlignmentIndicators;

  factory AlignmentIndicators.fromJson(Map<String, dynamic> json) =>
      _$AlignmentIndicatorsFromJson(json);
}

@freezed
class MetaOutput with _$MetaOutput {
  const factory MetaOutput({
    required String generatedAt,
    required String modelVersion,
    required String promptVersion,
    required int schemaVersion,
  }) = _MetaOutput;

  factory MetaOutput.fromJson(Map<String, dynamic> json) =>
      _$MetaOutputFromJson(json);
}

// ==================== EXAMPLES ====================

/// Converter that handles both flat array and structured functioning examples
class FunctioningExamplesConverter implements JsonConverter<FunctioningExamples, dynamic> {
  const FunctioningExamplesConverter();

  @override
  FunctioningExamples fromJson(dynamic json) {
    if (json == null) {
      return const FunctioningExamples();
    }
    if (json is List) {
      // Old flat format - distribute examples across sections
      final examples = json.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>)).toList();
      final perSection = (examples.length / 6).ceil();
      return FunctioningExamples(
        coreTraits: examples.take(perSection).toList(),
        symbolicEssence: examples.skip(perSection).take(perSection).toList(),
        narrativeArc: examples.skip(perSection * 2).take(perSection).toList(),
        redemptionArc: examples.skip(perSection * 3).take(perSection).toList(),
        costsAndCompensations: examples.skip(perSection * 4).take(perSection).toList(),
        alignmentIndicators: examples.skip(perSection * 5).toList(),
      );
    }
    if (json is Map<String, dynamic>) {
      return FunctioningExamples.fromJson(json);
    }
    return const FunctioningExamples();
  }

  @override
  dynamic toJson(FunctioningExamples object) => object.toJson();
}

/// Converter that handles both flat array and structured story examples
class StoryExamplesConverter implements JsonConverter<StoryExamples, dynamic> {
  const StoryExamplesConverter();

  @override
  StoryExamples fromJson(dynamic json) {
    if (json == null) {
      return const StoryExamples();
    }
    if (json is List) {
      // Old flat format - distribute examples across sections
      final examples = json.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>)).toList();
      final perSection = (examples.length / 4).ceil();
      return StoryExamples(
        mythSummary: examples.take(perSection).toList(),
        centralTension: examples.skip(perSection).take(perSection).toList(),
        guidingSentence: examples.skip(perSection * 2).take(perSection).toList(),
        northStarScene: examples.skip(perSection * 3).toList(),
      );
    }
    if (json is Map<String, dynamic>) {
      return StoryExamples.fromJson(json);
    }
    return const StoryExamples();
  }

  @override
  dynamic toJson(StoryExamples object) => object.toJson();
}

/// All examples organized by section
@freezed
class ExamplesOutput with _$ExamplesOutput {
  const factory ExamplesOutput({
    @StoryExamplesConverter() @Default(StoryExamples()) StoryExamples story,
    IdentificationExamples? identification,
    @FunctioningExamplesConverter() @Default(FunctioningExamples()) FunctioningExamples functioning,
    @Default([]) List<ExampleItem> actions,
    LifeDomainsExamples? lifeDomains,
  }) = _ExamplesOutput;

  factory ExamplesOutput.fromJson(Map<String, dynamic> json) =>
      _$ExamplesOutputFromJson(json);
}

/// Examples for story subsections
@freezed
class StoryExamples with _$StoryExamples {
  const factory StoryExamples({
    @Default([]) List<ExampleItem> mythSummary,
    @Default([]) List<ExampleItem> centralTension,
    @Default([]) List<ExampleItem> guidingSentence,
    @Default([]) List<ExampleItem> northStarScene,
  }) = _StoryExamples;

  factory StoryExamples.fromJson(Map<String, dynamic> json) =>
      _$StoryExamplesFromJson(json);
}

/// Examples for functioning subsections
@freezed
class FunctioningExamples with _$FunctioningExamples {
  const factory FunctioningExamples({
    @Default([]) List<ExampleItem> coreTraits,
    @Default([]) List<ExampleItem> symbolicEssence,
    @Default([]) List<ExampleItem> narrativeArc,
    @Default([]) List<ExampleItem> redemptionArc,
    @Default([]) List<ExampleItem> costsAndCompensations,
    @Default([]) List<ExampleItem> alignmentIndicators,
  }) = _FunctioningExamples;

  factory FunctioningExamples.fromJson(Map<String, dynamic> json) =>
      _$FunctioningExamplesFromJson(json);
}

/// Examples for identification subcategories
@freezed
class IdentificationExamples with _$IdentificationExamples {
  const factory IdentificationExamples({
    @Default([]) List<ExampleItem> ego,
    @Default([]) List<ExampleItem> persona,
    @Default([]) List<ExampleItem> shadow,
    @Default([]) List<ExampleItem> shadowVirtue,
    @Default([]) List<ExampleItem> feelingFunction,
    @Default([]) List<ExampleItem> erosAxis,
  }) = _IdentificationExamples;

  factory IdentificationExamples.fromJson(Map<String, dynamic> json) =>
      _$IdentificationExamplesFromJson(json);
}

/// Examples for life domains
@freezed
class LifeDomainsExamples with _$LifeDomainsExamples {
  const factory LifeDomainsExamples({
    @Default([]) List<ExampleItem> work,
    @Default([]) List<ExampleItem> leadership,
    @Default([]) List<ExampleItem> truth,
    @Default([]) List<ExampleItem> intimacy,
    @Default([]) List<ExampleItem> social,
    @Default([]) List<ExampleItem> innerLife,
  }) = _LifeDomainsExamples;

  factory LifeDomainsExamples.fromJson(Map<String, dynamic> json) =>
      _$LifeDomainsExamplesFromJson(json);
}

/// A single example from a character's life (film/series/book/event)
@freezed
class ExampleItem with _$ExampleItem {
  const factory ExampleItem({
    required String characterName,
    required ExampleReference reference,
    required String situation,
    required List<String> actions,
    required List<String> outcomeAndCost,
    @Default('A') String tier, // A = verified, B = auto-generated
    @Default(false) bool autoGenerated,
  }) = _ExampleItem;

  factory ExampleItem.fromJson(Map<String, dynamic> json) =>
      _$ExampleItemFromJson(json);
}

/// Converter that handles int or String for year field
class YearToStringConverter implements JsonConverter<String, dynamic> {
  const YearToStringConverter();

  @override
  String fromJson(dynamic json) {
    if (json == null) return '';
    if (json is int) return json.toString();
    if (json is String) return json;
    return json.toString();
  }

  @override
  dynamic toJson(String object) => object;
}

/// Reference to a real work (film, series, book, event)
@freezed
class ExampleReference with _$ExampleReference {
  const factory ExampleReference({
    required String title,
    @YearToStringConverter() required String year,
    required String medium, // film, series, book, real-event
  }) = _ExampleReference;

  factory ExampleReference.fromJson(Map<String, dynamic> json) =>
      _$ExampleReferenceFromJson(json);
}
