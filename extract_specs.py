#!/usr/bin/env python3
import zipfile
import os
import json
import sys

spec_dir = '/Users/anmolmohan/Projects/flutter_app/agent_spec'
zips = [
    'Mythic_Jung_Assessments_Agent_Pack.zip',
    'Mythic_Jung_Missing_Analysis_Specs_Pack.zip', 
    'Mythic_Jung_Core_Generation_Specs.zip'
]

output_dir = '/tmp/mythic_specs_extracted'
os.makedirs(output_dir, exist_ok=True)

for zip_file in zips:
    zip_path = os.path.join(spec_dir, zip_file)
    if not os.path.exists(zip_path):
        print(f"Warning: {zip_file} not found at {zip_path}")
        continue
    
    extract_dir = os.path.join(output_dir, zip_file.replace('.zip', ''))
    os.makedirs(extract_dir, exist_ok=True)
    
    print(f"\n=== Extracting {zip_file} ===")
    with zipfile.ZipFile(zip_path, 'r') as z:
        z.extractall(extract_dir)
        files = z.namelist()
        print(f"Extracted {len(files)} files")
        
        # List important files
        important = [f for f in files if any(x in f.upper() for x in ['INSTRUCTIONS', 'README', 'SPEC', 'SCHEMA'])]
        if important:
            print(f"Important files: {important}")

print(f"\nAll specs extracted to: {output_dir}")
print("\nFiles extracted:")
for root, dirs, files in os.walk(output_dir):
    for f in files:
        if f.endswith(('.md', '.txt', '.json', '.yaml', '.yml')):
            print(f"  {os.path.join(root, f)}")
