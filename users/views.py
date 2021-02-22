from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.http import HttpResponse
from .models import log
from .forms import UserRegisterForm, UserUpdateForm, ProfileUpdateForm
from django.utils.timezone import timezone, make_aware

def set_timezone(request):
    if request.method == 'POST':
        request.session['django_timezone'] = request.POST['timezone']
        return redirect('/')
    else:
        return render(request, 'template.html', {'timezones': pytz.common_timezones})

def user_log_post(request):
    if request.user.is_authenticated:
        entry = log.objects.create(Datetime=request.POST.get('datetime'), log_type=request.POST.get('log_type'), user=request.user, Log=request.POST.get('log'))
        entry.save()
        return HttpResponse("Posted.")
    return HttpResponse('Not Posted')

def authenticate_user(request):
    user = authenticate(username=request.POST.get('username'),  password=request.POST.get('password'))
    if user is not None:
        return HttpResponse("Authenticated")
    return HttpResponse("Not Authenticated")

def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Your account has been created! You are now able to log in')
            return redirect('login')
    else:
        form = UserRegisterForm()
    return render(request, 'users/register.html', {'form': form})


@login_required
def profile(request):
    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = ProfileUpdateForm(request.POST,
                                   request.FILES,
                                   instance=request.user.profile)
        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'Your account has been updated!')
            return redirect('profile')

    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = ProfileUpdateForm(instance=request.user.profile)

    context = {
        'u_form': u_form,
        'p_form': p_form
    }

    return render(request, 'users/profile.html', context)