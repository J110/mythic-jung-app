# Mythic Jung - Deployment Guide

This guide covers deploying both the backend API and mobile apps to production.

## Table of Contents
1. [Backend Deployment](#backend-deployment)
2. [Mobile App Deployment](#mobile-app-deployment)
3. [Environment Configuration](#environment-configuration)
4. [Monitoring & Maintenance](#monitoring--maintenance)

---

## Backend Deployment

### Prerequisites
- GCP account with billing enabled
- Domain name with DNS access
- OpenAI API key

### Option 1: Automated Setup (Recommended)

1. **Create GCP VM**
   ```bash
   # Create VM (e2-small is sufficient for low traffic)
   gcloud compute instances create mythicjung-api \
     --machine-type=e2-small \
     --zone=us-central1-a \
     --image-family=ubuntu-2204-lts \
     --image-project=ubuntu-os-cloud \
     --boot-disk-size=20GB \
     --tags=http-server,https-server
   
   # Create firewall rules
   gcloud compute firewall-rules create allow-http \
     --allow tcp:80 --target-tags=http-server
   gcloud compute firewall-rules create allow-https \
     --allow tcp:443 --target-tags=https-server
   ```

2. **SSH into VM and run setup script**
   ```bash
   gcloud compute ssh mythicjung-api --zone=us-central1-a
   
   # Clone repository
   git clone https://github.com/yourusername/mythicjung.git /opt/mythicjung
   
   # Run setup script
   cd /opt/mythicjung/backend
   sudo bash deploy/setup-server.sh
   ```

3. **Configure DNS**
   - Point your API domain (e.g., `api.mythicjung.com`) to the VM's external IP

4. **Verify deployment**
   ```bash
   curl https://api.mythicjung.com/health
   ```

### Option 2: Manual Setup

1. **Install dependencies**
   ```bash
   # Update system
   sudo apt update && sudo apt upgrade -y
   
   # Install Node.js 20.x
   curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
   sudo apt install -y nodejs
   
   # Install PostgreSQL
   sudo apt install -y postgresql postgresql-contrib
   
   # Install Nginx
   sudo apt install -y nginx certbot python3-certbot-nginx
   ```

2. **Configure PostgreSQL**
   ```bash
   sudo -u postgres psql
   ```
   ```sql
   CREATE USER mythicjung WITH ENCRYPTED PASSWORD 'your-strong-password';
   CREATE DATABASE mythicjung_prod OWNER mythicjung;
   GRANT ALL PRIVILEGES ON DATABASE mythicjung_prod TO mythicjung;
   \c mythicjung_prod
   CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
   \q
   ```

3. **Deploy backend code**
   ```bash
   # Create app directory
   sudo mkdir -p /opt/mythicjung/backend
   sudo chown -R $USER:$USER /opt/mythicjung
   
   # Copy backend code
   rsync -avz ./backend/ /opt/mythicjung/backend/
   
   # Install dependencies
   cd /opt/mythicjung/backend
   npm install --production
   ```

4. **Create environment file**
   ```bash
   cat > /opt/mythicjung/backend/.env << EOF
   NODE_ENV=production
   PORT=3001
   HOST=127.0.0.1
   OPENAI_API_KEY=your-openai-key
   DATABASE_URL="postgresql://mythicjung:your-password@localhost:5432/mythicjung_prod"
   FRONTEND_URL=https://your-frontend-domain.com
   EOF
   chmod 600 /opt/mythicjung/backend/.env
   ```

5. **Initialize database**
   ```bash
   cd /opt/mythicjung/backend
   npx prisma generate
   npx prisma db push
   ```

6. **Setup systemd service**
   ```bash
   sudo cp deploy/mythicjung.service /etc/systemd/system/
   sudo systemctl daemon-reload
   sudo systemctl enable mythicjung
   sudo systemctl start mythicjung
   ```

7. **Configure Nginx**
   ```bash
   # Copy and update nginx config
   sudo cp deploy/nginx.conf /etc/nginx/sites-available/mythicjung
   sudo sed -i 's/api.your-domain.com/your-actual-domain.com/g' /etc/nginx/sites-available/mythicjung
   sudo ln -sf /etc/nginx/sites-available/mythicjung /etc/nginx/sites-enabled/
   sudo rm -f /etc/nginx/sites-enabled/default
   sudo nginx -t
   sudo systemctl reload nginx
   ```

8. **Setup SSL**
   ```bash
   sudo certbot --nginx -d your-api-domain.com
   ```

---

## Mobile App Deployment

### Android (Google Play Store)

#### Prerequisites
- Google Play Developer account ($25 one-time fee)
- Release keystore

#### Create Keystore
```bash
keytool -genkey -v -keystore android/app/keystore/release.keystore \
  -alias mythicjung -keyalg RSA -keysize 2048 -validity 10000
```

#### Configure signing
Create `android/local.properties`:
```properties
KEYSTORE_PATH=keystore/release.keystore
KEYSTORE_PASSWORD=your-keystore-password
KEY_ALIAS=mythicjung
KEY_PASSWORD=your-key-password
```

#### Build for release
```bash
# Using build script
./scripts/build-android.sh prod

# Or manually
flutter build appbundle --release \
  --dart-define=API_BASE_URL=https://api.mythicjung.com \
  --dart-define=USE_MOCK=false \
  --dart-define=PRODUCTION=true
```

#### Upload to Play Store
1. Go to [Google Play Console](https://play.google.com/console)
2. Create new app
3. Fill out store listing (description, screenshots, etc.)
4. Upload AAB file from `build/app/outputs/bundle/productionRelease/`
5. Complete content rating questionnaire
6. Set up pricing and distribution
7. Submit for review

### iOS (App Store)

#### Prerequisites
- Apple Developer account ($99/year)
- macOS with Xcode
- Valid provisioning profiles

#### Configure signing
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select the Runner target
3. Under "Signing & Capabilities", select your team
4. Configure bundle identifier: `com.mythicjung.app`

#### Build for release
```bash
# Using build script
./scripts/build-ios.sh prod

# Or manually
flutter build ios --release \
  --dart-define=API_BASE_URL=https://api.mythicjung.com \
  --dart-define=USE_MOCK=false \
  --dart-define=PRODUCTION=true
```

#### Upload to App Store
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select "Any iOS Device" as target
3. Product > Archive
4. In Organizer, click "Distribute App"
5. Select "App Store Connect"
6. Follow the wizard to upload

#### App Store Connect
1. Go to [App Store Connect](https://appstoreconnect.apple.com)
2. Create new app
3. Fill out app information
4. Add screenshots for all required device sizes
5. Complete App Privacy questionnaire
6. Submit for review

---

## Environment Configuration

### Backend Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `OPENAI_API_KEY` | Yes | OpenAI API key |
| `DATABASE_URL` | Yes* | PostgreSQL connection string |
| `NODE_ENV` | No | `development` or `production` |
| `PORT` | No | Server port (default: 3001) |
| `HOST` | No | Server host (default: 0.0.0.0) |
| `FRONTEND_URL` | No | CORS allowed origin |
| `REDIS_URL` | No | Redis connection for caching |

*Required for production. Uses in-memory storage in development.

### Flutter Build Arguments

| Argument | Default | Description |
|----------|---------|-------------|
| `API_BASE_URL` | `http://127.0.0.1:3001` | Backend API URL |
| `USE_MOCK` | `false` | Use mock data |
| `PRODUCTION` | `false` | Production mode |
| `APP_VERSION` | `1.0.0` | App version string |
| `ENABLE_ANALYTICS` | `false` | Enable analytics |
| `SENTRY_DSN` | - | Sentry error tracking DSN |

---

## Monitoring & Maintenance

### View logs
```bash
# Backend logs
sudo journalctl -u mythicjung -f

# Nginx access logs
sudo tail -f /var/log/nginx/mythicjung_access.log

# Nginx error logs
sudo tail -f /var/log/nginx/mythicjung_error.log
```

### Restart services
```bash
sudo systemctl restart mythicjung
sudo systemctl restart nginx
```

### Update backend
```bash
cd /opt/mythicjung/backend
git pull origin main
npm install --production
npx prisma db push
sudo systemctl restart mythicjung
```

### Database backup
```bash
# Backup
pg_dump -U mythicjung mythicjung_prod > backup_$(date +%Y%m%d).sql

# Restore
psql -U mythicjung mythicjung_prod < backup_YYYYMMDD.sql
```

### SSL certificate renewal
```bash
# Test renewal
sudo certbot renew --dry-run

# Force renewal
sudo certbot renew --force-renewal
```

---

## Troubleshooting

### Backend won't start
```bash
# Check service status
sudo systemctl status mythicjung

# Check logs
sudo journalctl -u mythicjung -n 50

# Check if port is in use
sudo lsof -i :3001
```

### Database connection issues
```bash
# Check PostgreSQL status
sudo systemctl status postgresql

# Test connection
psql -U mythicjung -h localhost -d mythicjung_prod

# Check pg_hba.conf for local connections
sudo nano /etc/postgresql/14/main/pg_hba.conf
```

### CORS issues
- Ensure `FRONTEND_URL` is set correctly in backend `.env`
- Check Nginx configuration passes proper headers
- Verify SSL certificate is valid

### App can't connect to API
- Verify API URL in Flutter build arguments
- Check network permissions in AndroidManifest.xml / Info.plist
- Test API endpoint: `curl https://api.mythicjung.com/health`
