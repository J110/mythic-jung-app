# Mythic Jung — Intelligent Population Engines Pack
Date: 2026-01-08

This pack defines **four production engines** to populate the app dynamically (no hardcoding):
1) Character Recognition Engine
2) Character Discovery Engine
3) Synthesis Engine
4) Narrative Engine

These engines feed the backend generation pipeline that outputs **schema-valid GeneratedOutput JSON** used by Flutter.

Key principles:
- Confidence + uncertainty must be explicit (never bluff).
- Sources must be attributable (Evidence + provenance).
- Engines must be modular and testable.
- Privacy-first: do not store unnecessary user data.
