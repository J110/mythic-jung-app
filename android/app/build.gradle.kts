plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// Load local.properties file
val localProperties = mutableMapOf<String, String>()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.readLines().forEach { line ->
        val trimmed = line.trim()
        if (trimmed.isNotEmpty() && !trimmed.startsWith("#") && trimmed.contains("=")) {
            val (key, value) = trimmed.split("=", limit = 2)
            localProperties[key.trim()] = value.trim()
        }
    }
}

fun getLocalProperty(key: String): String? {
    return System.getenv(key) ?: localProperties[key]
}

android {
    namespace = "com.mythicjung.app"
    compileSdk = 36
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlin {
        compilerOptions {
            jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
        }
    }

    defaultConfig {
        applicationId = "com.mythicjung.app"
        minSdk = 24
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        
        // Multidex for large apps
        multiDexEnabled = true
    }

    signingConfigs {
        create("release") {
            // These values should be stored in local.properties or environment variables
            // DO NOT commit actual keystore passwords to version control
            val keystorePath = getLocalProperty("KEYSTORE_PATH") ?: "keystore/release.keystore"
            val keystorePassword = getLocalProperty("KEYSTORE_PASSWORD") ?: ""
            val keyAlias = getLocalProperty("KEY_ALIAS") ?: "mythicjung"
            val keyPassword = getLocalProperty("KEY_PASSWORD") ?: ""
            
            if (keystorePassword.isNotEmpty()) {
                val keystoreFile = file(keystorePath)
                if (keystoreFile.exists()) {
                    storeFile = keystoreFile
                    storePassword = keystorePassword
                    this.keyAlias = keyAlias
                    this.keyPassword = keyPassword
                }
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
                // Check if ALLOW_DEBUG_SIGNING is set (for local testing only)
                val allowDebugSigning = getLocalProperty("ALLOW_DEBUG_SIGNING")?.toBoolean() == true
                if (allowDebugSigning) {
                    println("WARNING: Using debug signing for release build. This is only for local testing!")
                    signingConfig = signingConfigs.getByName("debug")
                } else {
                    throw GradleException(
                        """
                        ERROR: Release signing is not configured!
                        
                        To fix this:
                        1. Create a keystore:
                           keytool -genkey -v -keystore android/app/keystore/release.keystore \\
                             -alias mythicjung -keyalg RSA -keysize 2048 -validity 10000
                        
                        2. Add signing credentials to android/local.properties:
                           KEYSTORE_PATH=keystore/release.keystore
                           KEYSTORE_PASSWORD=your-keystore-password
                           KEY_ALIAS=mythicjung
                           KEY_PASSWORD=your-key-password
                        
                        For local testing only, you can add:
                           ALLOW_DEBUG_SIGNING=true
                        
                        See DEPLOYMENT.md for more details.
                        """.trimIndent()
                    )
                }
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
