# Codefest2023

# Gantavya

## Overview

Gantavya is a modern and efficient solution for public transportation management. It utilizes advanced technologies such as facial recognition, geo-tagging, and mobile payment to streamline the commuting experience that addresses the problems of the public while travelling such as security issues, unfair pricing and discomfort. 

The mobile app showcases the wallet system for transaction and live route tracking of the buses. The web app showcases the prototype interface that would be integrated on public buses.

## Features

- **Facial Recognition**: The system uses Deepface for facial recognition, allowing passengers to board and alight the vehicle seamlessly.

- **Geo-tagging**: Passengers' locations are geo-tagged upon entry and matched with their destinations, enabling precise fare calculation.

- **Mobile Wallet**: Passengers can maintain a digital wallet within the mobile app, which is used for automated fare deduction.

- **Real-time Tracking**: The system provides real-time tracking of vehicles, helping passengers and administrators monitor the transportation network.

## Workings
**Entry:**
Passenger enters the bus,  and his/her face is captured in database alongside geotags. 

**Face Recognition**
Upon arrival, the camera scans the passenger’s face to look for a match and distance is calculated from starting point.

**Fare Calculation**
The total distance travelled alongside the ride fare is presented at the screen.

**Wallet Deduction**
The amount is auto deducted from the users wallet through our app.

**Data Encryption**
User’s personal data will be encrypted securely for enhancing user experience in the near future.

## Technologies Used

- **Frontend**: Flutter, HTML, CSS, JavaScript
- **Backend**: Django, Firebase
- **Database**: Firebase Realtime Database, Redis
- **Facial Recognition**: Deepface
- **Containerization**: Docker

## Screenshots 
<img src="https://github.com/Nawap1/Codefest2023/assets/98960524/7d9f8b62-7971-4906-a9e2-f2b2b08b44af" alt="wallet" width="420" height="900">
<img src="https://github.com/Nawap1/Codefest2023/assets/98960524/ff090405-1598-47cd-9ace-9be971ca5b0a" alt="wallet" width="420" height="900">

