# UI Redesign Rollback Plan

## Overview
This document outlines how to safely revert to the stable UI if the card grid redesign doesn't work out.

## Safety Measures in Place

### 1. Git Tag: `v1.0-stable-ui`
The stable UI (before redesign) is tagged and can be accessed anytime.

### 2. Feature Branch: `feature/card-grid-redesign`
All redesign work happens on this branch, NOT on `main`.

### 3. Main Branch Protection
The `main` branch remains untouched until the redesign is fully tested and approved.

---

## How to Rollback

### Option A: Quick Rollback (if on redesign branch)
```bash
# Switch back to main (which has stable UI)
git checkout main

# Deploy main to production
git push origin main
```

### Option B: Full Rollback (if redesign was merged to main)
```bash
# Revert to the tagged stable version
git checkout v1.0-stable-ui

# Create a new branch from stable
git checkout -b rollback-to-stable

# Force push to main (CAUTION: destructive)
git checkout main
git reset --hard v1.0-stable-ui
git push origin main --force
```

### Option C: Soft Rollback (revert specific commits)
```bash
# Find the merge commit that introduced redesign
git log --oneline

# Revert that merge commit
git revert <merge-commit-hash>
git push origin main
```

---

## Branch Strategy

```
main (stable, production)
  │
  └── feature/card-grid-redesign (all redesign work here)
        │
        ├── Commit: Base card component
        ├── Commit: Story tab redesign
        ├── Commit: Identification tab redesign
        └── ... (incremental commits)
```

---

## Testing Before Merge

Before merging redesign to main:

1. [ ] Test all pages on iOS
2. [ ] Test all pages on Android
3. [ ] Test all pages on Web
4. [ ] Test with real user data
5. [ ] Test with new user (empty state)
6. [ ] Get user approval
7. [ ] Performance check (no lag/jank)

---

## Key Files Changed in Redesign

The redesign will modify these files:
- `lib/features/output_tabs/story/story_tab.dart`
- `lib/features/output_tabs/identification/identification_tab.dart`
- `lib/features/output_tabs/functioning/functioning_tab.dart`
- `lib/features/output_tabs/actions/actions_tab.dart`
- `lib/features/output_tabs/life_domains/life_domains_tab.dart`
- `lib/features/output_tabs/constellation/constellation_tab.dart`
- `lib/features/output_tabs/relationship/relationship_tab.dart`
- `lib/features/onboarding/character_entry_screen.dart`
- `lib/features/onboarding/clarification_screen.dart`
- `lib/core/widgets/` (new card components)
- `assets/images/` (new illustrations)

---

## Contacts

If rollback is needed urgently:
1. Check this document
2. Run Option A (quick rollback)
3. If that fails, run Option B

---

## Timeline

- **Stable Tag Created**: January 15, 2026
- **Redesign Branch Created**: January 15, 2026
- **Target Completion**: TBD
- **Merge to Main**: Only after full approval

---

## Notes

- Never commit directly to `main` during redesign
- Always test on `feature/card-grid-redesign` first
- Create incremental commits for easy partial rollbacks
- Keep this document updated as changes are made
