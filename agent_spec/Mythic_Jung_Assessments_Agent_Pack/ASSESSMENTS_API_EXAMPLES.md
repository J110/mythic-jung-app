# Assessment API Examples

## Upsert answer
POST /v1/assessments/answer
{
  "assessmentType": "SHADOW_PROXIMITY",
  "questionId": "SHD_Q4_SHADOW_VIRTUE",
  "selectedCharacterIds": ["<charId>"],
  "confidence": 90
}

## Generate updated output
POST /v1/generate
{
  "force": false,
  "reason": "assessment_answered"
}

## Evidence expectation
GeneratedOutput.identification.evidence should include entries like:
{
  "targetPath": "identification.shadowVirtue",
  "characterRefs": ["Rick Sanchez"],
  "assessmentRefs": ["SHD_Q4_SHADOW_VIRTUE"]
}
