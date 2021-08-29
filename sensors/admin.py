from django.contrib import admin
from .models import Sensor, Log, Primary_Variables, ACAS_part
# Register your models here.

admin.site.register(Sensor)
admin.site.register(Log)
admin.site.register(Primary_Variables)
admin.site.register(ACAS_part)

