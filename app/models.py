from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField


# Create your models here.
class content(models.Model):
    place = models.CharField(verbose_name='Page', max_length=50, blank=True, null=True)
    title = models.CharField(verbose_name='Title', max_length=50, blank=True, null=True)
    content = RichTextUploadingField(verbose_name='Content', null=True, blank=True)
    image = models.ImageField(upload_to='app_images', null=True, blank=True)

    def __str__(self):
        return f'{self.place} Content'