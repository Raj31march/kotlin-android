package com.example.flutter_channel_method

import android.os.CountDownTimer
import android.view.View
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "user_location").setMethodCallHandler { call, result ->
  if (call.method == "locationStatusStream") {
  val greetings = locationStatusStream();
  result.success(greetings)
  } else {
  result.notImplemented()
  }
  }

  EventChannel(flutterEngine.dartExecutor.binaryMessenger, "locationStatusStream").setStreamHandler(object : EventChannel.StreamHandler {
  override fun onListen(p0: Any?, p1: EventChannel.EventSink) {
  var language = arrayOf("Ruby", "Kotlin", "Python", "Java")

  for (item in language) {
  p1.success("$item");
  }
//                for (i in 1..10) {
//                p1.success("$i");

//                }

  val timer = object : CountDownTimer(20000, 1000) {
  override fun onTick(millisUntilFinished: Long) {
  p1.success("seconds remaining: " + millisUntilFinished / 1000)
  }

  override fun onFinish() {

  }
  }
  timer.start()
  }

  override fun onCancel(p0: Any) {
  }
  })
  }

  private fun locationStatusStream(): String {
  return "i"
  }
}
