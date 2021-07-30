from django.contrib import admin
from .models import Post, Slideshow, Image

# Register your models here.
admin.site.register(Post)
admin.site.register(Slideshow)
admin.site.register(Image)