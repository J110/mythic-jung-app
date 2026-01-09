#!/usr/bin/env python3
"""Read instruction files from extracted spec folders"""
import os
import json

base = '/Users/anmolmohan/Projects/flutter_app/agent_spec'
output_file = '/Users/anmolmohan/Projects/flutter_app/spec_instructions.json'

results = {}

# Find all directories
for item in os.listdir(base):
    item_path = os.path.join(base, item)
    if os.path.isdir(item_path) and not item.endswith('.zip'):
        print(f"Processing: {item}")
        results[item] = {}
        
        # List all files
        files = os.listdir(item_path)
        results[item]['files'] = files
        
        # Read instruction files
        for f in files:
            if 'INSTRUCTIONS' in f.upper() or (f.endswith('.md') and 'INSTRUCT' in f.upper()):
                file_path = os.path.join(item_path, f)
                try:
                    with open(file_path, 'r', encoding='utf-8') as file:
                        content = file.read()
                        results[item][f] = content
                        print(f"  Read: {f} ({len(content)} chars)")
                except Exception as e:
                    results[item][f] = f"Error: {e}"
                    print(f"  Error reading {f}: {e}")
        
        # Also read any JSON schema files
        for f in files:
            if f.endswith('.json') and 'SCHEMA' in f.upper():
                file_path = os.path.join(item_path, f)
                try:
                    with open(file_path, 'r', encoding='utf-8') as file:
                        content = json.load(file)
                        results[item][f] = content
                        print(f"  Read JSON: {f}")
                except Exception as e:
                    print(f"  Error reading JSON {f}: {e}")

# Save to file
with open(output_file, 'w', encoding='utf-8') as f:
    json.dump(results, f, indent=2, ensure_ascii=False)

print(f"\nResults saved to: {output_file}")
print(f"Found {len(results)} directories")
