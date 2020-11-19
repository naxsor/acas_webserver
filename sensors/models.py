from django.db import models

# Create your models here.
from django.db import models

# Create your models here.
class Sensor(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, blank=True, null=True)
    acronym = models.CharField(max_length=50, blank=True, null=True)
    data_table = models.CharField(db_column='data table', max_length=50, blank=True, null=True)  # Field renamed to remove unsuitable characters.
    available = models.BooleanField(blank=True, null=True)
    process = models.CharField(db_column='Process', max_length=50, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return f'{self.name} ({self.acronym})'

    class Meta:
        managed = True
        db_table = 'sensor'

class File(models.Model):
    sensor = models.OneToOneField(Sensor, models.CASCADE, primary_key=True)
    file_name = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'files'

class Inlet_Switcher_State(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    inlet_state = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'inlet_switcher_state'

class Primary_Variables(models.Model):
    id = models.AutoField(primary_key=True)
    sensor = models.ForeignKey(Sensor, models.CASCADE, db_column='Sensor id', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    variable_name = models.CharField(db_column='Variable Name', max_length=50, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    parameter_unit = models.CharField(db_column='Parameter Unit', max_length=50, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    housekeeping = models.BooleanField(db_column='Housekeeping', blank=True, null=True)  # Field name made lowercase.
    available = models.BooleanField(db_column='Available', blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return f'{self.sensor} - {self.variable_name}'

    class Meta:
        managed = True
        db_table = 'primary_variables'
        verbose_name = 'Variable'
        ordering = [models.F('sensor').asc(nulls_last=True)]

class Process(models.Model):
    id = models.AutoField(primary_key=True)
    sensor = models.ForeignKey(Sensor, on_delete=models.CASCADE, db_column='Sensor id', blank=True, null=True, related_name='+')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    name = models.CharField(max_length=50, blank=True, null=True)
    status = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'process'

class Log(models.Model):
    id = models.AutoField(primary_key=True)
    sensor_id = models.ForeignKey(Sensor, models.DO_NOTHING, db_column='Sensor id', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    datetime = models.DateTimeField(blank=True, null=True)
    log_type = models.CharField(max_length=15, blank=True, null=True)
    log = models.CharField(max_length=300, blank=True, null=True)

    def __str__(self):
        return f'{self.datetime} - {self.sensor_id} - {self.log_type} - {self.log}'

    class Meta:
        managed = True
        db_table = 'sensor_log'

# Create your models here.
class Ccn(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    super_saturation = models.FloatField(db_column='Super Saturation', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    column_temperature_stabilized = models.FloatField(db_column='Column Temperature Stabilized', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    delta_t = models.FloatField(db_column='Delta T', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    t1_set = models.FloatField(db_column='T1 Set', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    t1_read = models.FloatField(db_column='T1 Read', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    t2_set = models.FloatField(db_column='T2 Set', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    t2_read = models.FloatField(db_column='T2 Read', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    t3_set = models.FloatField(db_column='T3 Set', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    t3_read = models.FloatField(db_column='T3 Read', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    naftion_set = models.FloatField(db_column='Naftion Set', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    t_naftion = models.FloatField(db_column='T Naftion', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    inlet_set = models.FloatField(db_column='Inlet Set', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    t_inlet = models.FloatField(db_column='T Inlet', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    ocp_set = models.FloatField(db_column='OCP Set', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    t_ocp = models.FloatField(db_column='T OCP', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    t_sample = models.FloatField(db_column='T Sample', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_flow_rate = models.FloatField(db_column='Sample Flow Rate', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_flow_rate = models.FloatField(db_column='Sheath Flow Rate', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_pressure = models.FloatField(db_column='Sample Pressure', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    laser_current = models.FloatField(db_column='Laser Current', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    overflow = models.FloatField(db_column='Overflow', blank=True, null=True)  # Field name made lowercase.
    baseline_monitor = models.FloatField(db_column='Baseline Monitor', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    first_stage_monitor = models.FloatField(db_column='First Stage Monitor', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin = models.FloatField(db_column='Bin', blank=True, null=True)  # Field name made lowercase.
    bin_1 = models.FloatField(db_column='Bin 1', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_2 = models.FloatField(db_column='Bin 2', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_3 = models.FloatField(db_column='Bin 3', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_4 = models.FloatField(db_column='Bin 4', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_5 = models.FloatField(db_column='Bin 5', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_6 = models.FloatField(db_column='Bin 6', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_7 = models.FloatField(db_column='Bin 7', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_8 = models.FloatField(db_column='Bin 8', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_9 = models.FloatField(db_column='Bin 9', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_10 = models.FloatField(db_column='Bin 10', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_11 = models.FloatField(db_column='Bin 11', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_12 = models.FloatField(db_column='Bin 12', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_13 = models.FloatField(db_column='Bin 13', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_14 = models.FloatField(db_column='Bin 14', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_15 = models.FloatField(db_column='Bin 15', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_16 = models.FloatField(db_column='Bin 16', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_17 = models.FloatField(db_column='Bin 17', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_18 = models.FloatField(db_column='Bin 18', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_19 = models.FloatField(db_column='Bin 19', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_20 = models.FloatField(db_column='Bin 20', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    number_concentration = models.FloatField(db_column='Number Concentration', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    valve_set = models.FloatField(db_column='Valve Set', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    alarm_code = models.FloatField(db_column='Alarm Code', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    alarm_sum = models.FloatField(db_column='Alarm Sum', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    cmd = models.FloatField(db_column='CMD', blank=True, null=True)  # Field name made lowercase.
    gmd = models.FloatField(db_column='GMD', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'sensor_ccn'

class Clap(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    record_type = models.IntegerField(db_column='Record Type', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    flag = models.IntegerField(db_column='Flag', blank=True, null=True)  # Field name made lowercase.
    elapsed_time = models.IntegerField(db_column='Elapsed Time', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    filter_id = models.IntegerField(db_column='Filter Id', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    active_spot = models.IntegerField(db_column='Active Spot', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_flow_rate = models.FloatField(db_column='Sample Flow Rate', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_volume = models.FloatField(db_column='Sample Volume', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    case_temperature = models.FloatField(db_column='Case Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    air_temperature = models.FloatField(db_column='Air Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_0_dark = models.FloatField(db_column='Channel 0 Dark', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_0_red = models.FloatField(db_column='Channel 0 Red', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_0_blue = models.FloatField(db_column='Channel 0 Blue', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_0_green = models.FloatField(db_column='Channel 0 Green', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_1_dark = models.FloatField(db_column='Channel 1 Dark', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_1_red = models.FloatField(db_column='Channel 1 Red', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_1_blue = models.FloatField(db_column='Channel 1 Blue', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_1_green = models.FloatField(db_column='Channel 1 Green', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_2_dark = models.FloatField(db_column='Channel 2 Dark', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_2_red = models.FloatField(db_column='Channel 2 Red', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_2_blue = models.FloatField(db_column='Channel 2 Blue', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_2_green = models.FloatField(db_column='Channel 2 Green', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_3_dark = models.FloatField(db_column='Channel 3 Dark', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_3_red = models.FloatField(db_column='Channel 3 Red', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_3_blue = models.FloatField(db_column='Channel 3 Blue', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_3_green = models.FloatField(db_column='Channel 3 Green', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_4_dark = models.FloatField(db_column='Channel 4 Dark', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_4_red = models.FloatField(db_column='Channel 4 Red', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_4_blue = models.FloatField(db_column='Channel 4 Blue', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_4_green = models.FloatField(db_column='Channel 4 Green', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_5_dark = models.FloatField(db_column='Channel 5 Dark', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_5_red = models.FloatField(db_column='Channel 5 Red', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_5_blue = models.FloatField(db_column='Channel 5 Blue', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_5_green = models.FloatField(db_column='Channel 5 Green', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_6_dark = models.FloatField(db_column='Channel 6 Dark', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_6_red = models.FloatField(db_column='Channel 6 Red', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_6_blue = models.FloatField(db_column='Channel 6 Blue', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_6_green = models.FloatField(db_column='Channel 6 Green', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_7_dark = models.FloatField(db_column='Channel 7 Dark', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_7_red = models.FloatField(db_column='Channel 7 Red', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_7_blue = models.FloatField(db_column='Channel 7 Blue', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_7_green = models.FloatField(db_column='Channel 7 Green', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_8_dark = models.FloatField(db_column='Channel 8 Dark', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_8_red = models.FloatField(db_column='Channel 8 Red', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_8_blue = models.FloatField(db_column='Channel 8 Blue', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_8_green = models.FloatField(db_column='Channel 8 Green', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_9_dark = models.FloatField(db_column='Channel 9 Dark', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_9_red = models.FloatField(db_column='Channel 9 Red', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_9_blue = models.FloatField(db_column='Channel 9 Blue', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    channel_9_green = models.FloatField(db_column='Channel 9 Green', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = True
        db_table = 'sensor_clap'

class Dma(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    start_datetime = models.DateTimeField(db_column='Start Datetime')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    end_datetime = models.DateTimeField(db_column='End Datetime')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    scan_direction = models.IntegerField(db_column='Scan Direction', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_sample_pressure = models.IntegerField(db_column='Sheath Sample Pressure', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_temp = models.FloatField(db_column='Sheath Temp', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_average = models.FloatField(db_column='Sheath Average', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_standard_deviation = models.FloatField(db_column='Sheath Standard Deviation', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_rh = models.IntegerField(db_column='Sheath RH', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    colsamp_avg = models.FloatField(blank=True, null=True)
    colsamp_sdec = models.FloatField(blank=True, null=True)
    colsame_rh = models.IntegerField(blank=True, null=True)
    colsamp_temp = models.FloatField(blank=True, null=True)
    cpc_a_flow_average = models.FloatField(db_column='CPC A Flow Average', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    cpc_a_standard_deviation = models.FloatField(db_column='CPC A Standard Deviation', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sat_temp = models.FloatField(blank=True, null=True)
    cond_temp = models.FloatField(blank=True, null=True)
    sems_errors = models.FloatField(db_column='SEMS Errors', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    mcpc_errors = models.FloatField(db_column='MCPC Errors', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    impactor_press = models.FloatField(db_column='Impactor Press', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_1 = models.FloatField(db_column='Bin Diameter 1', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_2 = models.FloatField(db_column='Bin Diameter 2', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_3 = models.FloatField(db_column='Bin Diameter 3', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_4 = models.FloatField(db_column='Bin Diameter 4', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_5 = models.FloatField(db_column='Bin Diameter 5', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_6 = models.FloatField(db_column='Bin Diameter 6', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_7 = models.FloatField(db_column='Bin Diameter 7', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_8 = models.FloatField(db_column='Bin Diameter 8', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_9 = models.FloatField(db_column='Bin Diameter 9', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_10 = models.FloatField(db_column='Bin Diameter 10', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_11 = models.FloatField(db_column='Bin Diameter 11', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_12 = models.FloatField(db_column='Bin Diameter 12', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_13 = models.FloatField(db_column='Bin Diameter 13', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_14 = models.FloatField(db_column='Bin Diameter 14', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_15 = models.FloatField(db_column='Bin Diameter 15', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_16 = models.FloatField(db_column='Bin Diameter 16', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_17 = models.FloatField(db_column='Bin Diameter 17', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_18 = models.FloatField(db_column='Bin Diameter 18', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_19 = models.FloatField(db_column='Bin Diameter 19', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_20 = models.FloatField(db_column='Bin Diameter 20', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_21 = models.FloatField(db_column='Bin Diameter 21', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_22 = models.FloatField(db_column='Bin Diameter 22', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_23 = models.FloatField(db_column='Bin Diameter 23', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_24 = models.FloatField(db_column='Bin Diameter 24', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_25 = models.FloatField(db_column='Bin Diameter 25', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_26 = models.FloatField(db_column='Bin Diameter 26', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_27 = models.FloatField(db_column='Bin Diameter 27', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_28 = models.FloatField(db_column='Bin Diameter 28', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_29 = models.FloatField(db_column='Bin Diameter 29', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_30 = models.FloatField(db_column='Bin Diameter 30', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_31 = models.FloatField(db_column='Bin Diameter 31', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_32 = models.FloatField(db_column='Bin Diameter 32', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_33 = models.FloatField(db_column='Bin Diameter 33', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_34 = models.FloatField(db_column='Bin Diameter 34', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_35 = models.FloatField(db_column='Bin Diameter 35', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_36 = models.FloatField(db_column='Bin Diameter 36', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_37 = models.FloatField(db_column='Bin Diameter 37', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_38 = models.FloatField(db_column='Bin Diameter 38', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_39 = models.FloatField(db_column='Bin Diameter 39', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_40 = models.FloatField(db_column='Bin Diameter 40', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_41 = models.FloatField(db_column='Bin Diameter 41', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_42 = models.FloatField(db_column='Bin Diameter 42', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_43 = models.FloatField(db_column='Bin Diameter 43', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_44 = models.FloatField(db_column='Bin Diameter 44', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_45 = models.FloatField(db_column='Bin Diameter 45', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_46 = models.FloatField(db_column='Bin Diameter 46', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_47 = models.FloatField(db_column='Bin Diameter 47', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_48 = models.FloatField(db_column='Bin Diameter 48', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_49 = models.FloatField(db_column='Bin Diameter 49', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_50 = models.FloatField(db_column='Bin Diameter 50', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_51 = models.FloatField(db_column='Bin Diameter 51', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_52 = models.FloatField(db_column='Bin Diameter 52', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_53 = models.FloatField(db_column='Bin Diameter 53', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_54 = models.FloatField(db_column='Bin Diameter 54', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_55 = models.FloatField(db_column='Bin Diameter 55', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_56 = models.FloatField(db_column='Bin Diameter 56', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_57 = models.FloatField(db_column='Bin Diameter 57', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_58 = models.FloatField(db_column='Bin Diameter 58', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_59 = models.FloatField(db_column='Bin Diameter 59', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_diameter_60 = models.FloatField(db_column='Bin Diameter 60', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_1 = models.FloatField(db_column='Bin Constant 1', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_2 = models.FloatField(db_column='Bin Constant 2', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_3 = models.FloatField(db_column='Bin Constant 3', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_4 = models.FloatField(db_column='Bin Constant 4', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_5 = models.FloatField(db_column='Bin Constant 5', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_6 = models.FloatField(db_column='Bin Constant 6', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_7 = models.FloatField(db_column='Bin Constant 7', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_8 = models.FloatField(db_column='Bin Constant 8', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_9 = models.FloatField(db_column='Bin Constant 9', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_10 = models.FloatField(db_column='Bin Constant 10', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_11 = models.FloatField(db_column='Bin Constant 11', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_12 = models.FloatField(db_column='Bin Constant 12', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_13 = models.FloatField(db_column='Bin Constant 13', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_14 = models.FloatField(db_column='Bin Constant 14', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_15 = models.FloatField(db_column='Bin Constant 15', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_16 = models.FloatField(db_column='Bin Constant 16', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_17 = models.FloatField(db_column='Bin Constant 17', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_18 = models.FloatField(db_column='Bin Constant 18', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_19 = models.FloatField(db_column='Bin Constant 19', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_20 = models.FloatField(db_column='Bin Constant 20', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_21 = models.FloatField(db_column='Bin Constant 21', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_22 = models.FloatField(db_column='Bin Constant 22', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_23 = models.FloatField(db_column='Bin Constant 23', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_24 = models.FloatField(db_column='Bin Constant 24', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_25 = models.FloatField(db_column='Bin Constant 25', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_26 = models.FloatField(db_column='Bin Constant 26', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_27 = models.FloatField(db_column='Bin Constant 27', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_28 = models.FloatField(db_column='Bin Constant 28', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_29 = models.FloatField(db_column='Bin Constant 29', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_30 = models.FloatField(db_column='Bin Constant 30', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_31 = models.FloatField(db_column='Bin Constant 31', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_32 = models.FloatField(db_column='Bin Constant 32', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_33 = models.FloatField(db_column='Bin Constant 33', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_34 = models.FloatField(db_column='Bin Constant 34', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_35 = models.FloatField(db_column='Bin Constant 35', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_36 = models.FloatField(db_column='Bin Constant 36', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_37 = models.FloatField(db_column='Bin Constant 37', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_38 = models.FloatField(db_column='Bin Constant 38', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_39 = models.FloatField(db_column='Bin Constant 39', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_40 = models.FloatField(db_column='Bin Constant 40', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_41 = models.FloatField(db_column='Bin Constant 41', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_42 = models.FloatField(db_column='Bin Constant 42', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_43 = models.FloatField(db_column='Bin Constant 43', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_44 = models.FloatField(db_column='Bin Constant 44', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_45 = models.FloatField(db_column='Bin Constant 45', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_46 = models.FloatField(db_column='Bin Constant 46', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_47 = models.FloatField(db_column='Bin Constant 47', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_48 = models.FloatField(db_column='Bin Constant 48', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_49 = models.FloatField(db_column='Bin Constant 49', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_50 = models.FloatField(db_column='Bin Constant 50', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_51 = models.FloatField(db_column='Bin Constant 51', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_52 = models.FloatField(db_column='Bin Constant 52', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_53 = models.FloatField(db_column='Bin Constant 53', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_54 = models.FloatField(db_column='Bin Constant 54', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_55 = models.FloatField(db_column='Bin Constant 55', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_56 = models.FloatField(db_column='Bin Constant 56', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_57 = models.FloatField(db_column='Bin Constant 57', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_58 = models.FloatField(db_column='Bin Constant 58', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_59 = models.FloatField(db_column='Bin Constant 59', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_constant_60 = models.FloatField(db_column='Bin Constant 60', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = True
        db_table = 'sensor_dma'
        unique_together = (('datetime', 'start_datetime', 'end_datetime'),)

class Hygrometer(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    water_vapor_content = models.FloatField(db_column='Water Vapor Content', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    water_vapor_pressure = models.FloatField(db_column='Water Vapor Pressure', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    water_vapor_temperature = models.FloatField(db_column='Water Vapor Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = True
        db_table = 'sensor_hygrometer'

class Uv_Lif(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    number_408_board_temperature = models.FloatField(db_column='408 Board Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it wasn't a valid Python identifier.
    bandwidths_0 = models.FloatField(blank=True, null=True)
    bandwidths_1 = models.FloatField(blank=True, null=True)
    bandwidths_2 = models.FloatField(blank=True, null=True)
    bandwidths_3 = models.FloatField(blank=True, null=True)
    baseline_0 = models.FloatField(blank=True, null=True)
    baseline_1 = models.FloatField(blank=True, null=True)
    baseline_2 = models.FloatField(blank=True, null=True)
    baseline_3 = models.FloatField(blank=True, null=True)
    clump_count = models.FloatField(blank=True, null=True)
    exited_particles_count_cm3_field = models.FloatField(db_column='Exited Particles Count[#/cm3]', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    total_particle_count_all_cm3_field = models.FloatField(db_column='Total Particle Count [all][#/cm3]', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    h12310_temperature = models.FloatField(blank=True, null=True)
    max_transit_time_counts = models.FloatField(blank=True, null=True)
    min_transit_time_counts = models.FloatField(blank=True, null=True)
    missed_particle_count = models.FloatField(blank=True, null=True)
    num_discarted_particles = models.FloatField(blank=True, null=True)
    num_oversize_rejects = models.FloatField(blank=True, null=True)
    relative_humidity = models.FloatField(db_column='Relative Humidity', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    system_power = models.FloatField(db_column='System Power', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_mass_flow_rate_l_min_field = models.FloatField(db_column='Sample Mass Flow Rate [L/min]', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it endedwith '_'.
    sample_pressure = models.FloatField(db_column='Sample Pressure', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_flow_rate_set_point = models.FloatField(db_column='Sample Flow Rate Set Point', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_temperature = models.FloatField(db_column='Sample Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_flow_rate = models.FloatField(db_column='Sample Flow Rate', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_sample_mass_flow_l_min_field = models.FloatField(db_column='Sheath Sample Mass Flow[L/min]', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    sheath_sample_pressure = models.FloatField(db_column='Sheath Sample Pressure', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_sample_flow_rate_set_point = models.FloatField(db_column='Sheath Sample Flow Rate Set Point', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_sample_temperature = models.FloatField(db_column='Sheath Sample Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_flow_rate = models.FloatField(db_column='Sheath Flow Rate', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sizer_oversize_count = models.FloatField(blank=True, null=True)
    temperature = models.FloatField(blank=True, null=True)
    total_particle_count = models.FloatField(blank=True, null=True)
    total_trigger_count = models.FloatField(blank=True, null=True)
    valid_particle_count = models.FloatField(blank=True, null=True)
    xe1_power = models.FloatField(blank=True, null=True)
    xe2_power = models.FloatField(blank=True, null=True)
    asphericity = models.FloatField(db_column='Asphericity', blank=True, null=True)  # Field name made lowercase.
    density_gcm3 = models.FloatField(blank=True, null=True)
    ep_overflow_flag = models.FloatField(blank=True, null=True)
    flag_excited = models.FloatField(blank=True, null=True)
    mass_ug = models.FloatField(blank=True, null=True)
    nf_shape_0 = models.FloatField(blank=True, null=True)
    nf_shape_1 = models.FloatField(blank=True, null=True)
    nf_shape_2 = models.FloatField(blank=True, null=True)
    nf_shape_3 = models.FloatField(blank=True, null=True)
    nf_sizer_relative_peak = models.FloatField(blank=True, null=True)
    nf_sizer_transit_time_nsec = models.FloatField(blank=True, null=True)
    size_of_particle_um_field = models.FloatField(db_column='Size of Particle[um]', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    xe1_a_fluorescence_peak = models.FloatField(db_column='Xe1-A Fluorescence Peak', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    xe1_b_fluorescence_peak = models.FloatField(db_column='Xe1-B Fluorescence Peak', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    xe2_a_fluorescence_peak = models.FloatField(db_column='Xe2-A Fluorescence Peak', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    xe2_b_fluorescence_peak = models.FloatField(db_column='Xe2-B Fluorescence Peak', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = True
        db_table = 'sensor_uv_lif'

class SensorCpd3Clap(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    transmittance = models.FloatField(db_column='Transmittance', blank=True, null=True)  # Field name made lowercase.
    aerosol_light_absorption_coefficient = models.FloatField(db_column='Aerosol light absorption coefficient', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    transmittance_b = models.FloatField(db_column='Transmittance B', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = True
        db_table = 'sensor_cpd3_clap'

class SensorCpd3Cpc(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    condensation_nuclei_concentration = models.FloatField(db_column='Condensation nuclei concentration', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = True
        db_table = 'sensor_cpd3_cpc'

class SensorCpd3Neph(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    aerosol_light_scattering_coefficient = models.FloatField(db_column='Aerosol light scattering coefficient', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = True
        db_table = 'sensor_cpd3_neph'

class SensorCpd3PwdVaisala(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    ambient_temperature = models.FloatField(db_column='Ambient Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    precipitation_rate = models.FloatField(db_column='Precipitation Rate', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    present_weather_flag = models.FloatField(db_column='Present Weather Flag', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    present_weather_code = models.FloatField(db_column='Present Weather Code', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    visibility_distance = models.FloatField(db_column='Visibility Distance', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = True
        db_table = 'sensor_cpd3_pwd_vaisala'

class SensorCpd3WmtVaisala(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    wind_direction = models.FloatField(db_column='Wind Direction', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    wind_speed = models.FloatField(db_column='Wind Speed', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = True
        db_table = 'sensor_cpd3_wmt_vaisala'

class SensorCpd3WxtVaisala(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    ambient_pressure = models.FloatField(db_column='Ambient Pressure', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    ambient_temperature = models.FloatField(db_column='Ambient Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    ambient_relative_humidity = models.FloatField(db_column='Ambient Relative Humidity', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    solar_radiation = models.FloatField(db_column='Solar Radiation', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    wind_direction = models.FloatField(db_column='Wind Direction', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    precipitation_rate = models.FloatField(db_column='Precipitation Rate', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    wind_speed = models.FloatField(db_column='Wind Speed', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    wind_gust_speed = models.FloatField(db_column='Wind Gust Speed', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = True
        db_table = 'sensor_cpd3_wxt_vaisala'
