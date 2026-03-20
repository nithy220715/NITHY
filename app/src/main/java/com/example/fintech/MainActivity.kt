
package com.example.fintech
import android.os.Bundle
import android.webkit.WebView
import androidx.appcompat.app.AppCompatActivity

class MainActivity: AppCompatActivity(){
 override fun onCreate(savedInstanceState: Bundle?){
  super.onCreate(savedInstanceState)
  val w=WebView(this)
  setContentView(w)
  w.settings.javaScriptEnabled=true
  w.loadUrl("file:///android_asset/index.html")
 }
}
