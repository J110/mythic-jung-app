#!/bin/bash
cd /Users/anmolmohan/Projects/flutter_app/agent_spec

# Extract all zip files
mkdir -p /tmp/mythic_specs
unzip -q -o Mythic_Jung_Assessments_Agent_Pack.zip -d /tmp/mythic_specs/assessments 2>&1
unzip -q -o Mythic_Jung_Missing_Analysis_Specs_Pack.zip -d /tmp/mythic_specs/missing 2>&1
unzip -q -o Mythic_Jung_Core_Generation_Specs.zip -d /tmp/mythic_specs/core 2>&1

# List all files
echo "=== Extracted Files ==="
find /tmp/mythic_specs -type f | sort

# Show instruction files
echo ""
echo "=== Instruction Files ==="
find /tmp/mythic_specs -name "*INSTRUCTIONS*" -o -name "*.md" | sort
