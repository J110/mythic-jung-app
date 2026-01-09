# Extracting and Reading Spec Files

I need to read the instruction files from the three zip files. Please run this command to extract them:

```bash
cd /Users/anmolmohan/Projects/flutter_app/agent_spec
python3 << 'EOF'
import zipfile
import os

zips = {
    'assessments': 'Mythic_Jung_Assessments_Agent_Pack.zip',
    'missing': 'Mythic_Jung_Missing_Analysis_Specs_Pack.zip',
    'core': 'Mythic_Jung_Core_Generation_Specs.zip'
}

for key, zip_name in zips.items():
    if os.path.exists(zip_name):
        print(f"\n=== {zip_name} ===")
        with zipfile.ZipFile(zip_name) as z:
            files = z.namelist()
            print(f"Files: {len(files)}")
            for f in files:
                if 'INSTRUCTIONS' in f.upper() or (f.endswith('.md') and 'INSTRUCT' in f.upper()):
                    print(f"\nReading: {f}")
                    content = z.read(f).decode('utf-8')
                    # Save to temp location
                    output = f'/tmp/spec_{key}_{os.path.basename(f)}'
                    with open(output, 'w') as out:
                        out.write(content)
                    print(f"Saved to: {output}")
                    print(content[:500])
                    print("...")
EOF
```

After running this, I'll be able to read the instruction files and update the backend and frontend accordingly.
