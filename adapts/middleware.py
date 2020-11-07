from django.contrib.auth.middleware import RemoteUserBackend
from datetime import datetime
from django.utils.deprecation import MiddlewareMixin
from django.middleware.csrf import get_token
import pytz
from django.utils import timezone

class TimezoneMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        tzname = request.session.get('django_timezone')
        if tzname:
            timezone.activate(pytz.timezone(tzname))
        else:
            timezone.deactivate()
        return self.get_response(request)


class CsrfTokenMiddleware(MiddlewareMixin):
    def process_request(self, request):
        get_token(request)

class AuthMiddleware(RemoteUserBackend):
    def __init__(self, get_response):
        try:
            user = User.objects.get(username=username)
            if user.check_password(password):
                user.last_login = datetime.now()
                user.save()
                return user
        except ObjectDoesNotExist:
            # Run the default password hasher once to reduce the timing
            # difference between an existing and a non-existing user (#20760).
            User().set_password(password)

    def __call__(self, request):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None

