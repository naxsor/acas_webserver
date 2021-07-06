from django.shortcuts import render
from sensors.models import Sensor
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)

# Create your views here.
class StatusListView(ListView):
    model = Sensor
    template_name = 'sensors/status.html'  # <app>/<model>_<viewtype>.html
    context_object_name = 'posts'

def sensors(request):
    return render(request, 'sensors.html', {'title': 'Aerosol Sensors'})