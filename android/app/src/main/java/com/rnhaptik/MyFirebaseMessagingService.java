package com.rnhaptik;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;
import java.util.Map;

import ai.haptik.android.wrapper.sdk.HaptikSDK;

public class MyFirebaseMessagingService extends FirebaseMessagingService {
    @Override
    public void onMessageReceived(RemoteMessage remoteMessage) {
        Map<String, String> data = remoteMessage.getData();
        if (HaptikSDK.INSTANCE.isHaptikNotification(data)) {
            HaptikSDK.INSTANCE.handleNotification(
                    this,
                    data,
                    // Icon to show in notification
                    R.mipmap.ic_launcher_round
            );
        }
    }

    @Override
    public void onNewToken(String s) {
        super.onNewToken(s);
        HaptikSDK.INSTANCE.setNotificationToken(this, s);
    }
}