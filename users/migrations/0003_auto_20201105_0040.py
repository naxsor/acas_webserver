# Generated by Django 3.1.2 on 2020-11-05 04:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_log'),
    ]

    operations = [
        migrations.RenameField(
            model_name='log',
            old_name='Log Type',
            new_name='log_type',
        ),
    ]
