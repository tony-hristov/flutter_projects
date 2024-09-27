## Greenlight

# Keep Jetpack Compose classes
-keep class androidx.compose.** { *; }
-dontwarn androidx.compose.**

# Keep Kotlin metadata
-keep class kotlin.Metadata { *; }

# Keep Jetpack Compose Compiler Plugin
-keep class androidx.compose.compiler.plugins.kotlin.** { *; }
-dontwarn androidx.compose.compiler.plugins.kotlin.**

# Keep Jetpack Compose runtime
-keep class androidx.compose.runtime.** { *; }
-dontwarn androidx.compose.runtime.**

# Keep Jetpack Compose UI
-keep class androidx.compose.ui.** { *; }
-dontwarn androidx.compose.ui.**

# Keep Jetpack Compose Foundation
-keep class androidx.compose.foundation.** { *; }
-dontwarn androidx.compose.foundation.**

# Keep Jetpack Compose Material
-keep class androidx.compose.material.** { *; }
-dontwarn androidx.compose.material.**

-keep class kotlinx.coroutines.android.AndroidExceptionPreHandler
-keep class kotlinx.coroutines.android.AndroidDispatcherFactory
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory
-keepclassmembernames class kotlinx.** { volatile <fields>; }


# Greenlight SDK

-keep class me.greenlight.** { *; }

# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn com.androidadvance.topsnackbar.R$id
-dontwarn com.androidadvance.topsnackbar.TSnackbar$Callback
-dontwarn com.androidadvance.topsnackbar.TSnackbar
-dontwarn com.segment.analytics.Analytics
-dontwarn com.segment.analytics.Properties
-dontwarn dagger.hilt.InstallIn
-dontwarn dagger.hilt.codegen.OriginatingElement
-dontwarn dagger.hilt.components.SingletonComponent
-dontwarn io.sentry.Sentry
-dontwarn io.sentry.context.Context
-dontwarn io.sentry.event.Breadcrumb
-dontwarn io.sentry.event.BreadcrumbBuilder
