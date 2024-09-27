package com.example.greenlight_plugin

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import me.greenlight.partner.GreenlightSDK

class GreenlightActivity : AppCompatActivity(R.layout.activity_greenlight) {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        log("Greenlight: Launching Greenlight Dashboard")
        val familyUid = intent.getStringExtra("familyUid") ?: ""
        val initialChildId = intent.getIntExtra("initialChildId", 0)
        GreenlightSDK.launchChildDashboard(this, familyUid, initialChildId)
        GreenlightPlugin.channel.invokeMethod("onGreenlightSdkStart", null)
    }

    override fun onRestart() {
        super.onRestart()

        log("Greenlight: Closing Greenlight Dashboard")
        GreenlightPlugin.channel.invokeMethod("onGreenlightSdkClose", null)
        finish()
    }

    private fun log(message: String) {
        Log.d(
                "Greenlight",
                "${this.javaClass.simpleName} $message in ${this.javaClass.`package`?.name}"
        ) // Then send to analytics
    }
}
