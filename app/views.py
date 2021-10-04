from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from .models import content

# Create your views here.
def app_about(request):
    about = content.objects.get(place='about')
    return render(request, 'app_about.html', {'title': 'ADAPTS About', 'about': about})

@login_required
def app_download(request):
    if (request.user.is_staff == True or request.user.is_superuser == True):
        return render(request, 'app_download.html', {'title': 'ADAPTS Download'})
    else:
        if(request.user.profile.project != None):
            if(request.user.profile.project.active == True):
                return render(request, 'app_download.html', {'title': 'ADAPTS Download'})
            else:
                return render(request, 'app_download_denied.html', {'title': 'ADAPTS Download'})
        else:
            return render(request, 'app_download_denied.html', {'title': 'ADAPTS Download'})