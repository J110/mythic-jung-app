# Fixing Evidence Issues

## Issues to Fix:
1. Evidence subcategory still showing as separate card
2. Shadow subcategory missing evidence button

## Steps to Fix:

### 1. Clear App Cache and Restart
The app may be using cached data. Do a full restart:

```bash
# Stop the Flutter app completely
# Then restart:
cd /Users/anmolmohan/Projects/flutter_app
flutter clean
flutter pub get
flutter run -d chrome
```

### 2. Restart Backend
```bash
cd /Users/anmolmohan/Projects/flutter_app/backend
# Kill existing backend
pkill -f "node.*server"
# Start fresh
npm start
```

### 3. Force Regeneration
After restarting both, in the Flutter app:
- Clear all selected characters
- Reselect your 6 characters
- This will force a fresh generation with the new evidence logic

### 4. Check Backend Logs
When you regenerate, check the backend terminal for:
```
[Evidence] Character map: { shadow: [...] }
[Evidence] Added fallback evidence for identification.shadow: [...]
[Evidence] Total evidence items: X
```

### 5. Check Flutter Console
In Chrome DevTools (F12), check the console for:
```
Shadow evidence check: targetPath=identification.shadow, hasEvidence=true
All evidence paths: [...]
```

## What Should Happen:
- ✅ No separate "Evidence" card in identification tab
- ✅ Each archetype card (Ego, Persona, Shadow, etc.) has an "Evidence" button
- ✅ Shadow card shows the Evidence button
- ✅ Clicking Evidence on Shadow shows character references and assessment references

## If Still Not Working:
1. Check backend terminal logs when generating
2. Check Flutter console for evidence debug messages
3. Verify the generated JSON has evidence for shadow:
   - Look at the network response in Chrome DevTools
   - Check if `identification.evidence` array has an item with `targetPath: "identification.shadow"`
