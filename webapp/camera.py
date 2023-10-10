import os
from deepface import DeepFace
import cv2
from keras.applications.mobilenet_v2 import preprocess_input
from keras.preprocessing.image import img_to_array
from keras.models import load_model
import numpy as np
import cv2

def detect_and_predict_mask(frame, faceNet, maskNet):
	"""
	Takes an image, does all the preprocessing and returns the prediction of the facemask model
	"""
	(h, w) = frame.shape[:2]
	blob = cv2.dnn.blobFromImage(frame, 1.0, (300, 300),
		(104.0, 177.0, 123.0))

	# pass the blob through the network and obtain the face detections
	faceNet.setInput(blob)
	detections = faceNet.forward()

	# initialize our list of faces, their corresponding locations,
	# and the list of predictions from our face mask network
	faces = []
	locs = []
	preds = []

	# loop over the detections
	for i in range(0, detections.shape[2]):
		# extract the confidence (i.e., probability) associated with
		# the detection
		confidence = detections[0, 0, i, 2]

		# filter out weak detections by ensuring the confidence is
		# greater than the minimum confidence
		if confidence > 0.5:
			# compute the (x, y)-coordinates of the bounding box for
			# the object
			box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
			(startX, startY, endX, endY) = box.astype("int")

			# ensure the bounding boxes fall within the dimensions of
			# the frame
			(startX, startY) = (max(0, startX), max(0, startY))
			(endX, endY) = (min(w - 1, endX), min(h - 1, endY))

			# extract the face ROI, convert it from BGR to RGB channel
			# ordering, resize it to 224x224, and preprocess it
			face = frame[startY:endY, startX:endX]
			face = cv2.cvtColor(face, cv2.COLOR_BGR2RGB)
			face = cv2.resize(face, (224, 224))
			face = img_to_array(face)
			face = preprocess_input(face)

			# add the face and bounding boxes to their respective
			# lists
			faces.append(face)
			locs.append((startX, startY, endX, endY))

	# only make a predictions if at least one face was detected
	if len(faces) > 0:
		# for faster inference we'll make batch predictions on *all*
		# faces at the same time rather than one-by-one predictions
		# in the above `for` loop
		faces = np.array(faces, dtype="float32")
		preds = maskNet.predict(faces, batch_size=32)

	# return a 2-tuple of the face locations and their corresponding
	# locations
	return preds

def check_mask(frame):
	"""
	Returns True if there is a mask in the image and False if there isn't
	"""
	prototext = 'face_detector\deploy.prototxt'
	detector_weights = './face_detector/res10_300x300_ssd_iter_140000.caffemodel'
	detector = cv2.dnn.readNet(prototext, detector_weights)
	maskNet = load_model('./face_detector/mask_detector.model')
	pred = detect_and_predict_mask(frame, detector, maskNet)
	(mask, withoutMask) = pred[0]
	label = True if mask > withoutMask else False
	return label #True==Mask, False==No Mask

def click_photo_enter():
    """
    Takes photo from camera using opencv after clicking enter key and save it under image.png 
    """
    cap = cv2.VideoCapture(0) # video capture source camera (Here webcam of laptop) 
    ret,frame = cap.read() # return a single frame in variable `frame`

    while(True):
        cv2.imshow('img1',frame) #display the captured image
        if check_mask(frame=frame):
              print("Please remove your mask and Try again")
              return 
        if cv2.waitKey(1) & 0xFF == ord('y'): #save on pressing 'y' 
            num = len(os.listdir('busapp/static/busapp/media/collected_data'))
            cv2.imwrite(f'busapp/static/busapp/media/collected_data/{num}.jpg',frame) #saves the image in images directory
            cv2.destroyAllWindows()
            break

    cap.release()

def click_and_check():
    cap = cv2.VideoCapture(0) # video capture source camera (Here webcam of laptop)
    
    while True:
        ret, frame = cap.read() # return a single frame in the variable frame
        cv2.imshow('Frame', frame) # display the captured image
        
        if cv2.waitKey(1) & 0xFF == ord('y'): # save on pressing 'y'
            cv2.imwrite('test.jpg', frame)
            cv2.destroyAllWindows()
            break

    cap.release()

    dirs = os.listdir('busapp/static/busapp/media/collected_data/')
    for i in ['busapp/static/busapp/media/collected_data/' + files for files in dirs]:
        print(i)
        result = DeepFace.verify('test.jpg', i, model_name="Facenet512")['verified']
        print(DeepFace.verify('test.jpg', i, model_name="Facenet512"))
        if result:
            print('Found')
            os.remove(i) # Removes the found image to save space
            return
    print('Not Found')



