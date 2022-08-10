import dash
import pandas
from dash.dependencies import Output, Input
from dash import html
from dash import dcc
import dash_bootstrap_components as dbc
import plotly
import plotly.graph_objs as go
from collections import deque
from django_plotly_dash import DjangoDash
import psycopg2
import json
import time
import pandas as pd
from datetime import datetime, timedelta

def dataframe_avarager(df, avg):
    if type(df.index) == pd.TimedeltaIndex or pd.DatetimeIndex or pd.PeriodIndex:
        if avg == 'Raw':
            df = df
        elif avg == 'Second':
            df = df.resample('S', on='Datetime').mean()
        elif avg == 'Minute':
            df = df.resample('T', on='Datetime').mean()
        elif avg == 'Hour':
            df = df.resample('H', on='Datetime').mean()
        elif avg == 'Day':
            df = df.resample('D', on='Datetime').mean()
        elif avg == 'Week':
            df = df.resample('W', on='Datetime').mean()
        elif avg == 'Month':
            df = df.resample('M', on='Datetime').mean()
        df = df.dropna(axis=0, how='all')
        df['Datetime'] = df.index
        df = df.reset_index(drop=True)
        return df
    else:
        raise IndexError

def unixTimeMillis(dt):
    ''' Convert datetime to unix timestamp '''
    return int(time.mktime(dt.timetuple()))

def unixToDatetime(unix):
    ''' Convert unix timestamp to datetime. '''
    return pd.to_datetime(unix,unit='s')

def getMarks(start, end, range, Nth=1500):
    ''' Returns the marks for labeling.
        Every Nth value will be used.
    '''
    Nth = len(range) / 7
    Nth = round(Nth)
    result = {}
    x = range.max() - range.min()
    for i, date in enumerate(range):
        if(i%Nth == 1):
            # Append value to dict
            if (range.max() - range.min()) > timedelta(days=365):
                result[unixTimeMillis(date)] = str(date.strftime('%Y-%m-%d %H:%M:%S'))
            elif (range.max() - range.min()) > timedelta(days=31):
                result[unixTimeMillis(date)] = str(date.strftime('%m-%d %H:%M:%S'))
            elif (range.max() - range.min()) > timedelta(hours=13):
                result[unixTimeMillis(date)] = str(date.strftime('%d %H:%M:%S'))
            elif (range.max() - range.min()) < timedelta(hours=12):
                result[unixTimeMillis(date)] = str(date.strftime('%H:%M:%S'))

    return result

class variables:
    def __init__(self):
        self.datatable = None
        self.val = 3
        self.sid = 2
        self.flag = False
        self.parameter = 'Water Vapor Content'
        self.sensor = 'Tunable Diode Laser Hygrometer'
        self.datatable = 'sensor_hygrometer'
        self.df = None
        self.slider = None
        self.unit = None

    def get_sid(self):
        return self.sid

    def set_sid(self, sid):
        self.sid = sid

    def get_unit(self):
        return self.unit

    def set_unit(self, unit):
        self.unit = unit

    def get_slider(self):
        return self.slider

    def set_slider(self, slider):
        self.slider = slider

    def get_df(self):
        return self.df

    def set_df(self, df):
        self.df = df

    def get_sensor(self):
        return self.sensor

    def set_sensor(self, sensor):
        self.sensor = sensor

    def get_datatable(self):
        return self.datatable

    def set_datatable(self, datatable):
        self.datatable = datatable

    def get_flag(self):
        return self.flag

    def set_flag(self, flag):
        self.flag = flag

    def get_parameter(self):
        return self.parameter

    def set_parameter(self, parameter):
        self.parameter = parameter

    def get_value(self):
        return self.val

    def set_value(self, value):
        self.val = value

app = DjangoDash('SimpleExample', external_stylesheets=[dbc.themes.BOOTSTRAP, 'https://acas.uprrp.edu/static/blog/plot.css', 'https://codepen.io/chriddyp/pen/bWLwgP.css'])

