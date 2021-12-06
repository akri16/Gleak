<h1 align="center">Gleak - Innovative Gas Leak Detection System</h1>

[![Product Demo](https://res.cloudinary.com/marcomontalbano/image/upload/v1638761695/video_to_markdown/images/google-drive--1GqR1jjHHhliu0tDX3gy8yH2UcfYmvZG2-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://drive.google.com/file/d/1GqR1jjHHhliu0tDX3gy8yH2UcfYmvZG2/view "Product Demo")

## Problem Statement

As the whole world is developing in every way and one way includes the livelihood of the people and they are having smart technology and techniques. Alongside, the chances of accidents and damages to happen are also developing and at a very high rate but according to the recent trend, the development of Smart homes is taking place all around the world. Home automation has become very affordable and many people and even industries have started to automate daily routines like light, fans, setting the temperature, etc. And all of these include one major problem i.e. GAS LEAKAGE and it includes all the types of gases which can be disastrous and harmful for an individual. It is a major problem in industries, residential premises, and gas-powered vehicles. The leakage if not detected may lead to an explosion and cause severe damages to life and the environment.

## Motivation

The chances of accidents and damages happening are also developing and at a very high rate. A common accident among them is that of GAS Leakage. The leakage if not detected may lead to an explosion and cause severe damages to life and the environment. 

To avoid such situations, a considerable amount of effort has been devoted to the development of reliable techniques for detecting gas leakage.  With the advancement of home automation, we decided to build a Gas Leakage Detector for safety and security


## Solution

As the whole world is developing in every way and one way includes the livelihood of the people and they are having smart technology and techniques. Alongside, the chances of accidents and damages to happen are also developing and at a very high rate but according to the recent trend, the development of Smart homes is taking place all around the world. Home automation has become very affordable and many people and even industries have started to automate daily routines like light, fans, setting the temperature, etc. And all of these include one major problem i.e. GAS LEAKAGE and it includes all the types of gases which can be disastrous and harmful for an individual. It is a major problem in industries, residential premises, and gas-powered vehicles. The leakage if not detected may lead to an explosion and cause severe damages to life and the environment.

The chances of accidents and damages happening are also developing and at a very high rate. A common accident among them is that of GAS Leakage. The leakage if not detected may lead to an explosion and cause severe damages to life and the environment. 

To avoid such situations, a considerable amount of effort has been devoted to the development of reliable techniques for detecting gas leakage.  With the advancement of home automation, we decided to build a Gas Leakage Detector for safety and security


## Architecture
<p align="center">
  <img src="https://github.com/akri16/Gleak/blob/master/assets/arch-diagram.png">
</p>


- We will use the MQ-2 sensor to build an LPG Leakage Detector using a NodeMCU (ESP8266). 
- The ESP8266 will be programmed to communicate between the gas sensor and Firebase Realtime Database (RTD). 
- The product will have a serial code that can be entered into the app to register it with the product.
- The server-side program using FastAPI will listen to RTD and fire a push notification whenever the sensor reads true. 
- The client phone will have an app that allows you to register yourself with the sensor by entering the code on the sensor.
- The registered app waits for push notifications from the server and alerts the user when there is a gas leak.


## Images
                                                                                    
<p align="center">
  <img src="https://github.com/akri16/Gleak/blob/master/assets/app-screen-1.jpeg" width="180">
  <img src="https://github.com/akri16/Gleak/blob/master/assets/app-screen-2.jpeg" width="180">
  <img src="https://github.com/akri16/Gleak/blob/master/assets/hardware-img.jpeg" width="180">
</p>

## Tools Used

1. ESP8266 (NodeMCU) 			
2. iOS   
3. Firebase Realtime Database
4. MQ-2 Gas Sensor
5. FastAPI Backend 
6. Arduino IDE

## Project Structure

* `App` -> iOS app
* `Hardware` -> ESP8266 code
* `Gleak-Backend` -> FastAPI backend 

### Database Schema
```json
{
  "6wqegdus789dewyj" : {
    "isAlerting" : true,
    "value" : 10
  },
  "911224f4-4f1d-41a3-9063-d2ec809dcc41" : {
    "isAlerting" : false,
    "notifications" : {
      "body" : "Sensor reads 440.",
      "time" : 1638721619,
      "title" : "Alert! Gas Leak!"
    },
    "value" : 2
  }
}

```

## Todo

- [ ] Hardware
    - [x] Interface Gas Sensor to NodeMCU
    - [x] Init Firebase RTD
    - [x] Connect NodeMCU to Firebase RTD
    - [ ] LED indicators (Optional)
    - [ ] Dynamic Threshold from RTD (Optional)
- [ ] iOS app 
    - [x] Connect to RTD
    - [ ] Register for push notification 
    - [ ] Change threshold from app (Optional)
- [x] Server
  - [x] Create a backend to send push notification when RTD value changes from low -> high
- [ ] Build Android App (Optional)


## Contributing

Refer to [CONTRIBUTING.md](https://github.com/akri16/Gleak/blob/master/CONTRIBUTING.md) for guidelines

### Contributors

<table>
<tr align="center">

<td>
Amit Krishna A
<p align="center">
<img src = "https://i.ibb.co/DwLYR0X/amit.png" width="150" height="150" alt="Amit Krishna A">
</p>
<p align="center">
<a href = "https://github.com/akri16"><img src = "http://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="36" height = "36"/></a>
<a href = "https://www.linkedin.com/in/akri16/">
<img src = "http://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="36" height="36"/>
</a>
</p>
</td>

<td>
Swamita Gupta
<p align="center">
<img src = "https://avatars.githubusercontent.com/u/55314843?v=4" width="150" height="150" alt="Swamita Gupta">
</p>
<p align="center">
<a href = "https://github.com/swamitagupta"><img src = "http://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="36" height = "36"/></a>
<a href = "https://www.linkedin.com/in/swamita-gupta/?originalSubdomain=in">
<img src = "http://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="36" height="36"/>
</a>
</p>
</td>

</tr>
  </table>

## Application

Our implementation has various applications. Some of them include:

- This implementation can be used to detect leakage of gas from cylinders and also notify the user via the mobile app
- This can be used by domestic households who can keep a check on their houses when out. This is particularly helpful for working families.
- This can also be used at hotels or places where gas is consumed on a large scale
- This can also be used by factories storing gas or inflammable materials 


## Conclusion

In this system, we have described a new approach for the gas leakage detection system. In this system, we have used the MQ-2 sensor which is used to build an LPG Leakage Detector using a NodeMCU (ESP8266). Also, the ESP8266 has been programmed in such a way so as to communicate between the gas sensor and Firebase Realtime Database (RTD). A quick response rate is provided by this system. The advantage of this project is that it is easy to use and is a lot less expensive than any other alternatives. With the help of this system, the critical situations can be solved quickly over the manual methods which require a large amount of time. 


## License

    MIT License

    Copyright (c) 2021 Amit Krishna A

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.

