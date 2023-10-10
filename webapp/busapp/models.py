from django.db import models

# Create your models here.
class captured_image(models.Model):
    image_file = models.ImageField(upload_to="captured_image/")
    created_at = models.DateTimeField(auto_now_add= True)
    