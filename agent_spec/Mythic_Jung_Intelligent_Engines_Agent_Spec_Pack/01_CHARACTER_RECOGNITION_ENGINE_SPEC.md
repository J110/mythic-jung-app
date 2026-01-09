# 01 — Character Recognition Engine Spec (Production)

## Objective
Convert user-entered character strings into **high-confidence canonical character entities**.
Reject junk or ambiguous input and ask for specificity.

## Input
- User enters 6 strings (free text), optional hints in parentheses:
  - "James Bond (Daniel Craig)"
  - "Ethan Hunt (McQuarrie era)"
  - "Gregory House"
  - "Rick Sanchez"

## Output (per character)
A `RecognitionResult` object:
- status: RECOGNIZED | AMBIGUOUS | NOT_RECOGNIZED
- confidence: 0–1
- canonical:
  - canonicalId (stable)
  - name
  - universe/franchise
  - medium (film/tv/book/real-life)
  - portrayal (actor/era) optional
- candidates: list of top matches (for AMBIGUOUS)
- requiredDisambiguation: list of prompts the UI can ask
- normalization:
  - cleanedInput
  - detectedHints (actor/era keywords)

## Recognition approach (state-of-the-art, practical)
Use a **hybrid pipeline**:
1) Input normalization
2) Candidate retrieval (lexical + semantic)
3) Candidate reranking
4) Confidence scoring + thresholding
5) Disambiguation prompts (if ambiguous)

### 1) Normalization
- lower-case for matching, preserve original for display
- strip punctuation, collapse whitespace
- detect parentheses hints: actor/era/director/season

### 2) Candidate retrieval (two-stage)
- Lexical search: trigram/fuzzy match against a Character KB index
- Semantic search: embedding similarity against Character KB descriptions and aliases
Return top K (e.g., 20).

### 3) Reranking
- Cross-encoder reranker (or LLM-based scoring) using:
  - input string
  - hints
  - candidate metadata
- Rerank to top N (e.g., 5).

### 4) Confidence scoring
Compute confidence from:
- score gap between top1 and top2
- absolute top1 score
- hint match (actor/era/medium alignment)
- alias exact match bonus

Suggested thresholds:
- RECOGNIZED: confidence >= 0.78 and gap >= 0.10
- AMBIGUOUS: 0.55–0.78 or gap < 0.10
- NOT_RECOGNIZED: < 0.55

### 5) Disambiguation strategy
If AMBIGUOUS:
- Ask 1–2 simple questions (not a form):
  - “Which one did you mean?” (show 3–5 candidates with posters/icons if available)
  - “From which movie/series?”
  - “Which actor/era?”

If NOT_RECOGNIZED:
- Explain plainly:
  - “I couldn’t recognize this character confidently.”
- Provide recovery options:
  - “Add the show/movie name in parentheses.”
  - “Check spelling.”
  - “Pick a known character.”

## Character Knowledge Base (KB) requirement
Minimum fields:
- canonicalId
- displayName
- aliases []
- franchise/universe
- medium
- era/actor variants
- shortDescription (2–3 lines)
- longDescription (optional)
- tags (e.g., spy, doctor, trickster)

## Data sources for KB (implementation choices)
- V1: curated seed set + incremental growth from user inputs (human review)
- V2: licensed dataset or public knowledge base + enrichment (careful with licensing)
- V3: internal “Character Graph” with embeddings

## API contract
POST /v1/characters/recognize
Body:
{
  "inputs": ["...", "...", "...", "...", "...", "..."]
}
Response:
{
  "results": [RecognitionResult x 6],
  "overall": {
    "recognizedCount": 0,
    "minConfidence": 0.0,
    "needsDisambiguation": true
  }
}

## Logging and privacy
- Log only: status + confidence + canonicalId (if recognized)
- Do NOT log raw user strings unless user opted-in to improve recognition

## Tests
- Unit tests: normalization, thresholds
- Golden tests: common characters and misspellings
- Adversarial: junk strings, emojis, random words
