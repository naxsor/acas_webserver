import dash
import pandas
from dash.dependencies import Output, Input
from dash import html
from dash import dcc
import dash_bootstrap_components as dbc
import plotly
import numpy as np
import random
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
            df = df.resample('D').mean()
        elif avg == 'Week':
            df = df.resample('W').mean()
        elif avg == 'Month':
            df = df.resample('M').mean()
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

class variables:
    def __init__(self):
        self.datatable = None
        self.val = 3
        self.flag = False
        self.parameter = 'Water Vapor Content'
        self.sensor = 'Tunable Diode Laser Hygrometer'
        self.datatable = 'sensor_hygrometer'
        self.df = None
        self.slider = None
        self.unit = None

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


app = DjangoDash('Homeplot1', external_stylesheets=[dbc.themes.BOOTSTRAP, 'https://acas.uprrp.edu/static/blog/plot.css', 'https://codepen.io/chriddyp/pen/bWLwgP.css'])

# with open('/etc/config.json') as config_file:
# with open("C:/Users/ACAS/Documents/config.json") as config_file:
with open('/etc/config.json') as config_file:
    config = json.load(config_file)

conn = psycopg2.connect(dbname=config.get('db_sensor_name'), user=config.get('db_sensor_username'),
                        password=config.get('db_sensor_password'), host=config.get('db_ip_failover'),
                        port=config.get('db_sensor_port'))
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
sql_1 = 'SELECT * FROM public.sensor_hygrometer WHERE "Datetime" > ' + x + ' ORDER BY "Datetime" ASC'

cursor.execute(sql_1)
data = cursor.fetchall()
variable = variables()

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
                dcc.Graph(id='live-graph'),
                dcc.Interval(
                    id='graph-update',
                    interval=1000,
                    n_intervals=0,
                ),
            ],
        )
    ],
    fluid=True,
    style={"height": '100%'},
)

@app.callback(
    Output('live-graph', 'figure'),
    [Input('graph-update', 'n_intervals')]
)
def parameter_callback(n):
    date = datetime.now() - timedelta(hours=1)
    aph = "'"
    date = aph + date.__str__() + aph

    try:
        if variable.get_flag() == True:
            X.clear()
            Y.clear()
            sql = 'SELECT primary_variables."id" "id", "data table", "Variable Name" FROM public.primary_variables JOIN public.sensor s on primary_variables."Sensor id" = s.id WHERE primary_variables."id" = ' + str(3)

            cursor.execute(sql)
            data = cursor.fetchall()

            variable.set_parameter(data[0][2])
            variable.set_datatable(data[0][1])
            variable.set_flag(False)

            sql = 'SELECT "Datetime","' + variable.get_parameter() + '" FROM "' + variable.get_datatable() + '" WHERE "Datetime" > ' + date + ' AND "' + variable.get_parameter() + '" IS NOT NULL ORDER BY "Datetime" DESC'

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
            variable.set_df(df)

            data = plotly.graph_objs.Scatter(
                x=list(df['Datetime']),
                y=list(df[variable.get_parameter()]),
                name='Scatter',
                mode='lines+markers'
            )

            if len(df['Datetime']) != 0:
                min_x = min(df['Datetime'])
                sec = max(df['Datetime']) - min(df['Datetime'])
                min_x = min_x - timedelta(seconds=sec.total_seconds() * 0.03)
                max_x = max(df['Datetime'])
                max_x = max_x + timedelta(seconds=sec.total_seconds() * 0.03)

                min_y = min(df[variable.get_parameter()]) - min(df[variable.get_parameter()]) * 0.03
                max_y = max(df[variable.get_parameter()]) + max(df[variable.get_parameter()]) * 0.03

                return {'data': [data],
                        'layout': go.Layout(autosize=True, xaxis=dict(range=[min_x, max_x], title='Datetime'),
                                            yaxis=dict(range=[min_y, max_y], title=go.layout.yaxis.Title(text=variable.get_parameter())),
                                            title=variable.get_sensor(), transition={'duration': 500, 'easing':'cubic-in-out'})}
        elif variable.get_flag() == False:

            latest_date = X[-1].__str__()
            aph = "'"
            latest_date = aph + latest_date + aph

            sql = 'SELECT "Datetime","' + variable.get_parameter() + '" FROM "' + variable.get_datatable() + '" WHERE "Datetime" > ' + latest_date + ' AND "' + variable.get_parameter() + '" IS NOT NULL ORDER BY "Datetime" ASC'
            cursor.execute(sql)
            data = cursor.fetchall()

            for i in data:
                X.append(i[0])
                Y.append(i[1])

            df_1 = pandas.DataFrame()
            df_1['Datetime'] = pandas.DatetimeIndex(X)
            # df_1['Datetime'] = pd.to_datetime(df_1['Datetime'])
            df_1[variable.get_parameter()] = pandas.Series(Y)
            df = variable.get_df()
            df = pandas.concat([df, df_1])
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

            return {'data': [data],
                    'layout': go.Layout(autosize=True, xaxis=dict(range=[min_x, max_x], title='Datetime'),
                                        yaxis=dict(range=[min_y, max_y], title=variable.get_parameter()),
                                        title=variable.get_sensor())}
    except (KeyError, psycopg2.ProgrammingError) as e:
        print(e)
        variable.set_flag(True)


