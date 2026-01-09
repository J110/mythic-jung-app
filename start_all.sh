#!/bin/bash

echo "Starting Mythic Jung App..."

# Start backend
echo "Starting backend server..."
cd /Users/anmolmohan/Projects/flutter_app/backend
npm start > /tmp/backend.log 2>&1 &
BACKEND_PID=$!
echo "Backend started (PID: $BACKEND_PID)"

# Wait for backend to be ready
sleep 3

# Regenerate Flutter models
echo "Regenerating Flutter models..."
cd /Users/anmolmohan/Projects/flutter_app
flutter pub run build_runner build --delete-conflicting-outputs

# Start Flutter app
echo "Starting Flutter app in Chrome..."
flutter run -d chrome > /tmp/flutter.log 2>&1 &
FLUTTER_PID=$!
echo "Flutter app started (PID: $FLUTTER_PID)"

echo ""
echo "Backend logs: tail -f /tmp/backend.log"
echo "Flutter logs: tail -f /tmp/flutter.log"
echo ""
echo "To stop: kill $BACKEND_PID $FLUTTER_PID"
