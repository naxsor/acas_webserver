
# Create your models here.
from django.db import models
from tinymce.models import HTMLField

# Create your models here.
class Sensor(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, blank=True, null=True)
    company = models.CharField(max_length=50, blank=True, null=True)
    model = models.CharField(max_length=50, blank=True, null=True)
    acronym = models.CharField(max_length=50, blank=True, null=True)
    info = HTMLField(verbose_name='Information', null=True, blank=True)
    measu_prop = HTMLField(verbose_name='Property Measured', null=True, blank=True)
    measu_prin = HTMLField(verbose_name='Measurement principle', null=True, blank=True)
    data_table = models.CharField(db_column='data table', max_length=50, blank=True, null=True)  # Field renamed to remove unsuitable characters.
    available = models.BooleanField(blank=True, null=True)
    process = models.CharField(db_column='Process', max_length=50, blank=True, null=True)  # Field name made lowercase.
    type = models.CharField(max_length=30, blank=True)
    image = models.ImageField(default='default.jpg', upload_to='sensor_images', null=True, blank=True)
    image_description = models.TextField(verbose_name='Image Description', null=True, blank=True)
    image_diagram = models.ImageField(default='default.jpg', upload_to='diagram_example', null=True, blank=True)
    diagram_description = models.TextField(verbose_name='Diagram Description', null=True, blank=True)
    image_plot = models.ImageField(default='default.jpg', upload_to='plot_example', null=True, blank=True)
    plot_description = models.TextField(verbose_name='Plot Description', null=True, blank=True)

    def __str__(self):
        return f'{self.name} ({self.acronym})'

    class Meta:
        managed = True
        db_table = 'sensor'

