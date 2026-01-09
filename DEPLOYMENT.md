# Deployment Guide - Mythic Jung App

This guide covers deploying the app for public testing using **Render** (backend) and **Vercel** (frontend).

---

## 🚀 Quick Start

### Prerequisites
- GitHub account (for connecting repositories)
- OpenAI API key

---

## Part 1: Deploy Backend to Render

### Step 1: Push Backend to GitHub

First, create a GitHub repository for your backend:

```bash
cd /Users/anmolmohan/Projects/flutter_app/backend
git init
git add .
git commit -m "Initial backend commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/mythic-jung-backend.git
git push -u origin main
```

### Step 2: Deploy on Render

1. Go to [https://render.com](https://render.com) and sign up/login
2. Click **"New +"** → **"Web Service"**
3. Connect your GitHub account and select the `mythic-jung-backend` repository
4. Configure the service:
   - **Name**: `mythic-jung-api`
   - **Region**: Choose closest to you
   - **Branch**: `main`
   - **Root Directory**: (leave empty)
   - **Runtime**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: `Free`

5. Add Environment Variables:
   - Click **"Add Environment Variable"**
   - Add: `OPENAI_API_KEY` = `your-openai-api-key`
   - Add: `NODE_ENV` = `production`

6. Click **"Create Web Service"**

7. Wait for deployment (2-5 minutes). You'll get a URL like:
   ```
   https://mythic-jung-api.onrender.com
   ```

8. Test it:
   ```bash
   curl https://mythic-jung-api.onrender.com/health
   ```

---

## Part 2: Deploy Frontend to Vercel

### Step 1: Push Frontend to GitHub

Create a separate repository for the Flutter app:

```bash
cd /Users/anmolmohan/Projects/flutter_app
git init
git add .
git commit -m "Initial frontend commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/mythic-jung-app.git
git push -u origin main
```

### Step 2: Deploy on Vercel

1. Go to [https://vercel.com](https://vercel.com) and sign up/login
2. Click **"Add New..."** → **"Project"**
3. Import your `mythic-jung-app` repository
4. Configure:
   - **Framework Preset**: `Other`
   - **Root Directory**: `.` (leave as is)
   - **Build Command**: 
     ```
     git clone https://github.com/flutter/flutter.git -b stable --depth 1 && flutter/bin/flutter pub get && flutter/bin/flutter build web --release --dart-define=API_BASE_URL=$API_BASE_URL
     ```
   - **Output Directory**: `build/web`
   - **Install Command**: (leave empty)

5. Add Environment Variable:
   - Click **"Environment Variables"**
   - Add: `API_BASE_URL` = `https://mythic-jung-api.onrender.com` (your Render URL)

6. Click **"Deploy"**

7. Wait for deployment (5-10 minutes for Flutter). You'll get a URL like:
   ```
   https://mythic-jung-app.vercel.app
   ```

---

## Part 3: Update Backend CORS (Optional)

If you get CORS errors, add your Vercel URL to the backend:

1. Go to Render Dashboard → Your Service → Environment
2. Add: `FRONTEND_URL` = `https://mythic-jung-app.vercel.app`
3. Redeploy

---

## 📋 Required Inputs from You

| Item | Where to Use | Example |
|------|--------------|---------|
| **GitHub Username** | Repository URLs | `yourusername` |
| **OpenAI API Key** | Render Environment Variables | `sk-proj-xxx...` |
| **Backend URL** | Vercel Environment Variables | `https://mythic-jung-api.onrender.com` |

---

## 🔧 Troubleshooting

### Backend Issues
- **500 errors**: Check Render logs for OpenAI API issues
- **Timeout**: Free tier may sleep after 15 mins of inactivity (first request takes ~30s)

### Frontend Issues
- **CORS errors**: Add Vercel URL to FRONTEND_URL in Render
- **API not found**: Verify API_BASE_URL is correct in Vercel

### Testing Locally with Production Backend
```bash
cd /Users/anmolmohan/Projects/flutter_app
flutter run -d chrome --dart-define=API_BASE_URL=https://mythic-jung-api.onrender.com
```

---

## 📱 Sharing the App

Once deployed, share this URL with testers:
```
https://mythic-jung-app.vercel.app
```

---

## 💰 Cost

Both Render and Vercel have generous free tiers:
- **Render Free**: 750 hours/month, sleeps after 15 min inactivity
- **Vercel Free**: Unlimited deployments, 100GB bandwidth

For production, consider:
- **Render Starter**: $7/month (no sleep)
- **Vercel Pro**: $20/month (team features)