with open('/etc/config.json') as config_file:
# with open("C:/Users/ACAS/Documents/config.json") as config_file:
        config = json.load(config_file)

conn = psycopg2.connect(dbname=config.get('db_sensor_name'), user=config.get('db_sensor_username'), password=config.get('db_sensor_password'), host=config.get('db_ip_failover'), port=config.get('db_sensor_port'))
cursor = conn.cursor()
sql = 'SELECT sensor.id, sensor.name FROM public.sensor JOIN process p on sensor.id = p."Sensor id" WHERE p."status" = ' + "'RECORDING'"
cursor.execute(sql)
sensors = cursor.fetchall()

sensor_list = []
for i in sensors:
    sensor_list.append({'label': i[1], 'value': i[0]})

a = datetime.now() - timedelta(days=1)
x = a.__str__()
y = "'"
x = y + x + y

sql = 'SELECT sensor.name, "data table", "Variable Name", sensor.id FROM sensor JOIN process p on sensor.id = p."Sensor id" join primary_variables pv on sensor.id = pv."Sensor id"WHERE status = ' + "'RECORDING'" + ' LIMIT 1'

cursor.execute(sql)
data = cursor.fetchall()

variable = variables()
variable.set_sensor(data[0][0])
variable.set_datatable(data[0][1])
variable.set_parameter(data[0][2])
variable.set_sid(data[0][3])

# sql_1 = 'SELECT * FROM public.sensor_hygrometer WHERE "Datetime" > ' + x +  ' ORDER BY "Datetime" ASC'
#
# cursor.execute(sql_1)
# data = cursor.fetchall()

sql = 'SELECT MIN("Datetime"), MAX("Datetime") FROM ' + variable.get_datatable()
cursor.execute(sql)
dates = cursor.fetchall()

range = pandas.date_range(dates[0][0], dates[0][1], freq='T')

variable.set_flag(True)
variable.set_slider([unixTimeMillis(a), unixTimeMillis(range.max())])

X = deque()
Y = deque()

for i in data:
    X.append(i[0])
    Y.append(i[1])

app.layout = dbc.Container(
    children=[
        html.Div(
            id='parent',
            children=[
                html.H5(id='H5', children='Sensor:'),
                dcc.Dropdown(id='dropdown',
                             options=sensor_list,
                             value=variable.get_sid(),
                             clearable=False,
                        ),
                html.Br(),
                html.H5(id='H5-2', children='Parameter:'),
                dcc.Dropdown(id='dropdown_2',
                             options=[],
                             value=0,
                             clearable=False,
                        ),
                html.Br(),
                dcc.Loading(id='loading',
                            children=[
                                dcc.Graph(id='live-graph'),
                                dcc.RangeSlider(
                                    id='year_slider',
                                    min=unixTimeMillis(range.min()),
                                    max=unixTimeMillis(range.max()),
                                    value=[unixTimeMillis(a),
                                           unixTimeMillis(range.max())],
                                    marks=getMarks(range.min(),
                                                   range.max(), range)
                                    # tooltip={"placement": "top", "always_visible": True},

                                )

                            ],
                            type="circle"),
                # dcc.Interval(
                #     id='graph-update',
                #     interval=1000,
                #     n_intervals=0,
                #     disabled=False,
                # ),

                # dcc.Slider(
                #     id='year_slider',
                #     min=unixTimeMillis(range.min()),
                #     max=unixTimeMillis(range.max()),
                #     value=unixTimeMillis(a),
                #     marks=getMarks(range.min(),
                #                    range.max(), range),
                #     # tooltip={"placement": "top", "always_visible": True},
                #     drag_value=True,
                #     updatemode='drag'
                #
                # ),
                html.Br(),
                # html.Button(children='Start', id='button', className='btn btn-outline-info', n_clicks=1),

            ],
        )
    ],
    fluid=True,
    style={"height":'100%'},
)

