package com.example.freedom_timer

import android.content.pm.PackageManager
import android.content.pm.PackageInfo
import android.util.Base64
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import java.security.MessageDigest

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)

        // KeyHash 출력
        try {
            val info = packageManager.getPackageInfo(
                packageName,
                PackageManager.GET_SIGNATURES
            )
            val signatures = info.signatures
            if (signatures != null) {
                for (signature in signatures) {
                    val md = MessageDigest.getInstance("SHA")
                    md.update(signature.toByteArray())
                    val keyHash = Base64.encodeToString(md.digest(), Base64.NO_WRAP)
                    Log.d("KEYHASH", "========================================")
                    Log.d("KEYHASH", "KeyHash: $keyHash")
                    Log.d("KEYHASH", "========================================")
                }
            }
        } catch (e: Exception) {
            Log.e("KEYHASH", "Error getting KeyHash: ${e.message}")
        }
    }
}