import firebase_admin
from firebase_admin import db, credentials

class Db:
        def __init__(self):
                self.cred = credentials.Certificate('ku-hackfeast-firebase-adminsdk-ue39w-2a861ae407.json')
                firebase_admin.initialize_app(self.cred, {
                        'databaseURL': 'https://ku-hackfeast-default-rtdb.firebaseio.com/'})
        def pay(self, price):
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

        def load_funds(self, price):
                """
                Accesses firebase and deducts the price after its been paid
                """
                if(price<0):
                        print("Error price is negative")

                account = db.reference('/price').get()
                final_price = account+price
                db.reference('/price').set(final_price)
                print(f"{price} has been added to your account")
                print(f"Your new balance is {db.reference('/price').get()}")
    
