# App Store Submission Checklist

## Google Play Store Requirements

### App Information
- [ ] **App Title**: Max 30 characters
- [ ] **Short Description**: Max 80 characters
- [ ] **Full Description**: Max 4000 characters
- [ ] **App Category**: Lifestyle or Health & Fitness
- [ ] **Content Rating**: Complete questionnaire
- [ ] **Contact Email**: Required
- [ ] **Privacy Policy URL**: Required (host on your website)

### Graphics Assets
- [ ] **App Icon**: 512x512 PNG (32-bit, no alpha)
- [ ] **Feature Graphic**: 1024x500 JPG or PNG
- [ ] **Screenshots**: 
  - Phone: 2-8 screenshots (16:9 or 9:16)
  - 7-inch tablet: Optional but recommended
  - 10-inch tablet: Optional but recommended

### Technical Requirements
- [ ] **Target API Level**: 34 (Android 14) or higher
- [ ] **64-bit Support**: Required
- [ ] **App Bundle**: Upload .aab file (not .apk)
- [ ] **Signed Release**: Signed with release keystore
- [ ] **Deobfuscation Files**: Upload mapping.txt

### App Content
- [ ] **Data Safety Form**: Complete all questions
- [ ] **Ads Declaration**: Declare if app contains ads
- [ ] **App Access**: Provide test credentials if needed
- [ ] **Content Rating**: Complete IARC questionnaire

### Store Listing
- [ ] **Default Language**: English (US)
- [ ] **Translations**: Optional but recommended
- [ ] **What's New**: Changelog for updates
- [ ] **Developer Name**: Displayed on store
- [ ] **Physical Address**: May be required for some countries

---

## Apple App Store Requirements

### App Information
- [ ] **App Name**: Max 30 characters
- [ ] **Subtitle**: Max 30 characters
- [ ] **Description**: Max 4000 characters
- [ ] **Promotional Text**: Max 170 characters (editable anytime)
- [ ] **Keywords**: Max 100 characters
- [ ] **Support URL**: Required
- [ ] **Privacy Policy URL**: Required
- [ ] **Category**: Primary and secondary

### App Screenshots
- [ ] **iPhone 6.7"** (1290 x 2796): 3-10 screenshots
- [ ] **iPhone 6.5"** (1242 x 2688): 3-10 screenshots
- [ ] **iPhone 5.5"** (1242 x 2208): 3-10 screenshots
- [ ] **iPad Pro 12.9" (6th gen)** (2048 x 2732): 3-10 screenshots
- [ ] **iPad Pro 12.9" (2nd gen)** (2048 x 2732): 3-10 screenshots

### App Icon
- [ ] **1024x1024 PNG**: No alpha, no rounded corners

### App Preview Videos (Optional)
- [ ] 15-30 seconds, app footage only
- [ ] Different sizes for different devices

### Technical Requirements
- [ ] **Minimum iOS Version**: iOS 12.0 or higher recommended
- [ ] **Architectures**: arm64 required, armv7 optional
- [ ] **Bitcode**: Enabled (optional for iOS 16+)
- [ ] **App Signing**: Valid distribution certificate
- [ ] **Provisioning Profile**: Valid App Store profile

### App Review Information
- [ ] **Contact Information**: Name, phone, email
- [ ] **Demo Account**: If login required
- [ ] **Notes for Review**: Explain any special features

### Privacy & Data Collection
- [ ] **App Privacy Details**: Complete all questions
  - Data types collected
  - Data linked to user
  - Data used for tracking
- [ ] **Tracking**: App Tracking Transparency if applicable

### In-App Purchases (if applicable)
- [ ] **IAP Configuration**: Set up in App Store Connect
- [ ] **IAP Screenshots**: For each purchase type
- [ ] **Review Notes**: Explain how to test IAPs

---

## Pre-Launch Checklist

### Code Quality
- [ ] Remove all debug code and print statements
- [ ] Test on multiple devices and OS versions
- [ ] Verify all API endpoints work in production
- [ ] Check error handling and crash reporting
- [ ] Verify analytics are configured correctly

### Legal
- [ ] Privacy Policy hosted and accessible
- [ ] Terms of Service (if required)
- [ ] Copyright and trademark compliance
- [ ] Third-party library licenses reviewed

### Security
- [ ] API keys not hardcoded in app
- [ ] Sensitive data encrypted
- [ ] Certificate pinning (optional but recommended)
- [ ] Network security config (Android)
- [ ] App Transport Security (iOS)

### Performance
- [ ] App size optimized (ProGuard/R8 enabled)
- [ ] Images compressed
- [ ] Network requests efficient
- [ ] Battery usage optimized
- [ ] Memory leaks checked

### Testing
- [ ] Unit tests passing
- [ ] Integration tests passing
- [ ] Manual QA completed
- [ ] Beta testing with real users
- [ ] Accessibility testing

---

## Post-Launch

### Monitoring
- [ ] Set up crash reporting (Firebase Crashlytics, Sentry)
- [ ] Set up analytics (Firebase Analytics, Mixpanel)
- [ ] Monitor app reviews and ratings
- [ ] Set up alerts for critical issues

### Marketing
- [ ] App Store Optimization (ASO)
- [ ] Press kit prepared
- [ ] Social media presence
- [ ] Landing page / website

### Maintenance
- [ ] Plan for regular updates
- [ ] Monitor API usage and costs
- [ ] Keep dependencies updated
- [ ] Respond to user feedback

---

## Store Listing Copy Template

### App Title
```
Mythic Jung - Know Yourself
```

### Short Description (Google Play - 80 chars)
```
Discover your psychological archetypes through the characters that resonate with you.
```

### Full Description
```
Mythic Jung helps you understand yourself better through the lens of Jungian psychology and the fictional characters you love.

🎭 DISCOVER YOUR ARCHETYPES
Select characters from movies, books, and TV shows that resonate with you. Our AI-powered analysis reveals your unique psychological profile based on Jungian archetypes.

📖 YOUR PERSONAL NARRATIVE
Receive a beautifully crafted story that weaves together your dominant archetypes, shadow aspects, and growth opportunities into a meaningful personal mythology.

💑 RELATIONSHIP INSIGHTS
Explore the dynamics between you and important people in your life. Understand compatibility patterns and discover paths to deeper connection.

🌟 KEY FEATURES
• Character-based personality analysis
• 12 Jungian archetype identification
• Personalized psychological narratives
• Relationship compatibility insights
• Beautiful, intuitive interface
• Privacy-focused design

Perfect for anyone interested in:
• Self-discovery and personal growth
• Jungian psychology and archetypes
• Understanding relationship patterns
• Meaningful psychological insights

Start your journey of self-discovery today with Mythic Jung.
```

### Keywords (iOS - 100 chars)
```
jung,archetypes,personality,psychology,self-discovery,relationships,character,analysis,growth,myth
```
