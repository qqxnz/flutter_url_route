package com.hzp.flutterdemo2;

import android.content.Context;
import android.os.Bundle;
import android.view.WindowManager;

import com.alibaba.fastjson.JSON;

import java.util.HashMap;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterNativeView;
import io.flutter.view.FlutterView;

public class BaseFlutterActivity extends FlutterActivity {

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
    }

    @Override
    public FlutterView createFlutterView(Context context) {
        WindowManager.LayoutParams matchParent = new WindowManager.LayoutParams(-1, -1);
        FlutterNativeView nativeView = this.createFlutterNativeView();
        FlutterView flutterView = new FlutterView(BaseFlutterActivity.this, null, nativeView);
        flutterView.setInitialRoute("page1?message=Test&asdf=nativeToFlutter with arguments");
        flutterView.setLayoutParams(matchParent);
        flutterView.enableTransparentBackground();
        this.setContentView(flutterView);
        return flutterView;
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
}
