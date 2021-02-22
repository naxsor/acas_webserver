from django.contrib import admin
from .models import Sensor, Log, Primary_Variables
# Register your models here.

admin.site.register(Sensor)
admin.site.register(Log)
admin.site.register(Primary_Variables)