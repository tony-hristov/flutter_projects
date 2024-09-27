import com.example.greenlight_plugin.GreenlightPlugin
import me.greenlight.partner.GreenlightSDKErrorListener

/**
 * Alkami implementation of [GreenlightSDKErrorListener]. Listens for [Throwable] errors and sends
 * to the Flutter method channel
 */
class AlkamiGreenlightErrorListener() : GreenlightSDKErrorListener {
    /** onError handler for [Throwable]. Sends the error message to the Flutter method channel */
    override fun onError(error: Throwable) {
        GreenlightPlugin.channel.invokeMethod(
                "greenlightError",
                mapOf("errorMessage" to error.message),
        )
    }
}
