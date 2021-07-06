# Generated by Django 3.1.3 on 2021-05-12 17:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sensors', '0003_auto_20210429_2033'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dma',
            name='colsame_rh',
            field=models.IntegerField(blank=True, db_column='Relative Humidity', null=True),
        ),
        migrations.AlterField(
            model_name='dma',
            name='colsamp_avg',
            field=models.FloatField(blank=True, db_column='Average Column Flow', null=True),
        ),
        migrations.AlterField(
            model_name='dma',
            name='colsamp_sdec',
            field=models.FloatField(blank=True, db_column='Standard Deviation of Column Flow', null=True),
        ),
        migrations.AlterField(
            model_name='dma',
            name='colsamp_temp',
            field=models.FloatField(blank=True, db_column='Temperature', null=True),
        ),
        migrations.AlterField(
            model_name='dma',
            name='cond_temp',
            field=models.FloatField(blank=True, db_column='Condenser Temperature', null=True),
        ),
        migrations.AlterField(
            model_name='dma',
            name='sat_temp',
            field=models.FloatField(blank=True, db_column='Saturator Temperature', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='bandwidths_0',
            field=models.FloatField(blank=True, db_column='Bandwidths 0', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='bandwidths_1',
            field=models.FloatField(blank=True, db_column='Bandwidths 1', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='bandwidths_2',
            field=models.FloatField(blank=True, db_column='Bandwidths 2', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='bandwidths_3',
            field=models.FloatField(blank=True, db_column='Bandwidths 3', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='baseline_0',
            field=models.FloatField(blank=True, db_column='Baseline 0', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='baseline_1',
            field=models.FloatField(blank=True, db_column='Baseline 1', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='baseline_2',
            field=models.FloatField(blank=True, db_column='Baseline 2', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='baseline_3',
            field=models.FloatField(blank=True, db_column='Baseline 3', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='exited_particles_count_cm3_field',
            field=models.FloatField(blank=True, db_column='Exited Particles Count', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='sample_mass_flow_rate_l_min_field',
            field=models.FloatField(blank=True, db_column='Sample Mass Flow Rate', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='sheath_sample_mass_flow_l_min_field',
            field=models.FloatField(blank=True, db_column='Sheath Sample Mass Flow', null=True),
        ),
        migrations.AlterField(
            model_name='uv_lif',
            name='total_particle_count_all_cm3_field',
            field=models.FloatField(blank=True, db_column='Total Particle Count', null=True),
        ),
    ]
