#include <ESP8266WiFi.h>
#include <WiFiClientSecure.h>
#include <ESP8266HTTPClient.h>
#include "secrets.h"

class GleakServer  {
  public:
    bool putServerIsAlerting(bool val);
    void publishValue(int val);
    bool getIsFirst() {
      return _isFirst;
    }
    bool getIsAlerting () {
      return _isAlerting;
    }

  private :
    const int minPublishDiff = 5;
    bool _isFirst = true;
    bool _isAlerting = false;
    int _lastPublishedValue = -5;
};


bool GleakServer :: putServerIsAlerting(bool val) {
   WiFiClient wifi;
   HTTPClient http;
  
  if (http.begin(wifi, FIREBASE_URL)) {
    String body = val ? "true" : "false";
    http.addHeader("Content-Type", "application/json");
    int httpCode = http.PUT(body);
    Serial.println("PUT " + String(FIREBASE_URL ) + " : " + String(httpCode));
    
    if (httpCode >= 200 && httpCode < 400) {
      String pay = http.getString();
      Serial.println("Payload: " + String(pay) + "\nVal: "  + body);
      _isFirst = false;
      _isAlerting  = val;
    }else {
      Serial.printf("Error: %s\n", http.errorToString(httpCode).c_str());
    }
    
    http.end();
  }
  return _isAlerting;
}

void GleakServer :: publishValue(int val) {

  if (abs(val - _lastPublishedValue) < minPublishDiff) {
    return;
  }
  
   WiFiClient wifi;
  HTTPClient http;
  
  if (http.begin(wifi, FIREBASE_PUBLISH_URL)) {
    http.addHeader("Content-Type", "application/json");
    int httpCode = http.PUT(String(val));
    Serial.println("PUT " + String(FIREBASE_PUBLISH_URL ) + " : " + String(httpCode));
    
    if (httpCode >= 200 && httpCode < 400) {
      String pay = http.getString();
      Serial.println("Payload: " + String(pay) + "\nVal: "  + val);
      _lastPublishedValue = val;
    }else {
      Serial.printf("Error: %s\n", http.errorToString(httpCode).c_str());
    }
    
    http.end();
  }
}
