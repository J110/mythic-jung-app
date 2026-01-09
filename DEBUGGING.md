# Debugging Guide: Backend Not Refreshing

## The Problem
The app is showing static values instead of dynamic content from the backend.

## Root Causes & Solutions

### 1. Backend Not Running
**Check:**
```bash
curl http://127.0.0.1:3000/health
```

**Fix:**
```bash
cd /Users/anmolmohan/Projects/flutter_app/backend
npm install
npm start
```

### 2. App Using Cached Fixture Data
The app might have old fixture data cached in the local database.

**Fix:** Clear the app data:
- In Chrome DevTools: Application → Storage → Clear site data
- Or restart the app and it should clear on first load

### 3. Backend Connection Failing Silently
The app might be failing to connect but falling back to cached data.

**Check Browser Console (F12):**
Look for these messages:
- `💾 Saving X characters to backend...` - Should appear when selecting characters
- `🔄 Calling backend to generate output...` - Should appear when generating
- `✅ Backend generated output successfully` - Success message
- `❌ Backend error: ...` - Error messages

### 4. CORS Issues
**Check:** Browser console for CORS errors

**Fix:** Backend already has CORS enabled, but verify in `src/server.js`:
```javascript
app.use(cors());
```

## Step-by-Step Debugging

1. **Start Backend:**
   ```bash
   cd /Users/anmolmohan/Projects/flutter_app/backend
   npm start
   ```
   Keep this terminal open and watch for requests.

2. **Test Backend Directly:**
   ```bash
   # Test health
   curl http://127.0.0.1:3000/health
   
   # Test profile save
   curl -X POST http://127.0.0.1:3000/v1/profile \
     -H "Content-Type: application/json" \
     -d '{"characters": [{"id": "test", "displayName": "Test"}]}'
   
   # Test generation
   curl -X POST http://127.0.0.1:3000/v1/generate \
     -H "Content-Type: application/json" \
     -d '{"force": true}'
   ```

3. **Check Flutter App:**
   - Open Chrome DevTools (F12)
   - Go to Console tab
   - Look for the emoji-prefixed messages
   - Check Network tab to see if requests are being made

4. **Verify Configuration:**
   Check `lib/core/storage/repositories.dart` line 20-22:
   ```dart
   return ApiClient(
     baseUrl: 'http://127.0.0.1:3000',
     useMock: false,  // Must be false!
   );
   ```

## Quick Fix: Force Clear Cache

If you want to force the app to use backend:

1. Open Chrome DevTools (F12)
2. Go to Console
3. Run:
   ```javascript
   // This will clear all local storage
   localStorage.clear();
   indexedDB.deleteDatabase('app_database');
   ```
4. Refresh the page

## Expected Behavior

When working correctly:
1. Select characters → Console shows `💾 Saving X characters to backend...`
2. Backend terminal shows: `Profile updated for user default-user...`
3. Console shows: `🔄 Calling backend to generate output...`
4. Backend terminal shows: `Generating output for user...`
5. Console shows: `✅ Backend generated output successfully`
6. UI updates with new dynamic content

## Still Not Working?

1. Check backend terminal for errors
2. Check browser console for errors
3. Verify backend is actually receiving requests (check backend terminal logs)
4. Try accessing `http://127.0.0.1:3000/health` directly in browser