# @app.callback(
#     Output('live-graph', 'figure'),
#     [Input('graph-update', 'n_intervals')]
# )
# def update_graph_scatter(n):
#     x = X[-1].__str__()
#     y = "'"
#     x = y + x + y
#     sql_1 = 'SELECT * FROM public.sensor_hygrometer WHERE "Datetime" > ' + x +  ' ORDER BY "Datetime" ASC'
#     cursor.execute(sql_1)
#     data = cursor.fetchall()
#
#     for i in data:
#         X.append(i[0])
#         Y.append(i[1])
#
#     data = plotly.graph_objs.Scatter(
#         x=list(X),
#         y=list(Y),
#         name='Scatter',
#         mode='lines+markers'
#     )
#
#     mi = min(X)
#     sec = max(X) - min(X)
#     mi = mi - timedelta(seconds=sec.total_seconds() * 0.03)
#
#     ma = max(X)
#     ma = ma + timedelta(seconds=sec.total_seconds() * 0.03)
#
#     return {'data': [data],
#             'layout' : go.Layout(autosize=True, xaxis=dict(range=[mi,ma]),yaxis = dict(range = [min(Y)-min(Y)*0.01,max(Y)+max(Y)*0.01]),)}

# @app.callback([Output('graph-update','disabled'), Output('button','children')],
#               [Input('button', 'n_clicks')])
# def update_callback(n_clicks):
#     if (n_clicks % 2) == 0:
#         return True, 'Start'
#     else:
#         return False, 'Stop'

# @app.callback(Output('year_slider','marks'),
#               Input('year_slider','value'))
# def slider(value):
#     dates[0] = unixToDatetime(value[0])
#     dates[1] = unixToDatetime(value[1])
#     range = pandas.date_range(dates[0][0], dates[0][1], freq='T')
#
#     marks = getMarks(range.min(), range.max(), range)
#
#     return marks

@app.callback(Output("live-graph", "children"), Input("live-graph", "figure"))
def input_triggers_spinner(value):
    return value

@app.callback([Output('dropdown_2','options'), Output('dropdown_2','value'), Output('year_slider','min'), Output('year_slider','max'), Output('year_slider','value'), Output('year_slider','marks'),],
              [Input('dropdown', 'value')])
def sensor_callback(input_value):
    sql = 'SELECT "name", "data table" From public.sensor WHERE id =' + str(input_value)
    cursor = conn.cursor()
    cursor.execute(sql)
    sensors = cursor.fetchall()
    variable.set_sensor(sensors[0][0])
    variable.set_datatable(sensors[0][1])

    sql = 'SELECT MIN("Datetime"), MAX("Datetime") FROM ' + variable.get_datatable()
    cursor.execute(sql)
    dates = cursor.fetchall()

    range = pandas.date_range(dates[0][0], dates[0][1], freq='T')
    delta = range.max() - range.min()
    delta = delta.days / 15
    a = datetime.now() - timedelta(days=delta)

    sql = 'SELECT * FROM public.primary_variables WHERE "Sensor id" = ' + str(input_value) + ' AND "Available" = TRUE'
    cursor.execute(sql)
    sensors = cursor.fetchall()

    parameter_list = []
    for i in sensors:
        parameter_list.append({'label': i[1], 'value': i[0]})
    variable.set_value(sensors[-1][0])
    variable.set_flag(True)
    variable.set_slider(unixTimeMillis(a))
    cursor.close()
    return parameter_list, variable.get_value(), unixTimeMillis(range.min()), unixTimeMillis(range.max()), [unixTimeMillis(a), unixTimeMillis(range.max())], getMarks(range.min(),range.max(), range)

@app.callback(Output('live-graph','figure'),
              [Input('dropdown_2', 'value'), Input('year_slider','value')])
