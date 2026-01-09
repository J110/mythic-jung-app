# Testing Backend Connection

## Quick Test Steps

1. **Start the backend** (in a separate terminal):
   ```bash
   cd /Users/anmolmohan/Projects/flutter_app/backend
   npm install  # if not done already
   npm start
   ```
   
   You should see:
   ```
   Server running on http://localhost:3000
   ```

2. **Test the backend directly** (in another terminal or browser):
   ```bash
   curl http://127.0.0.1:3000/health
   ```
   
   Should return: `{"status":"ok","timestamp":"..."}`

3. **Test profile endpoint**:
   ```bash
   curl -X POST http://127.0.0.1:3000/v1/profile \
     -H "Content-Type: application/json" \
     -d '{"characters": [{"id": "test1", "displayName": "Test Character"}]}'
   ```

4. **Test generation endpoint**:
   ```bash
   curl -X POST http://127.0.0.1:3000/v1/generate \
     -H "Content-Type: application/json" \
     -d '{"force": true}'
   ```

5. **Check Flutter app console** (F12 in Chrome):
   - Look for messages starting with: `💾`, `🔄`, `✅`, `❌`
   - These show what the app is doing

## Common Issues

- **Backend not running**: Make sure `npm start` shows the server is running
- **CORS errors**: Backend has CORS enabled, but check browser console
- **Connection refused**: Backend might not be on port 3000
- **Static values**: App might be using cached data - try clearing browser cache

## Debug Commands

```bash
# Check if backend is running
lsof -ti:3000

# View backend logs
tail -f /tmp/backend.log

# Kill backend
pkill -f "node.*server"
```
