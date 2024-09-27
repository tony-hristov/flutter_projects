package com.example.greenlight_plugin

import AlkamiGreenlightAuthenticator
import AlkamiGreenlightErrorListener
import AlkamiGreenlightEventListener
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import androidx.compose.ui.graphics.Color
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import me.greenlight.partner.GreenlightSDK
import me.greenlight.partner.GreenlightSDKConfiguration
import me.greenlight.partner.GreenlightSDKEnvironment
import me.greenlight.partner.theming.GreenlightSDKButtonShapes
import me.greenlight.partner.theming.GreenlightSDKCardShapes
import me.greenlight.partner.theming.GreenlightSDKColors
import me.greenlight.partner.theming.GreenlightSDKComposeColors
import me.greenlight.partner.theming.GreenlightSDKShapes
import me.greenlight.partner.theming.GreenlightSDKTheme
import me.greenlight.partner.theming.defaultGreenlightSDKLightColors
import me.greenlight.partner.theming.defaultGreenlightSDKShapes

/**
 * Provides an entry point for configuring the SDK, setting handlers for jwt token, error, and user
 * events and launching the SDK
 */
class GreenlightPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
        companion object {
                /// The MethodChannel that will facilitate the communication between Flutter and
                // native Android
                ///
                /// This local reference serves to register the plugin with the Flutter Engine and
                // unregister it
                /// when the Flutter Engine is detached from the Activity
                lateinit var channel: MethodChannel
        }
        private lateinit var context: Context
        private lateinit var activity: Activity
        val GREENLIGHT_ACTIVITY_LAUNCH_CODE: Int = 1

        /** Register the plugin and setup a method channel */
        override fun onAttachedToEngine(
                @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
        ) {
                channel =
                        MethodChannel(
                                flutterPluginBinding.binaryMessenger,
                                "channels.alkami.com/greenlight"
                        )
                channel.setMethodCallHandler(this)
                context = flutterPluginBinding.applicationContext
        }

        /** Handle messages from Flutter */
        override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
                if (call.method == "launchSDK") {
                        launchSDK(call, result)
                } else {
                        result.notImplemented()
                }
        }

        override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
                channel.setMethodCallHandler(null)
        }

        override fun onAttachedToActivity(binding: ActivityPluginBinding) {
                activity = binding.activity
                activity.actionBar?.hide()
        }

        override fun onDetachedFromActivityForConfigChanges() {}

        override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
                onAttachedToActivity(binding)
        }

        override fun onDetachedFromActivity() {}

        /** Launch the Greenlight SDK */
        private fun launchSDK(@NonNull call: MethodCall, @NonNull result: Result) {
                val familyUid: String =
                        call.argument<String>("familyUid")
                                ?: kotlin.run {
                                        result.error(
                                                "Greenlight did not get familyUid",
                                                "Greenlight did not get familyUid",
                                                "Greenlight did not get familyUid"
                                        )
                                        return
                                }
                val isProduction: Boolean =
                        call.argument<Boolean>("isProduction")
                                ?: kotlin.run {
                                        result.error(
                                                "Greenlight did not get isProduction",
                                                "Greenlight did not get isProduction",
                                                "Greenlight did not get isProduction"
                                        )
                                        return
                                }
                val initialChildId: Int? = call.argument<Int?>("initialChildId")
                val themeData: ThemeDataType? = call.argument<ThemeDataType?>("themeData")

                log("Greenlight: Configuring Greenlight with isProduction=$isProduction")

                val configuration =
                        GreenlightSDKConfiguration(
                                environment =
                                        if (isProduction) GreenlightSDKEnvironment.Production
                                        else GreenlightSDKEnvironment.Staging,
                                authentication = AlkamiGreenlightAuthenticator(),
                                errorListener = AlkamiGreenlightErrorListener(),
                                eventListener = AlkamiGreenlightEventListener(),
//                                theme =
//                                        GreenlightSDKTheme(
//                                                colors =
//                                                        GreenlightSDKColors(
//                                                                light =
//                                                                        getLightThemeColors(
//                                                                                themeData
//                                                                        )
//                                                        ),
//                                                shapes = getThemeShapes(themeData),
//                                        )
                        )

                GreenlightSDK.init(configuration, context = context)
                GreenlightSDK.launchChildDashboard(activity, familyUid, initialChildId)
//
//                activity.let { safeActivity ->
//                        val intent = Intent(safeActivity, GreenlightActivity::class.java)
//
//                        intent.putExtra("familyUid", familyUid)
//                        intent.putExtra("initialChildId", initialChildId)
//
//                        log(
//                                "Greenlight: Starting Greenlight activity with familyUid=$familyUid, initialChildId=$initialChildId"
//                        )
//
//                        safeActivity.startActivityForResult(intent, GREENLIGHT_ACTIVITY_LAUNCH_CODE)
//                }

                result.success(true)
        }

        /** Get all the colors from the theme data to initialize a light theme */
        private fun getLightThemeColors(themeData: ThemeDataType?): GreenlightSDKComposeColors {
                val defaults = defaultGreenlightSDKLightColors()
                if (themeData == null) {
                        return defaults
                }
                val themeColors = themeData["colors"]
                return defaults.copy(
                        // Surface colors //

                        // Screen Surface colors
                        screenSurface =
                                getThemeColor(
                                        themeColors?.get("screenSurface"),
                                        defaults.screenSurface
                                ),
                        onScreenSurface =
                                getThemeColor(
                                        themeColors?.get("onScreenSurface"),
                                        defaults.onScreenSurface
                                ),
                        onScreenSurfaceSubdued =
                                getThemeColor(
                                        themeColors?.get("onScreenSurfaceSubdued"),
                                        defaults.onScreenSurfaceSubdued
                                ),

                        // Primary Surface colors
                        primarySurface =
                                getThemeColor(
                                        themeColors?.get("primarySurface"),
                                        defaults.primarySurface
                                ),
                        onPrimarySurface =
                                getThemeColor(
                                        themeColors?.get("onPrimarySurface"),
                                        defaults.onPrimarySurface
                                ),
                        onPrimarySurfaceSubdued =
                                getThemeColor(
                                        themeColors?.get("onPrimarySurfaceSubdued"),
                                        defaults.onPrimarySurfaceSubdued
                                ),

                        // Secondary Surface colors
                        secondarySurface =
                                getThemeColor(
                                        themeColors?.get("secondarySurface"),
                                        defaults.secondarySurface
                                ),
                        onSecondarySurface =
                                getThemeColor(
                                        themeColors?.get("onSecondarySurface"),
                                        defaults.onSecondarySurface
                                ),
                        onSecondarySurfaceSubdued =
                                getThemeColor(
                                        themeColors?.get("onSecondarySurfaceSubdued"),
                                        defaults.onSecondarySurfaceSubdued
                                ),

                        // Interaction colors //

                        // Primary colors
                        primary = getThemeColor(themeColors?.get("primary"), defaults.primary),
                        onPrimary =
                                getThemeColor(themeColors?.get("onPrimary"), defaults.onPrimary),

                        // Primary Variant colors
                        primaryVariant =
                                getThemeColor(
                                        themeColors?.get("primaryVariant"),
                                        defaults.primaryVariant
                                ),
                        onPrimaryVariant =
                                getThemeColor(
                                        themeColors?.get("onPrimaryVariant"),
                                        defaults.onPrimaryVariant
                                ),

                        // Secondary colors
                        secondary =
                                getThemeColor(themeColors?.get("secondary"), defaults.secondary),
                        onSecondary =
                                getThemeColor(
                                        themeColors?.get("onSecondary"),
                                        defaults.onSecondary
                                ),

                        // Tertiary colors
                        tertiary = getThemeColor(themeColors?.get("tertiary"), defaults.tertiary),
                        onTertiary =
                                getThemeColor(themeColors?.get("onTertiary"), defaults.onTertiary),

                        // Supplementary Surface colors //

                        // Positive
                        positiveSurface =
                                getThemeColor(
                                        themeColors?.get("positiveSurface"),
                                        defaults.positiveSurface
                                ),
                        onPositiveAsset =
                                getThemeColor(
                                        themeColors?.get("onPositiveAsset"),
                                        defaults.onPositiveAsset
                                ),

                        // Negative
                        negativeSurface =
                                getThemeColor(
                                        themeColors?.get("negativeSurface"),
                                        defaults.negativeSurface
                                ),
                        onNegativeAsset =
                                getThemeColor(
                                        themeColors?.get("onNegativeAsset"),
                                        defaults.onNegativeAsset
                                ),

                        // Text on Supplementary Surface
                        onSupplementarySurface =
                                getThemeColor(
                                        themeColors?.get("onSupplementarySurface"),
                                        defaults.onSupplementarySurface
                                ),
                        onSupplementarySurfaceSubdued =
                                getThemeColor(
                                        themeColors?.get("onSupplementarySurfaceSubdued"),
                                        defaults.onSupplementarySurfaceSubdued
                                ),

                        // Warning colors
                        warningSurface =
                                getThemeColor(
                                        themeColors?.get("warningSurface"),
                                        defaults.warningSurface
                                ),
                        onWarningAsset =
                                getThemeColor(
                                        themeColors?.get("onWarningAsset"),
                                        defaults.onWarningAsset
                                ),

                        // Accent colors
                        accentSurface =
                                getThemeColor(
                                        themeColors?.get("accentSurface"),
                                        defaults.accentSurface
                                ),
                        onAccentAsset =
                                getThemeColor(
                                        themeColors?.get("onAccentAsset"),
                                        defaults.onAccentAsset
                                ),

                        // Line & Shadow colors
                        line = getThemeColor(themeColors?.get("line"), defaults.line),
                        shadow = getThemeColor(themeColors?.get("shadow"), defaults.shadow),
                )
        }

        /** Get a single color from the theme data */
        private fun getThemeColor(themeColor: Map<String, *>?, defaultColor: Color): Color {
                if (themeColor == null) {
                        return defaultColor
                }
                val red = themeColor["red"] as Int? ?: return defaultColor
                val green = themeColor["green"] as Int? ?: return defaultColor
                val blue = themeColor["blue"] as Int? ?: return defaultColor
                val alpha = themeColor["alpha"] as Int? ?: 255

                return Color(red, green, blue, alpha)
        }

        /** Get all the shapes from the theme data */
        private fun getThemeShapes(themeData: ThemeDataType?): GreenlightSDKShapes {
                val defaults = defaultGreenlightSDKShapes()
                val defaultCards = defaults.cards ?: return defaults
                val defaultButtons = defaults.button ?: return defaults

                if (themeData == null) {
                        return defaults
                }
                val themeShapes = themeData["shapes"] ?: return defaults
                val cardCornerRadius =
                        getThemeCornerRadius(themeShapes["cardShape"]) ?: return defaults
                val buttonCornerRadius =
                        getThemeCornerRadius(themeShapes["buttonShape"]) ?: return defaults

                return defaults.copy(
                        cards =
                                GreenlightSDKCardShapes(
                                        elevated =
                                                defaultCards.elevated?.copy(
                                                        cornerRadius = cardCornerRadius
                                                ),
                                        flat =
                                                defaultCards.flat?.copy(
                                                        cornerRadius = cardCornerRadius
                                                ),
                                        secondary =
                                                defaultCards.secondary?.copy(
                                                        cornerRadius = cardCornerRadius
                                                ),
                                        outlined =
                                                defaultCards.outlined?.copy(
                                                        cornerRadius = cardCornerRadius
                                                ),
                                        accent =
                                                defaultCards.accent?.copy(
                                                        cornerRadius = cardCornerRadius
                                                ),
                                        warning =
                                                defaultCards.warning?.copy(
                                                        cornerRadius = cardCornerRadius
                                                ),
                                        negative =
                                                defaultCards.negative?.copy(
                                                        cornerRadius = cardCornerRadius
                                                ),
                                        positive =
                                                defaultCards.positive?.copy(
                                                        cornerRadius = cardCornerRadius
                                                ),
                                ),
                        button =
                                GreenlightSDKButtonShapes(
                                        primary =
                                                defaultButtons.primary?.copy(
                                                        cornerRadius = buttonCornerRadius
                                                ),
                                        secondary =
                                                defaultButtons.secondary?.copy(
                                                        cornerRadius = buttonCornerRadius
                                                ),
                                        tertiary =
                                                defaultButtons.tertiary?.copy(
                                                        cornerRadius = buttonCornerRadius
                                                ),
                                        tertiaryNegative =
                                                defaultButtons.tertiaryNegative?.copy(
                                                        cornerRadius = buttonCornerRadius
                                                ),
                                        outlined =
                                                defaultButtons.outlined?.copy(
                                                        cornerRadius = buttonCornerRadius
                                                ),
                                        text =
                                                defaultButtons.text?.copy(
                                                        cornerRadius = buttonCornerRadius
                                                ),
                                ),
                )
        }

        /** Get the corner radius of one particular shape from the theme data */
        private fun getThemeCornerRadius(themeShape: Map<String, *>?): Int? {
                if (themeShape == null) {
                        return null
                }
                return themeShape["cornerRadius"] as Int? ?: return null
        }

        private fun log(message: String) {
                Log.d(
                        "Greenlight",
                        "${this.javaClass.simpleName} $message in ${this.javaClass.`package`?.name}"
                ) // Then send to analytics
        }
}
