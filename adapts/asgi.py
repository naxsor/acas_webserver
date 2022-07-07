"""
ASGI config for adapts project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.1/howto/deployment/asgi/
"""

import os
import django
from channels.routing import ProtocolTypeRouter
from django.core.asgi import get_asgi_application


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'adapts.settings')
django.setup()

application_django = get_asgi_application()

application = ProtocolTypeRouter({
    "http": application_django,
    # Just HTTP for now. (We can add other protocols later.)
})
