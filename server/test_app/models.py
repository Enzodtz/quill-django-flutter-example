from django.db import models

# Create your models here.


class Description(models.Model):
    json = models.TextField()
    html = models.TextField()
