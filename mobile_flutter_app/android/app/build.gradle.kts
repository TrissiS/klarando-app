plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

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
    }

    flavorDimensions += "app"
    productFlavors {
        create("customer") {
            dimension = "app"
            applicationId = "com.klarando.customer"
            manifestPlaceholders["appName"] = "Klarando"
            resValue("string", "app_name", "Klarando")
        }

        create("driver") {
            dimension = "app"
            applicationId = "com.klarando.driver"
            manifestPlaceholders["appName"] = "Klarando Driver"
            resValue("string", "app_name", "Klarando Driver")
        }

        create("orderdesk") {
            dimension = "app"
            applicationId = "com.klarando.orderdesk"
            manifestPlaceholders["appName"] = "Klarando OrderDesk"
            resValue("string", "app_name", "Klarando OrderDesk")
        }
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
