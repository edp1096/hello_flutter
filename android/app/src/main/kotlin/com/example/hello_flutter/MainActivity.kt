package com.example.hello_flutter

import io.flutter.embedding.android.FlutterActivity
import kotlin.concurrent.*
import server.*

class MainActivity: FlutterActivity() {
    override fun onStart() {
        super.onStart()
        Server.startServer()
    }
}
