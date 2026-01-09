#!/usr/bin/env python3
import os
import json

base = '/Users/anmolmohan/Projects/flutter_app/agent_spec'
output_dir = '/Users/anmolmohan/Projects/flutter_app/spec_readings'

os.makedirs(output_dir, exist_ok=True)

print("Scanning agent_spec directory...")
if not os.path.exists(base):
    print(f"ERROR: {base} does not exist")
    exit(1)

items = os.listdir(base)
print(f"Found items: {items}")

for item in items:
    item_path = os.path.join(base, item)
    if os.path.isdir(item_path) and not item.endswith('.zip'):
        print(f"\n=== Processing: {item} ===")
        files = os.listdir(item_path)
        print(f"Files in {item}: {files}")
        
        for f in files:
            file_path = os.path.join(item_path, f)
            if 'INSTRUCTIONS' in f.upper() or (f.endswith('.md') and 'INSTRUCT' in f.upper()):
                print(f"  Reading: {f}")
                try:
                    with open(file_path, 'r', encoding='utf-8') as file:
                        content = file.read()
                        # Save to readable location
                        output_file = os.path.join(output_dir, f"{item}_{f}")
                        with open(output_file, 'w', encoding='utf-8') as out:
                            out.write(content)
                        print(f"    Saved to: {output_file}")
                        print(f"    Length: {len(content)} chars")
                        print(f"    Preview: {content[:200]}...")
                except Exception as e:
                    print(f"    ERROR: {e}")

print(f"\nDone! Check files in: {output_dir}")
