package com.rnhaptik;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

import ai.haptik.android.wrapper.sdk.HaptikSDK;
import ai.haptik.android.wrapper.sdk.model.InitData;
import ai.haptik.android.wrapper.sdk.model.SignupData;

public class GlobalManager extends ReactContextBaseJavaModule {

    private final ReactContext reactContext;

    public GlobalManager(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @NonNull
    @Override
    public String getName() {
        return "GlobalManager";
    }

    @ReactMethod
    public void loadHaptikConversation() {
        InitData initData = new InitData();     //HaptikConfig
        initData.setPrimaryColor("#D9243D");     //HaptikConfig
        HaptikSDK.INSTANCE.init(reactContext, initData);     //HaptikConfig
        HaptikSDK.INSTANCE.loadGuestConversation();
    }

    @ReactMethod
    public void logoutHaptik(){
        HaptikSDK.INSTANCE.destroy();
        CharSequence text = "HaptikSDK destroyed!";
        int duration = Toast.LENGTH_SHORT;

        Toast toast = Toast.makeText(reactContext, text, duration);
        toast.show();
    }

}
