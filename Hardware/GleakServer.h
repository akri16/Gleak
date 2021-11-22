#include <ESP8266WiFi.h>
#include <WiFiClientSecure.h>
#include <ESP8266HTTPClient.h>
#include "secrets.h"

class GleakServer  {
  public:
    bool getServerIsAlerting();
    bool putServerIsAlerting(bool val);
    bool getIsFirst() {
      return _isFirst;
    }
    bool getIsAlerting () {
      return _isAlerting;
    }

  private :
    bool _isFirst = true;
    bool _isAlerting = false;
};

bool GleakServer :: getServerIsAlerting() {
  HTTPClient http;
  WiFiClientSecure  wifi;
  wifi.setInsecure();
  
  if (http.begin(wifi, FIREBASE_URL)) {
    int httpCode = http.GET();
    String pay = http.getString();
    _isAlerting = pay == "true";
    Serial.println("GET " + String(FIREBASE_URL) + " : " + String(httpCode) + "\nPayload: " + String(pay));
    http.end();
  }
  return _isAlerting;
}

bool GleakServer :: putServerIsAlerting(bool val) {
  HTTPClient http;
  WiFiClientSecure  wifi;
  wifi.setInsecure();
  
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
