plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.mythicjung.app"
    compileSdk = 34
    ndkVersion = "26.1.10909125"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.mythicjung.app"
        minSdk = 24
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        
        // Multidex for large apps
        multiDexEnabled = true
    }

    signingConfigs {
        create("release") {
            // These values should be stored in local.properties or environment variables
            // DO NOT commit actual keystore passwords to version control
            val keystorePath = System.getenv("KEYSTORE_PATH") ?: findProperty("KEYSTORE_PATH")?.toString() ?: "keystore/release.keystore"
            val keystorePassword = System.getenv("KEYSTORE_PASSWORD") ?: findProperty("KEYSTORE_PASSWORD")?.toString() ?: ""
            val keyAlias = System.getenv("KEY_ALIAS") ?: findProperty("KEY_ALIAS")?.toString() ?: "mythicjung"
            val keyPassword = System.getenv("KEY_PASSWORD") ?: findProperty("KEY_PASSWORD")?.toString() ?: ""
            
            if (keystorePassword.isNotEmpty()) {
                storeFile = file(keystorePath)
                storePassword = keystorePassword
                this.keyAlias = keyAlias
                this.keyPassword = keyPassword
            }
        }
    }

    buildTypes {
        getByName("debug") {
            applicationIdSuffix = ".debug"
            isDebuggable = true
        }
        
        getByName("release") {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            
            // Use release signing config if available
            val releaseConfig = signingConfigs.findByName("release")
            if (releaseConfig != null && releaseConfig.storeFile?.exists() == true) {
                signingConfig = releaseConfig
            } else {
                // Fallback to debug signing for local testing
                signingConfig = signingConfigs.getByName("debug")
            }
        }
    }

    // Flavor dimensions for different environments
    flavorDimensions += "environment"
    
    productFlavors {
        create("development") {
            dimension = "environment"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            resValue("string", "app_name", "Mythic Jung Dev")
        }
        
        create("staging") {
            dimension = "environment"
            applicationIdSuffix = ".staging"
            versionNameSuffix = "-staging"
            resValue("string", "app_name", "Mythic Jung Staging")
        }
        
        create("production") {
            dimension = "environment"
            resValue("string", "app_name", "Mythic Jung")
        }
    }

    lint {
        disable += "InvalidPackage"
        checkReleaseBuilds = false
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("androidx.multidex:multidex:2.0.1")
}
