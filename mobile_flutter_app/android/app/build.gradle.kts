import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

val hasReleaseKeystore = keystoreProperties["storeFile"] != null &&
    rootProject.file(keystoreProperties["storeFile"] as String).exists()

android {
    namespace = "com.klarando.mobile"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.klarando.customer"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        manifestPlaceholders["appName"] = "Klarando"
        manifestPlaceholders["appIcon"] = "@mipmap/ic_launcher"
    }

    flavorDimensions += "app"
    productFlavors {
        create("customer") {
            dimension = "app"
            applicationId = "com.klarando.customer"
            manifestPlaceholders["appName"] = "Klarando"
            manifestPlaceholders["appIcon"] = "@drawable/ic_launcher_customer"
            resValue("string", "app_name", "Klarando")
        }

        create("driver") {
            dimension = "app"
            applicationId = "com.klarando.driver"
            manifestPlaceholders["appName"] = "Klarando Driver"
            manifestPlaceholders["appIcon"] = "@drawable/ic_launcher_driver"
            resValue("string", "app_name", "Klarando Driver")
        }

        create("orderdesk") {
            dimension = "app"
            applicationId = "com.klarando.orderdesk"
            manifestPlaceholders["appName"] = "Klarando OrderDesk"
            manifestPlaceholders["appIcon"] = "@drawable/ic_launcher_orderdesk"
            resValue("string", "app_name", "Klarando OrderDesk")
        }
    }

    signingConfigs {
        if (hasReleaseKeystore) {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = rootProject.file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        debug {
            signingConfig = signingConfigs.getByName("debug")
        }
        release {
            signingConfig = if (hasReleaseKeystore) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
        }
    }
}

flutter {
    source = "../.."
}

