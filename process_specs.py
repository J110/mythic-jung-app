#!/usr/bin/env python3
"""
Script to extract and process the three spec zip files
Run this first, then the main update script will read the extracted files
"""
import zipfile
import os
import json

spec_dir = '/Users/anmolmohan/Projects/flutter_app/agent_spec'
extract_base = '/tmp/mythic_specs_processed'

zips = {
    'assessments': 'Mythic_Jung_Assessments_Agent_Pack.zip',
    'missing': 'Mythic_Jung_Missing_Analysis_Specs_Pack.zip',
    'core': 'Mythic_Jung_Core_Generation_Specs.zip'
}

os.makedirs(extract_base, exist_ok=True)

for key, zip_name in zips.items():
    zip_path = os.path.join(spec_dir, zip_name)
    if not os.path.exists(zip_path):
        print(f"Warning: {zip_name} not found")
        continue
    
    extract_dir = os.path.join(extract_base, key)
    os.makedirs(extract_dir, exist_ok=True)
    
    print(f"Extracting {zip_name}...")
    with zipfile.ZipFile(zip_path, 'r') as z:
        z.extractall(extract_dir)
        files = z.namelist()
        print(f"  Extracted {len(files)} files")
        
        # Find and print instruction files
        for f in files:
            if 'INSTRUCTIONS' in f.upper() or (f.endswith('.md') and 'INSTRUCT' in f.upper()):
                print(f"  Found instruction file: {f}")
                try:
                    content = z.read(f).decode('utf-8')
                    # Save to a readable location
                    output_file = os.path.join(extract_dir, os.path.basename(f))
                    with open(output_file, 'w') as out:
                        out.write(content)
                    print(f"    Saved to: {output_file}")
                except Exception as e:
                    print(f"    Error reading: {e}")

print(f"\nAll files extracted to: {extract_base}")
print("\nTo view instruction files:")
print(f"  cat {extract_base}/*/INSTRUCTIONS*")
print(f"  cat {extract_base}/*/*.md")
