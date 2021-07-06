from django.shortcuts import render

# Create your views here.
def app_about(request):
    return render(request, 'app_about.html', {'title': 'ADAPTS About'})

def app_download(request):
    return render(request, 'app_download.html', {'title': 'ADAPTS Download'})