package com.iammukesh.ccavenue_unofficial;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.NonNull;
import org.jetbrains.annotations.NotNull;

import com.iammukesh.ccavenue_unofficial.framework.WebViewActivity;
import com.iammukesh.ccavenue_unofficial.Utility.AvenuesParams;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
/** CcavenueUnofficialPlugin */
public class CcavenueUnofficialPlugin extends FlutterActivity implements FlutterPlugin, MethodCallHandler,ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
   private Activity activity;
  public String accessCode, merchantId, currencyType, amount, orderId, rsaKeyUrl, redirectUrl, cancelUrl,transUrl;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "ccavenue_unofficial");
    channel.setMethodCallHandler(this);
  }

   @Override
    public void onDetachedFromEngine(@NonNull @org.jetbrains.annotations.NotNull FlutterPlugin.FlutterPluginBinding binding) {

    }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
   if(call.method.equals("CC_Avenue_Unofficial")){
      transUrl = call.argument("transUrl");
      accessCode = call.argument("accessCode");
      merchantId = call.argument("merchantId");
      orderId = call.argument("orderId");
      currencyType = call.argument("currencyType");
      amount = call.argument("amount");
      cancelUrl = call.argument("cancelUrl");
      redirectUrl = call.argument("redirectUrl");
      rsaKeyUrl = call.argument("rsaKeyUrl");
      initiatePayment();
    }
     else {
      result.notImplemented();
    }
  }

  
  public void initiatePayment(){
        Intent intent = new Intent(this.activity, WebViewActivity.class);
        intent.putExtra(AvenuesParams.ACCESS_CODE, accessCode);
        intent.putExtra(AvenuesParams.MERCHANT_ID, merchantId);
        intent.putExtra(AvenuesParams.ORDER_ID, orderId);
        intent.putExtra(AvenuesParams.CURRENCY,currencyType );
        intent.putExtra(AvenuesParams.AMOUNT, amount);
        intent.putExtra(AvenuesParams.REDIRECT_URL, redirectUrl);
        intent.putExtra(AvenuesParams.CANCEL_URL, cancelUrl);
        intent.putExtra(AvenuesParams.TRANS_URL, transUrl);
        intent.putExtra(AvenuesParams.RSA_KEY_URL, rsaKeyUrl);
        this.activity.startActivity(intent);
    }

    @Override
    public void onAttachedToActivity(@NonNull @NotNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        this.activity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull @NotNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivity() {
        this.activity = null;
    }
}
