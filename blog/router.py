import os

import django.db
from django.conf import settings
import socket
from django.db import OperationalError

def test_connection_to_db(database_name):
    try:
        db_definition = getattr(settings, 'DATABASES')[database_name]
        s = socket.create_connection((db_definition['HOST'], db_definition['PORT']), 3)
        s.close()
        return True
    except (AttributeError, socket.timeout, OSError, OperationalError) as e:
        return False


class FailoverRouter(object):
    """A router that defaults reads to the follower but provides a failover back to the default"""

    def db_for_read(self, model, **hints):
        if model._meta.app_label == "sensors":
            if test_connection_to_db('sensor_db_write'):
                return 'sensor_db_write'
            return 'sensor_db'
        else:
            if test_connection_to_db('default_write'):
                return 'default_write'
            return 'default'

    def db_for_write(self, model, **hints):
        "Point all writes to the default db"
        if model._meta.app_label == "sensors":
            if test_connection_to_db('sensor_db_write'):
                return 'sensor_db_write'
            return None
        else:
            if test_connection_to_db('default_write'):
                return 'default_write'
            return None

    def allow_syncdb(self, db, app_label, model_name=None, **hints):
        "Make sure only the default db allows syncdb"
        if app_label == 'sensors':
            return db == 'sensor_db'
        return db == 'default'
