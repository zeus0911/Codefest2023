import firebase_admin
from firebase_admin import db, credentials

cred = credentials.Certificate('gantavya-101a0-firebase-adminsdk-x1mre-7c82130753.json')
firebase_admin.initialize_app(cred, {
        'databaseURL': 'https://gantavya-101a0-default-rtdb.asia-southeast1.firebasedatabase.app/'})
