import os

import django.db
from django.conf import settings
import socket
from django.db import OperationalError

def test_connection_to_db(database_name):
    try:
        db_definition = getattr(settings, 'DATABASES')[database_name]
        s = socket.create_connection((db_definition['HOST'], db_definition['PORT']), 1)
        s.close()
        return True
    except (AttributeError, socket.timeout, OSError, OperationalError) as e:
        return False


class FailoverRouter(object):
    """A router that defaults reads to the follower but provides a failover back to the default"""

    def db_for_read(self, model, **hints):
        if model._meta.app_label == "sensors":
            return 'sensor_db'
        else:
            return 'default'

    def db_for_read_2(self, model, **hints):
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

    # def allow_relation(self, obj1, obj2, **hints):
    #     """
    #     Allow relations if a model in the auth or contenttypes apps is
    #     involved.
    #     """
    #     db_set = {'sensor_db', 'default', 'sensor_db_write', 'default_write'}
    #     if obj1._meta.app_label in db_set or obj2._meta.app_label in db_set:
    #         return True
    #     return False

    def allow_syncdb(self, db, app_label, model_name=None, **hints):
        "Make sure only the default db allows syncdb"
        if app_label == 'sensors':
            return db == 'sensor_db'
        return db == 'default'

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        "Make sure only the default db allows syncdb"
        if app_label == 'sensors':
            return db == 'sensor_db_write'
        return db == 'default_write'
