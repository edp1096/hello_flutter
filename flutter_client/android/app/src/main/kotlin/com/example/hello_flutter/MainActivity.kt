package com.example.hello_flutter

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import kotlin.concurrent.thread
import server.Server

class MainActivity: FlutterActivity() {
    private var serverThread: Thread? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        if (serverThread == null) {
            serverThread = thread{
                Server.startServer()
            }
        }
    }

    override fun onStart() {
        super.onStart()

        if (serverThread == null) {
            serverThread = thread{
                Server.startServer()
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()

        if (serverThread != null) {
            serverThread?.interrupt()
        }
        serverThread = null
    }
}
