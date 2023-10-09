import firebase_admin
from firebase_admin import db, credentials

cred = credentials.Certificate('gantavya-101a0-firebase-adminsdk-x1mre-7c82130753.json')
firebase_admin.initialize_app(cred, {
        'databaseURL': 'https://gantavya-101a0-default-rtdb.asia-southeast1.firebasedatabase.app/'})
def pay(price):
    """
    Accesses firebase and deducts the price after its been paid
    """
    account = db.reference('/price').get()
    if account-price>=0:
        final_price = account-price
        db.reference('/price').set(final_price)
        if final_price<100:
            print("Your new price is less than 100 please load the funds as soon as possible.")
        print(f"Your new balance is {db.reference('/price').get()}")
    else:
        print("Error not enough balance on the account")

