# Generated by Django 3.1.3 on 2021-05-12 18:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sensors', '0005_auto_20210512_1757'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dma',
            name='sheath_temp',
            field=models.FloatField(blank=True, db_column='Sheath Temperature', null=True),
        ),
    ]