class ACAS_part(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    acronym = models.CharField(max_length=50, blank=True, null=True)
    type = models.CharField(max_length=30, blank=True)
    company = models.CharField(max_length=50, blank=True, null=True)
    model = models.CharField(max_length=50, blank=True, null=True)
    measu_prop =  HTMLField(verbose_name='Property Measured', null=True, blank=True)
    measu_prin =  HTMLField(verbose_name='Measurement principle', null=True, blank=True)
    image = models.ImageField(default='default.jpg', upload_to='sensor_images', null=True, blank=True)
    image_description = models.TextField(verbose_name='Image Description', null=True, blank=True)
    image_diagram = models.ImageField(default='default.jpg', upload_to='diagram_example', null=True, blank=True)
    diagram_description = models.TextField(verbose_name='Diagram Description', null=True, blank=True)
    image_plot = models.ImageField(default='default.jpg', upload_to='plot_example', null=True, blank=True)
    plot_description = models.TextField(verbose_name='Plot Description', null=True, blank=True)

    def __str__(self):
        return f'{self.name} ({self.acronym})'

    class Meta:
        verbose_name = 'System Part'

class Reference(models.Model):
    sensor = models.ForeignKey(Sensor, models.CASCADE)
    reference = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'references'

    def __str__(self):
        return f'{self.sensor} ({self.pk})'

class File(models.Model):
    sensor = models.OneToOneField(Sensor, models.CASCADE, primary_key=True)
    file_name = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'files'

class Inlet_Switcher_State(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    inlet_selected = models.IntegerField(blank=True, null=True)
    inlet_name = models.CharField(max_length=15, null=True)
    inlet_1_state = models.CharField(max_length=4, null=True)
    inlet_2_state = models.CharField(max_length=4, null=True)

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

class liis(models.Model):
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    utc_offset = models.IntegerField(db_column='UTC Offset', blank=True, null=True)
    incand_part_conc = models.FloatField(db_column='Incandescence Particle Concentration', blank=True, null=True)
    scatt_part_conc = models.FloatField(db_column='Scattering Particle Concentration', blank=True, null=True)
    incand_mass_conc = models.FloatField(db_column='Incandescence Mass Concentration', blank=True, null=True)
    incand_mass_conc = models.FloatField(db_column='Total Mass per Second', blank=True, null=True)
    scatt_bin_1 = models.FloatField(db_column='Scatter Bin 1', blank=True, null=True)
    scatt_bin_2 = models.FloatField(db_column='Scatter Bin 2', blank=True, null=True)
    scatt_bin_3 = models.FloatField(db_column='Scatter Bin 3', blank=True, null=True)
    scatt_bin_4 = models.FloatField(db_column='Scatter Bin 4', blank=True, null=True)
    scatt_bin_5 = models.FloatField(db_column='Scatter Bin 5', blank=True, null=True)
    scatt_bin_6 = models.FloatField(db_column='Scatter Bin 6', blank=True, null=True)
    scatt_bin_7 = models.FloatField(db_column='Scatter Bin 7', blank=True, null=True)
    scatt_bin_8 = models.FloatField(db_column='Scatter Bin 8', blank=True, null=True)
    scatt_bin_9 = models.FloatField(db_column='Scatter Bin 9', blank=True, null=True)
    scatt_bin_10 = models.FloatField(db_column='Scatter Bin 10', blank=True, null=True)
    scatt_bin_11 = models.FloatField(db_column='Scatter Bin 11', blank=True, null=True)
    scatt_bin_12 = models.FloatField(db_column='Scatter Bin 12', blank=True, null=True)
    scatt_bin_13 = models.FloatField(db_column='Scatter Bin 13', blank=True, null=True)
    scatt_bin_14 = models.FloatField(db_column='Scatter Bin 14', blank=True, null=True)
    scatt_bin_15 = models.FloatField(db_column='Scatter Bin 15', blank=True, null=True)
    scatt_bin_16 = models.FloatField(db_column='Scatter Bin 16', blank=True, null=True)
    scatt_bin_17 = models.FloatField(db_column='Scatter Bin 17', blank=True, null=True)
    scatt_bin_18 = models.FloatField(db_column='Scatter Bin 18', blank=True, null=True)
    scatt_bin_19 = models.FloatField(db_column='Scatter Bin 19', blank=True, null=True)
    scatt_bin_20 = models.FloatField(db_column='Scatter Bin 20', blank=True, null=True)
    incand_bin_1 = models.FloatField(db_column='Incandescence Bin 1', blank=True, null=True)
    incand_bin_2 = models.FloatField(db_column='Incandescence Bin 2', blank=True, null=True)
    incand_bin_3 = models.FloatField(db_column='Incandescence Bin 3', blank=True, null=True)
    incand_bin_4 = models.FloatField(db_column='Incandescence Bin 4', blank=True, null=True)
    incand_bin_5 = models.FloatField(db_column='Incandescence Bin 5', blank=True, null=True)
    incand_bin_6 = models.FloatField(db_column='Incandescence Bin 6', blank=True, null=True)
    incand_bin_7 = models.FloatField(db_column='Incandescence Bin 7', blank=True, null=True)
    incand_bin_8 = models.FloatField(db_column='Incandescence Bin 8', blank=True, null=True)
    incand_bin_9 = models.FloatField(db_column='Incandescence Bin 9', blank=True, null=True)
    incand_bin_10 = models.FloatField(db_column='Incandescence Bin 10', blank=True, null=True)
    incand_bin_11 = models.FloatField(db_column='Incandescence Bin 11', blank=True, null=True)
    incand_bin_12 = models.FloatField(db_column='Incandescence Bin 12', blank=True, null=True)
    incand_bin_13 = models.FloatField(db_column='Incandescence Bin 13', blank=True, null=True)
    incand_bin_14 = models.FloatField(db_column='Incandescence Bin 14', blank=True, null=True)
    incand_bin_15 = models.FloatField(db_column='Incandescence Bin 15', blank=True, null=True)
    incand_bin_16 = models.FloatField(db_column='Incandescence Bin 16', blank=True, null=True)
    incand_bin_17 = models.FloatField(db_column='Incandescence Bin 17', blank=True, null=True)
    incand_bin_18 = models.FloatField(db_column='Incandescence Bin 18', blank=True, null=True)
    incand_bin_19 = models.FloatField(db_column='Incandescence Bin 19', blank=True, null=True)
    incand_bin_20 = models.FloatField(db_column='Incandescence Bin 20', blank=True, null=True)
    qualified_part = models.FloatField(db_column='Qualified Particles', blank=True, null=True)
    pbp_record = models.FloatField(db_column='PBP Record', blank=True, null=True)
    dual_qual_scatt_incand_part = models.FloatField(db_column='Dual Qualified Scatter and Incandescence Particles', blank=True, null=True)
    qualified_scatt_part = models.FloatField(db_column='Qualified Scatter Only Particles', blank=True, null=True)
    qualifies_incand_part = models.FloatField(db_column='Qualified Incandescence OnlyParticles', blank=True, null=True)
    sheath_flow_read_vccm = models.FloatField(db_column='Sheath Flow Controller Read (v)', blank=True, null=True)
    sheath_flow_read_sccm = models.FloatField(db_column='Sheath Flow Controller Read (s)', blank=True, null=True)
    sheath_flow_press = models.FloatField(db_column='Sheath Flow Controller Pressure', blank=True, null=True)
    sheath_flow_temp = models.FloatField(db_column='Sheath Flow Controller Temperature', blank=True, null=True)
    sample_flow_read_vccm = models.FloatField(db_column='Sample Flow Controller Read (v)', blank=True, null=True)
    sample_flow_read_sccm = models.FloatField(db_column='Sample Flow Controller Read (s)', blank=True, null=True)
    sample_flow_press = models.FloatField(db_column='Sample Flow Controller Pressure', blank=True, null=True)
    sample_flow_temp = models.FloatField(db_column='Sample Flow Controller Temperature', blank=True, null=True)
    laser_tec_temp = models.FloatField(db_column='Laser TEC Temperature', blank=True, null=True)
    inlet_air_temp = models.FloatField(db_column='Inlet Air Temperature', blank=True, null=True)
    heatsink_temp = models.FloatField(db_column='Computer Heatsink Temperature', blank=True, null=True)
    laser_heatsink_temp = models.FloatField(db_column='Laser Heatsink Temperature', blank=True, null=True)
    outlet_air_temp = models.FloatField(db_column='Outlet Air Temperature', blank=True, null=True)
    yag_output_monitor = models.FloatField(db_column='YAG Output Monitor', blank=True, null=True)
    cavity_pressure = models.FloatField(db_column='Cavity Pressure', blank=True, null=True)
    current_monitor_pump_laser = models.FloatField(db_column='Current Monitor Pump Laser', blank=True, null=True)
    pump_laser_power_monitor = models.FloatField(db_column='Pump Laser Power Monitor', blank=True, null=True)
    laser_voltage_monitor = models.FloatField(db_column='Laser Voltage Monitor', blank=True, null=True)
    high_voltage_monitor = models.FloatField(db_column='High Voltage Monitor', blank=True, null=True)
    purge_monitor_flow = models.FloatField(db_column='Purge Flow Monitor', blank=True, null=True)
    board_temperature = models.FloatField(db_column='Board Temperature', blank=True, null=True)
    baseline_sizer_low = models.FloatField(db_column='Baseline Sizer Low', blank=True, null=True)
    baseline_sizer_high = models.FloatField(db_column='Baseline Sizer High', blank=True, null=True)
    baseline_incand_low = models.FloatField(db_column='Baseline Incandescence Low', blank=True, null=True)
    baseline_incand_high = models.FloatField(db_column='Baseline Incandescence High', blank=True, null=True)
    bandwidth_sizer_low = models.FloatField(db_column='Bandwidth Sizer Low', blank=True, null=True)
    bandwidth_sizer_high = models.FloatField(db_column='Bandwidth Sizer High', blank=True, null=True)
    bandwidth_incand_low = models.FloatField(db_column='Bandwidth Incandescence Low', blank=True, null=True)
    bandwidth_incand_high = models.FloatField(db_column='Bandwidth Incandescence High', blank=True, null=True)
    scatt_rel_peak = models.FloatField(db_column='Scattering Relative Peak', blank=True, null=True)
    scatt_transit_time = models.FloatField(db_column='Scatter Transit Time', blank=True, null=True)
    scatt_peak_time = models.FloatField(db_column='Scatter Peak Time', blank=True, null=True)
    scatt_hwhm = models.FloatField(db_column='Scatter HWHM', blank=True, null=True)
    scatt_size = models.FloatField(db_column='Scatter Size', blank=True, null=True)
    incand_rel_peal = models.FloatField(db_column='Incandescence Relative Peak', blank=True, null=True)
    incand_transit_time = models.FloatField(db_column='Incandescence Transit Time', blank=True, null=True)
    incand_peak_time = models.FloatField(db_column='Incandescence Peak Time', blank=True, null=True)
    incand_hwhm = models.FloatField(db_column='Incandescence HWHM', blank=True, null=True)
    incand_delay = models.FloatField(db_column='Incandescence Delay', blank=True, null=True)
    incand_mass = models.FloatField(db_column='Incandescence Mass', blank=True, null=True)
    flag_dual_qualified = models.FloatField(db_column='Flag - Dual Qualified', blank=True, null=True)
    flag_scatt_detected = models.FloatField(db_column='Flag - Scatter Detected', blank=True, null=True)
    flag_incand_detected = models.FloatField(db_column='Flag - Incandescence Detected', blank=True, null=True)
    flag_scatt_rejected = models.FloatField(db_column='Flag - Scatter Rejected', blank=True, null=True)
    flag_incand_rejected = models.FloatField(db_column='Flag - Incandescence Rejected', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'sensor_liis'

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
    sheath_temp = models.FloatField(db_column='Sheath Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_average = models.FloatField(db_column='Sheath Average', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_standard_deviation = models.FloatField(db_column='Sheath Standard Deviation', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_rh = models.IntegerField(db_column='Sheath RH', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    colsamp_avg = models.FloatField(db_column='Average Column Flow', blank=True, null=True)
    colsamp_sdec = models.FloatField(db_column='Standard Deviation of Column Flow', blank=True, null=True)
    colsame_rh = models.IntegerField(db_column='Relative Humidity', blank=True, null=True)
    colsamp_temp = models.FloatField(db_column='Temperature', blank=True, null=True)
    cpc_a_flow_average = models.FloatField(db_column='CPC A Flow Average', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    cpc_a_standard_deviation = models.FloatField(db_column='CPC A Standard Deviation', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sat_temp = models.FloatField(db_column='Saturator Temperature', blank=True, null=True)
    cond_temp = models.FloatField(db_column='Condenser Temperature', blank=True, null=True)
    sems_errors = models.FloatField(db_column='SEMS Errors', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    mcpc_errors = models.FloatField(db_column='MCPC Errors', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    impactor_press = models.FloatField(db_column='Impactor Differential Pressure', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
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
    bin_conc_1 = models.FloatField(db_column='Bin Concentration 1', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_2 = models.FloatField(db_column='Bin Concentration 2', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_3 = models.FloatField(db_column='Bin Concentration 3', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_4 = models.FloatField(db_column='Bin Concentration 4', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_5 = models.FloatField(db_column='Bin Concentration 5', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_6 = models.FloatField(db_column='Bin Concentration 6', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_7 = models.FloatField(db_column='Bin Concentration 7', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_8 = models.FloatField(db_column='Bin Concentration 8', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_9 = models.FloatField(db_column='Bin Concentration 9', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_10 = models.FloatField(db_column='Bin Concentration 10', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_11 = models.FloatField(db_column='Bin Concentration 11', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_12 = models.FloatField(db_column='Bin Concentration 12', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_13 = models.FloatField(db_column='Bin Concentration 13', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_14 = models.FloatField(db_column='Bin Concentration 14', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_15 = models.FloatField(db_column='Bin Concentration 15', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_16 = models.FloatField(db_column='Bin Concentration 16', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_17 = models.FloatField(db_column='Bin Concentration 17', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_18 = models.FloatField(db_column='Bin Concentration 18', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_19 = models.FloatField(db_column='Bin Concentration 19', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_20 = models.FloatField(db_column='Bin Concentration 20', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_21 = models.FloatField(db_column='Bin Concentration 21', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_22 = models.FloatField(db_column='Bin Concentration 22', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_23 = models.FloatField(db_column='Bin Concentration 23', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_24 = models.FloatField(db_column='Bin Concentration 24', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_25 = models.FloatField(db_column='Bin Concentration 25', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_26 = models.FloatField(db_column='Bin Concentration 26', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_27 = models.FloatField(db_column='Bin Concentration 27', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_28 = models.FloatField(db_column='Bin Concentration 28', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_29 = models.FloatField(db_column='Bin Concentration 29', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_30 = models.FloatField(db_column='Bin Concentration 30', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_31 = models.FloatField(db_column='Bin Concentration 31', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_32 = models.FloatField(db_column='Bin Concentration 32', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_33 = models.FloatField(db_column='Bin Concentration 33', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_34 = models.FloatField(db_column='Bin Concentration 34', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_35 = models.FloatField(db_column='Bin Concentration 35', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_36 = models.FloatField(db_column='Bin Concentration 36', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_37 = models.FloatField(db_column='Bin Concentration 37', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_38 = models.FloatField(db_column='Bin Concentration 38', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_39 = models.FloatField(db_column='Bin Concentration 39', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_40 = models.FloatField(db_column='Bin Concentration 40', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_41 = models.FloatField(db_column='Bin Concentration 41', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_42 = models.FloatField(db_column='Bin Concentration 42', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_43 = models.FloatField(db_column='Bin Concentration 43', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_44 = models.FloatField(db_column='Bin Concentration 44', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_45 = models.FloatField(db_column='Bin Concentration 45', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_46 = models.FloatField(db_column='Bin Concentration 46', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_47 = models.FloatField(db_column='Bin Concentration 47', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_48 = models.FloatField(db_column='Bin Concentration 48', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_49 = models.FloatField(db_column='Bin Concentration 49', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_50 = models.FloatField(db_column='Bin Concentration 50', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_51 = models.FloatField(db_column='Bin Concentration 51', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_52 = models.FloatField(db_column='Bin Concentration 52', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_53 = models.FloatField(db_column='Bin Concentration 53', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_54 = models.FloatField(db_column='Bin Concentration 54', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_55 = models.FloatField(db_column='Bin Concentration 55', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_56 = models.FloatField(db_column='Bin Concentration 56', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_57 = models.FloatField(db_column='Bin Concentration 57', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_58 = models.FloatField(db_column='Bin Concentration 58', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_59 = models.FloatField(db_column='Bin Concentration 59', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    bin_conc_60 = models.FloatField(db_column='Bin Concentration 60', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

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

class uv_lif(models.Model): #WIBS NEO
    datetime = models.DateTimeField(db_column='Datetime', primary_key=True)  # Field name made lowercase.
    number_408_board_temperature = models.FloatField(db_column='408 Board Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it wasn't a valid Python identifier.
    bandwidths_0 = models.FloatField(db_column='Bandwidths 0', blank=True, null=True)
    bandwidths_1 = models.FloatField(db_column='Bandwidths 1', blank=True, null=True)
    bandwidths_2 = models.FloatField(db_column='Bandwidths 2', blank=True, null=True)
    bandwidths_3 = models.FloatField(db_column='Bandwidths 3', blank=True, null=True)
    baseline_0 = models.FloatField(db_column='Baseline 0', blank=True, null=True)
    baseline_1 = models.FloatField(db_column='Baseline 1', blank=True, null=True)
    baseline_2 = models.FloatField(db_column='Baseline 2', blank=True, null=True)
    baseline_3 = models.FloatField(db_column='Baseline 3', blank=True, null=True)
    clump_count = models.FloatField(blank=True, null=True)
    exited_particles_count_cm3_field = models.FloatField(db_column='Exited Particles Count', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    total_particle_count_all_cm3_field = models.FloatField(db_column='Total Particle Count', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    h12310_temperature = models.FloatField(blank=True, null=True)
    max_transit_time_counts = models.FloatField(blank=True, null=True)
    min_transit_time_counts = models.FloatField(blank=True, null=True)
    missed_particle_count = models.FloatField(blank=True, null=True)
    num_discarted_particles = models.FloatField(blank=True, null=True)
    num_oversize_rejects = models.FloatField(blank=True, null=True)
    relative_humidity = models.FloatField(db_column='Relative Humidity', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    system_power = models.FloatField(db_column='System Power', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_mass_flow_rate_l_min_field = models.FloatField(db_column='Sample Mass Flow Rate', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it endedwith '_'.
    sample_pressure = models.FloatField(db_column='Sample Pressure', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_flow_rate_set_point = models.FloatField(db_column='Sample Flow Rate Set Point', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_temperature = models.FloatField(db_column='Sample Temperature', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sample_flow_rate = models.FloatField(db_column='Sample Flow Rate', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    sheath_sample_mass_flow_l_min_field = models.FloatField(db_column='Sheath Sample Mass Flow', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
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
    size_of_particle_um_field = models.FloatField(db_column='Size of Particle', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
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

class Router:
    """
    A router to control all database operations on models in the
    user application.
    """
    def db_for_read(self, model, **hints):
        """
        Attempts to read user models go to users_db.
        """
        if model._meta.app_label == "sensors":
            return 'sensor_db'
        return None

    def db_for_write(self, model, **hints):
        """
        Attempts to write user models go to users_db.
        """
        if model._meta.app_label == "sensors":
            return 'sensor_db'
        return None

    def allow_relation(self, obj1, obj2, **hints):
        """
        Allow relations if a model in the user app is involved.
        """
        db = ['default', 'sensor_db']
        if obj1._meta.app_label in db and obj2._meta.app_label in db:
           return True
        return None

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        """
        Make sure the auth app only appears in the 'users_db'
        database.
        """
        if app_label == 'sensors':
            return db == 'sensor_db'
        return None

