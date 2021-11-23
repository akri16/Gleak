
#include <ESP8266WiFi.h>
#include <WiFiManager.h>
#include "GleakServer.h"

const char* AP_NAME = "Gleak-Device-9dcc41";

const int buzzer = 2; // D4
const int smokeD = A0;
const int resetBtn = 4;

int sensorThres = 400;
int minPublishTime = 15000;
bool portalRunning = false;

WiFiManager wm;
GleakServer gleak;

void setup() {
  Serial.begin(115200);
  Serial.println("\n\n Hello There! \n\n");
  pinMode(buzzer, OUTPUT);
  pinMode(smokeD, INPUT);
  pinMode(resetBtn, INPUT);

  WiFi.mode(WIFI_STA);
  wm.setConfigPortalBlocking(false);

  if (wm.autoConnect(AP_NAME)) {
    Serial.println("Connected");
  } else {
    Serial.println("Configportal running");
  }
}

void checkReset() {
  int val = digitalRead(resetBtn);
  if (val == HIGH) {
    int cnt = 0;
    while (val == HIGH) {
      if (cnt == 3000) {
        Serial.println(".......RESETTING.......");
        wm.resetSettings();
        ESP.restart();
        break;
      }
      val = digitalRead(resetBtn);
      delay(500);
      cnt += 500;
    }
  }
}

void gleakify() {
  int analogSensor = analogRead(smokeD);

  Serial.print("Pin A0: ");
  Serial.println(analogSensor);

  // Checks if it has reached the threshold value
  if (analogSensor >= sensorThres && (gleak.getIsFirst() || !gleak.getIsAlerting()))
  {
    if (gleak.putServerIsAlerting(true)) digitalWrite(buzzer, HIGH);
  }
  else if (analogSensor < sensorThres && (gleak.getIsFirst() || gleak.getIsAlerting()))
  {
    if(!gleak.putServerIsAlerting(false)) digitalWrite(buzzer, LOW);
  }

  gleak.publishValue(analogSensor);
  
}

void loop() {
  wm.process();
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("Not Connected");
    portalRunning = false;
    delay(600);
    return;
  }

  if (!portalRunning) {
    wm.startWebPortal();
    portalRunning = true;  
  }

  checkReset();
  gleakify();
  delay(600);
}
