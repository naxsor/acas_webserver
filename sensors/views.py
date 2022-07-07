from django.shortcuts import render
from sensors.models import Sensor, ACAS_part, Reference
from app.models import content
from blog.models import Image
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.db import connections
from django.contrib import messages
from django.urls import reverse
import pandas as pd
from plotly.offline import plot
import plotly.graph_objs as go
from .plot import *

# Create your views here.
class StatusListView(ListView):
    model = Sensor
    template_name = 'sensors/status.html'  # <app>/<model>_<viewtype>.html
    context_object_name = 'posts'

def sensors(request):
    image = Image.objects.get(title='ADAPTS Diagram')
    sensors = Sensor.objects.all()
    parts = ACAS_part.objects.all()
    reference = Reference.objects.all()
    adapts = content.objects.get(place='About ADAPTS')
    return render(request, 'sensors.html', {'title': 'Sensors', 'image':image, 'sensors_list': sensors, 'parts':parts, 'adapts':adapts, 'references':reference})


def data(request):
    # Plotly visualizations
    # target_plot = plotly_plot(sql_connection)

    # Return context to home page view
    # context = {'target_plot': target_plot}

    # Render the HTML template index.html with the data in the context variable.
    return render(request, 'data.html')