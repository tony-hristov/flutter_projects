import com.example.greenlight_plugin.GreenlightPlugin
import me.greenlight.partner.GreenlightSDKEventListener
import me.greenlight.partner.events.GreenlightSDKEvent

/**
 * Alkami implementation of [GreenlightSDKEventListener]. Listens for [GreenlightSDKEvent] events
 * and sends to the Flutter method channel
 */
class AlkamiGreenlightEventListener() : GreenlightSDKEventListener {
    /** onEvent handler for [GreenlightSDKEvent]. Sends the event to the Flutter method channel */
    override fun onEvent(event: GreenlightSDKEvent) {
        when (event) {
            GreenlightSDKEvent.SendMoney -> {
                invokeChannelMethod("sendMoney")
            }
            GreenlightSDKEvent.UserInteraction -> {
                invokeChannelMethod("userInteraction")
            }
        }
    }

    /** Calls method "greenlightEvent" on the Flutter method channel sending the [eventType] */
    private fun invokeChannelMethod(eventType: String) {
        GreenlightPlugin.channel.invokeMethod(
                "greenlightEvent",
                mapOf("eventType" to eventType),
        )
    }
}