def parameter_callback(input_value, value):
    cursor = conn.cursor()
    dates = [0,1]
    dates[0] = unixToDatetime(value[0])
    dates[1] = unixToDatetime(value[1])

    delta = dates[1] - dates[0]

    aph = "'"
    dates[0] = aph + dates[0].__str__() + aph
    dates[1] = aph + dates[1].__str__() + aph

    if variable.get_slider() != value:
        variable.set_flag(True)
    variable.set_slider(value)

    avg = 'Second'
    if timedelta(days=20) < delta:
        avg = 'Day'
    elif timedelta(weeks=1) < delta:
        avg = 'Hour'
    elif timedelta(hours=12) < delta:
        avg = 'Minute'



    variable.set_value(input_value)
    X.clear()
    Y.clear()
    sql = 'SELECT primary_variables."id" "id", "data table", "Variable Name", primary_variables."Parameter Unit" FROM public.primary_variables JOIN public.sensor s on primary_variables."Sensor id" = s.id WHERE primary_variables."id" = ' + str(
        input_value)

    cursor.execute(sql)
    data = cursor.fetchall()

    variable.set_parameter(data[0][2])
    variable.set_datatable(data[0][1])
    variable.set_unit(data[0][3])
    variable.set_flag(False)

    sql = 'SELECT "Datetime","' + variable.get_parameter() + '" FROM "' + variable.get_datatable() + '" WHERE "Datetime" > ' + dates[
        0] + ' AND "Datetime" < ' + dates[
              1] + ' AND "' + variable.get_parameter() + '" IS NOT NULL ORDER BY "Datetime" DESC'

    cursor.execute(sql)
    data = cursor.fetchall()
    data.reverse()

    for i in data:
        X.append(i[0])
        Y.append(i[1])

    df = pandas.DataFrame()
    df['Datetime'] = pandas.DatetimeIndex(X)
    # df['Datetime'] = pd.to_datetime(df['Datetime'])
    df[variable.get_parameter()] = pandas.Series(Y)

    df = dataframe_avarager(df, avg)
    variable.set_df(df)

    data = plotly.graph_objs.Scatter(
        x=list(df['Datetime']),
        y=list(df[variable.get_parameter()]),
        name='Scatter',
        mode='lines+markers'
    )

    min_x = min(df['Datetime'])
    sec = max(df['Datetime']) - min(df['Datetime'])
    min_x = min_x - timedelta(seconds=sec.total_seconds() * 0.03)
    max_x = max(df['Datetime'])
    max_x = max_x + timedelta(seconds=sec.total_seconds() * 0.03)

    min_y = min(df[variable.get_parameter()]) - min(df[variable.get_parameter()]) * 0.03
    max_y = max(df[variable.get_parameter()]) + max(df[variable.get_parameter()]) * 0.03
    cursor.close()
    return {'data': [data],
            'layout': go.Layout(autosize=True, xaxis=dict(range=[min_x, max_x], title='Datetime'),
                                yaxis=dict(range=[min_y, max_y],
                                           title=go.layout.yaxis.Title(text=variable.get_parameter() + ' (' + variable.get_unit() + ')')),
                                title=variable.get_sensor(),
                                transition={'duration': 500, 'easing': 'cubic-in-out'}, hovermode='x', margin=go.layout.Margin(l=60, r=0, b=80, t=25))}
    # try:
    #     if variable.get_flag() == True or variable.get_value() != input_value and input_value != None:
    #         variable.set_value(input_value)
    #         X.clear()
    #         Y.clear()
    #         sql = 'SELECT primary_variables."id" "id", "data table", "Variable Name" FROM public.primary_variables JOIN public.sensor s on primary_variables."Sensor id" = s.id WHERE primary_variables."id" = ' + str(input_value)
    #
    #         cursor.execute(sql)
    #         data = cursor.fetchall()
    #
    #         datatable = data[0][1]
    #         parameter = data[0][2]
    #
    #         variable.set_parameter(parameter)
    #         variable.set_datatable(datatable)
    #         variable.set_flag(False)
    #
    #         sql = 'SELECT "Datetime","' + variable.get_parameter() + '" FROM "' + datatable + '" WHERE "Datetime" > ' + dates[0] + ' AND "Datetime" < ' + dates[1] + ' AND "' + variable.get_parameter() + '" IS NOT NULL ORDER BY "Datetime" DESC'
    #
    #         cursor.execute(sql)
    #         data = cursor.fetchall()
    #         data.reverse()
    #
    #         for i in data:
    #             X.append(i[0])
    #             Y.append(i[1])
    #
    #         df = pandas.DataFrame()
    #         df['Datetime'] = pandas.DatetimeIndex(X)
    #         # df['Datetime'] = pd.to_datetime(df['Datetime'])
    #         df[variable.get_parameter()] = pandas.Series(Y)
    #
    #         df = dataframe_avarager(df, avg)
    #         variable.set_df(df)
    #
    #         data = plotly.graph_objs.Scatter(
    #             x=list(df['Datetime']),
    #             y=list(df[variable.get_parameter()]),
    #             name='Scatter',
    #             mode='lines+markers'
    #         )
    #
    #         if len(df['Datetime']) != 0:
    #             min_x = min(df['Datetime'])
    #             sec = max(df['Datetime']) - min(df['Datetime'])
    #             min_x = min_x - timedelta(seconds=sec.total_seconds() * 0.03)
    #             max_x = max(df['Datetime'])
    #             max_x = max_x + timedelta(seconds=sec.total_seconds() * 0.03)
    #
    #             min_y = min(df[variable.get_parameter()]) - min(df[variable.get_parameter()]) * 0.03
    #             max_y = max(df[variable.get_parameter()]) + max(df[variable.get_parameter()]) * 0.03
    #
    #             return {'data': [data],
    #                     'layout': go.Layout(autosize=True, xaxis=dict(range=[min_x, max_x], title='Datetime'),
    #                                         yaxis=dict(range=[min_y, max_y], title=go.layout.yaxis.Title(text=variable.get_parameter())),
    #                                         title=variable.get_sensor(), transition={'duration': 500, 'easing':'cubic-in-out'})}
    #     elif variable.get_flag() == False:
    #
    #         latest_date = X[-1].__str__()
    #         aph = "'"
    #         latest_date = aph + latest_date + aph
    #
    #         sql = 'SELECT "Datetime","' + variable.get_parameter() + '" FROM "' + variable.get_datatable() + '" WHERE "Datetime" > ' + latest_date + ' AND "' + variable.get_parameter() + '" IS NOT NULL ORDER BY "Datetime" ASC'
    #         cursor.execute(sql)
    #         data = cursor.fetchall()
    #
    #         for i in data:
    #             X.append(i[0])
    #             Y.append(i[1])
    #
    #         df_1 = pandas.DataFrame()
    #         df_1['Datetime'] = pandas.DatetimeIndex(X)
    #         # df_1['Datetime'] = pd.to_datetime(df_1['Datetime'])
    #         df_1[variable.get_parameter()] = pandas.Series(Y)
    #         df = variable.get_df()
    #         df = pandas.concat([df, df_1])
    #         df = dataframe_avarager(df, avg)
    #         variable.set_df(df)
    #
    #         data = plotly.graph_objs.Scatter(
    #             x=list(df['Datetime']),
    #             y=list(df[variable.get_parameter()]),
    #             name='Scatter',
    #             mode='lines+markers'
    #         )
    #
    #         min_x = min(df['Datetime'])
    #         sec = max(df['Datetime']) - min(df['Datetime'])
    #         min_x = min_x - timedelta(seconds=sec.total_seconds() * 0.03)
    #
    #         max_x = max(df['Datetime'])
    #         max_x = max_x + timedelta(seconds=sec.total_seconds() * 0.03)
    #
    #         min_y = min(df[variable.get_parameter()]) - min(df[variable.get_parameter()]) * 0.03
    #         max_y = max(df[variable.get_parameter()]) + max(df[variable.get_parameter()]) * 0.03
    #
    #         return {'data': [data],
    #                 'layout': go.Layout(autosize=True, xaxis=dict(range=[min_x, max_x], title='Datetime'),
    #                                     yaxis=dict(range=[min_y, max_y], title=variable.get_parameter()),
    #                                     title=variable.get_sensor())}
    # except (KeyError, psycopg2.ProgrammingError) as e:
    #     print(e)
    #     variable.set_flag(True)