from django.shortcuts import render
from django.shortcuts import render, HttpResponse
from django.http.response import StreamingHttpResponse
import cv2
import os
from deepface import DeepFace
import datetime
from db import Db
from firebase_admin import db

output_folder = "static/"

a = Db()

# Create your views here.
def click_photo_enter(request):
    
    return render(request, 'index.html')

def bus(request):
    return render(request, 'bus.html')

def dashboard(request):
    return render(request, 'dashboard.html')


def video_feed(request):
    """
    Takes a photo from the camera using OpenCV after clicking the 'y' key and saves it with a unique filename.
    """
    cap = cv2.VideoCapture(0)  # Video capture source from the camera (e.g., webcam)

    while True:
        ret, frame = cap.read()  # Return a single frame in the 'frame' variable
        cv2.imshow('img1', frame)  # Display the captured image

        if cv2.waitKey(1) & 0xFF == ord('y'):  # Save on pressing 'y'
            # Generate a unique filename based on the current timestamp
            timestamp = datetime.datetime.now().strftime("%Y%m%d%H%M%S%f")
            face_filename = os.path.join(output_folder, f'face_{timestamp}.jpg')
            cv2.imwrite(face_filename, frame)
            cv2.destroyAllWindows()
            break

    cap.release()
    cv2.destroyAllWindows()

    return render(request, 'bus.html')

def recognize(request):
    cap = cv2.VideoCapture(0)  # Video capture source from the camera (e.g., webcam)

    while True:
        ret, frame = cap.read()  # Return a single frame in the variable frame
        cv2.imshow('Frame', frame)  # Display the captured image

        if cv2.waitKey(1) & 0xFF == ord('y'):  # Save on pressing 'y'
            cv2.imwrite('test.jpg', frame)
            cv2.destroyAllWindows()
            break

    cap.release()

    for root, dirs, files in os.walk(output_folder):
        for filename in files:
            i = os.path.join(root, filename)
            print(i)
            result = DeepFace.verify('test.jpg', i, model_name="Facenet512", detector_backend="mtcnn")['verified']
            print(DeepFace.verify('test.jpg', i, model_name="Facenet512"))
            if result:
                print('Found')
                os.remove(i)
                a.pay(price = 25)        
                
                new_balance = db.reference('/price').get()

                context = {
                    'new_balance': new_balance,
                }
                 # Removes the found image to save space
                return render(request, 'yes.html', context)
            else :
                print('Not Found')
                return render(request, 'index.html')
    
    return render(request, 'bus.html')

def yes(request):
    return render(request, "yes.html")


