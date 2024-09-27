import android.util.Log
import com.example.greenlight_plugin.GreenlightPlugin
import io.flutter.plugin.common.MethodChannel
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import kotlin.coroutines.suspendCoroutine
import kotlinx.coroutines.*
import me.greenlight.partner.authentication.GreenlightSDKAuthentication
import me.greenlight.partner.authentication.TokenData

/**
 * Alkami implementation of [GreenlightSDKAuthentication]. Provides a callback for fetching user
 * token from the Flutter method channel
 */
class AlkamiGreenlightAuthenticator() : GreenlightSDKAuthentication {
    /** Calls method "fetchNewToken" on the Flutter method channel to fetch user token */
    override suspend fun fetchNewToken(): TokenData {
        return suspendCoroutine { continuation ->
            runBlocking(Dispatchers.Main) {
                GreenlightPlugin.channel.invokeMethod(
                        "fetchNewToken",
                        null,
                        object : MethodChannel.Result {
                            override fun success(result: Any?) =
                                    if (result is Map<*, *>) {
                                        // Expecting a hashmap with pairs of: accessToken->String,
                                        // expiresIn->Int, tokenType->String
                                        try {
                                            continuation.resume(
                                                    TokenData(
                                                            accessToken =
                                                                    result["accessToken"] as String?
                                                                            ?: "",
                                                            expiresIn = result["expiresIn"] as Int?
                                                                            ?: 3600,
                                                            tokenType =
                                                                    result["tokenType"] as String?
                                                                            ?: "Bearer",
                                                    )
                                            )
                                        } catch (e: RuntimeException) {
                                            Log.e(
                                                    "Greenlight",
                                                    "Greenlight: Failed to handle method call result",
                                                    e
                                            )
                                            continuation.resumeWithException(
                                                    Exception(
                                                            "Greenlight: Error cannot get access token"
                                                    )
                                            )
                                        }
                                    } else {
                                        continuation.resumeWithException(
                                                Exception(
                                                        "Greenlight: Error cannot get access token"
                                                )
                                        )
                                    }

                            override fun error(
                                    errorCode: String,
                                    errorMessage: String?,
                                    errorDetails: Any?
                            ) {
                                continuation.resumeWithException(Exception(errorMessage))
                            }

                            override fun notImplemented() {
                                continuation.resumeWithException(
                                        NotImplementedError(
                                                "Greenlight: Method channel method 'fetchNewToken' not implemented"
                                        )
                                )
                            }
                        }
                )
            }
        }
    }
}
