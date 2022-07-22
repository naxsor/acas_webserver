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
        self.flag = True
        self.parameter = 'Water Vapor Content'
        self.sensor = 'Tunable Diode Laser Hygrometer'
        self.datatable = 'sensor_hygrometer'
        self.df = None
        self.slider = None
        self.unit = None
        self.x = deque(maxlen=3600)
        self.y = deque(maxlen=3600)

    def get_y(self):
        return self.y

    def set_y(self, y):
        self.y = y

    def get_x(self):
        return self.x

    def set_x(self, x):
        self.x = x

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

with open('/etc/config.json') as config_file:
# with open("C:/Users/ACAS/Documents/config.json") as config_file:
    config = json.load(config_file)

conn = psycopg2.connect(dbname=config.get('db_sensor_name'), user=config.get('db_sensor_username'),
                        password=config.get('db_sensor_password'), host=config.get('db_ip_failover'),
                        port=config.get('db_sensor_port'))
# cursor = conn.cursor()
hygrometer = variables()
sp2 = variables()
sp2.set_parameter('Incandescence Particle Concentration')
sp2.set_sensor('Single Particle Soot Photometer – Extended Range')
sp2.set_datatable('sensor_liis')

hygrometer_2 = variables()

plots = [['0', hygrometer, '5'], ['1', sp2, '36'], ['2', hygrometer_2, '3']]

app.layout = dbc.Container(
    children=[
        html.Div(
            children=[
                html.Div(
                    className='four columns',
                    id='parent',
                    children=[
                        dcc.Graph(id='live-graph'),
                        dcc.Interval(
                            id='graph-update',
                            interval=1000,
                            n_intervals=0,
                        ),
                        dcc.Store(id='memory', data='0'),
                    ],
                ),
                html.Div(
                    className='four columns',
                    id='parent-1',
                    children=[
                        dcc.Graph(id='live-graph-1'),
                        dcc.Interval(
                            id='graph-update-1',
                            interval=1000,
                            n_intervals=0,
                        ),
                        dcc.Store(id='memory-1', data='1'),
                    ],
                ),
                html.Div(
                    className='four columns',
                    id='parent-2',
                    children=[
                        dcc.Graph(id='live-graph-2'),
                        dcc.Interval(
                            id='graph-update-2',
                            interval=1000,
                            n_intervals=0,
                        ),
                        dcc.Store(id='memory-2', data='2'),
                    ],
                )
            ]
        )
    ],
    fluid=True,
    style={"height": '100%'},
)

@app.callback(
    [Output('live-graph', 'figure'), Output('live-graph', 'config')],
    [Input('graph-update', 'n_intervals'), Input('memory', 'data')]
)
def parameter_callback(n, data):
    date = datetime.now() - timedelta(hours=1)
    aph = "'"
    date = aph + date.__str__() + aph
    avg = "Minute"
    cursor = conn.cursor()
    for i in plots:
        if data == i[0]:
            variable = i[1]
            id = i[2]

    # try:
    if variable.get_flag() == True:
        variable.get_x().clear()
        variable.get_y().clear()
        sql = 'SELECT primary_variables."id" "id", "data table", "Variable Name" FROM public.primary_variables JOIN public.sensor s on primary_variables."Sensor id" = s.id WHERE primary_variables."id" = ' + id

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
            variable.get_x().append(i[0])
            variable.get_y().append(i[1])

        df = pandas.DataFrame()
        df['Datetime'] = pandas.DatetimeIndex(variable.get_x())
        # df['Datetime'] = pd.to_datetime(df['Datetime'])
        df[variable.get_parameter()] = pandas.Series(variable.get_y())
        df = dataframe_avarager(df, avg)
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
                                        title=variable.get_sensor(), transition={'duration': 500, 'easing': 'cubic-in-out'}, hovermode='x')}
    elif variable.get_flag() == False:

        latest_date = variable.get_x()[-1].__str__()
        delta = max(variable.get_x()) - timedelta(hours=1)
        aph = "'"
        latest_date = aph + latest_date + aph

        sql = 'SELECT "Datetime","' + variable.get_parameter() + '" FROM "' + variable.get_datatable() + '" WHERE "Datetime" > ' + latest_date + ' AND "' + variable.get_parameter() + '" IS NOT NULL ORDER BY "Datetime" ASC'
        cursor.execute(sql)
        data = cursor.fetchall()

        for i in data:
            variable.get_x().append(i[0])
            variable.get_y().append(i[1])

        df_1 = pandas.DataFrame()
        df_1['Datetime'] = pandas.DatetimeIndex(variable.get_x())
        # df_1['Datetime'] = pd.to_datetime(df_1['Datetime'])
        df_1[variable.get_parameter()] = pandas.Series(variable.get_y())
        df = variable.get_df()
        df = pandas.concat([df, df_1])
        df = dataframe_avarager(df, avg)
        df = df.loc[df['Datetime'] > delta]
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

        config = {'staticPlot': True}

        return {'data': [data],
                'layout': go.Layout(autosize=True, xaxis=dict(range=[min_x, max_x], title='Datetime'),
                                    yaxis=dict(range=[min_y, max_y], title=variable.get_parameter()),
                                    title=variable.get_sensor(), hovermode='x', margin=go.layout.Margin(l=80, r=20, b=50, t=30))}, config
    cursor.close()
    # except (IndexError, psycopg2.ProgrammingError, psycopg2.errors.InFailedSqlTransaction) as e:
    #     variable.set_flag(True)

@app.callback(
    [Output('live-graph-1', 'figure'), Output('live-graph-1', 'config')],
    [Input('graph-update-1', 'n_intervals'), Input('memory-1', 'data')]
)
def parameter_callback_1(n, data):
    date = datetime.now() - timedelta(hours=1)
    aph = "'"
    date = aph + date.__str__() + aph
    avg = "Minute"
    cursor = conn.cursor()
    for i in plots:
        if data == i[0]:
            variable = i[1]
            id = i[2]
            break

    # try:
    if variable.get_flag() == True:
        variable.get_x().clear()
        variable.get_y().clear()
        sql = 'SELECT primary_variables."id" "id", "data table", "Variable Name" FROM public.primary_variables JOIN public.sensor s on primary_variables."Sensor id" = s.id WHERE primary_variables."id" = ' + id

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
            variable.get_x().append(i[0])
            variable.get_y().append(i[1])

        df = pandas.DataFrame()
        df['Datetime'] = pandas.DatetimeIndex(variable.get_x())
        # df['Datetime'] = pd.to_datetime(df['Datetime'])
        df[variable.get_parameter()] = pandas.Series(variable.get_y())
        df = dataframe_avarager(df, avg)
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
                                        title=variable.get_sensor(),  transition={'duration': 500, 'easing': 'cubic-in-out'})}
    elif variable.get_flag() == False:

        latest_date = variable.get_x()[-1].__str__()
        delta = max(variable.get_x()) - timedelta(hours=1)
        aph = "'"
        latest_date = aph + latest_date + aph

        sql = 'SELECT "Datetime","' + variable.get_parameter() + '" FROM "' + variable.get_datatable() + '" WHERE "Datetime" > ' + latest_date + ' AND "' + variable.get_parameter() + '" IS NOT NULL ORDER BY "Datetime" ASC'
        cursor.execute(sql)
        data = cursor.fetchall()

        for i in data:
            variable.get_x().append(i[0])
            variable.get_y().append(i[1])

        df_1 = pandas.DataFrame()
        df_1['Datetime'] = pandas.DatetimeIndex(variable.get_x())
        # df_1['Datetime'] = pd.to_datetime(df_1['Datetime'])
        df_1[variable.get_parameter()] = pandas.Series(variable.get_y())
        df = variable.get_df()
        df = pandas.concat([df, df_1])
        df = df.loc[df['Datetime'] > delta]
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

        config = {'staticPlot': True}

        return {'data': [data],
                'layout': go.Layout(autosize=True, xaxis=dict(range=[min_x, max_x], title='Datetime'),
                                    yaxis=dict(range=[min_y, max_y], title=variable.get_parameter()),
                                    title=variable.get_sensor(), hovermode='x', margin=go.layout.Margin(l=80, r=20, b=50, t=30))}, config
    # except (IndexError, psycopg2.ProgrammingError, psycopg2.errors.InFailedSqlTransaction) as e:
    #     variable.set_flag(True)
    cursor.close()

@app.callback(
    [Output('live-graph-2', 'figure'), Output('live-graph-2', 'config')],
    [Input('graph-update-2', 'n_intervals'), Input('memory-2', 'data')]
)
def parameter_callback_2(n, data):
    date = datetime.now() - timedelta(hours=1)
    aph = "'"
    date = aph + date.__str__() + aph
    avg = "Minute"
    cursor = conn.cursor()
    for i in plots:
        if data == i[0]:
            variable = i[1]
            id = i[2]

    # try:
    if variable.get_flag() == True:
        variable.get_x().clear()
        variable.get_y().clear()
        sql = 'SELECT primary_variables."id" "id", "data table", "Variable Name" FROM public.primary_variables JOIN public.sensor s on primary_variables."Sensor id" = s.id WHERE primary_variables."id" = ' + id

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
            variable.get_x().append(i[0])
            variable.get_y().append(i[1])

        df = pandas.DataFrame()
        df['Datetime'] = pandas.DatetimeIndex(variable.get_x())
        # df['Datetime'] = pd.to_datetime(df['Datetime'])
        df[variable.get_parameter()] = pandas.Series(variable.get_y())
        df = dataframe_avarager(df, avg)
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
                                        title=variable.get_sensor(), transition={'duration': 500, 'easing': 'cubic-in-out'})}
    elif variable.get_flag() == False:

        latest_date = variable.get_x()[-1].__str__()
        delta = max(variable.get_x()) - timedelta(hours=1)
        aph = "'"
        latest_date = aph + latest_date + aph

        sql = 'SELECT "Datetime","' + variable.get_parameter() + '" FROM "' + variable.get_datatable() + '" WHERE "Datetime" > ' + latest_date + ' AND "' + variable.get_parameter() + '" IS NOT NULL ORDER BY "Datetime" ASC'
        cursor.execute(sql)
        data = cursor.fetchall()

        for i in data:
            variable.get_x().append(i[0])
            variable.get_y().append(i[1])

        df_1 = pandas.DataFrame()
        df_1['Datetime'] = pandas.DatetimeIndex(variable.get_x())
        # df_1['Datetime'] = pd.to_datetime(df_1['Datetime'])
        df_1[variable.get_parameter()] = pandas.Series(variable.get_y())
        df = variable.get_df()
        df = pandas.concat([df, df_1])
        df = df.loc[df['Datetime'] > delta]
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

        config = {'staticPlot': True}

        return {'data': [data],
                'layout': go.Layout(autosize=True, xaxis=dict(range=[min_x, max_x], title='Datetime'),
                                    yaxis=dict(range=[min_y, max_y], title=variable.get_parameter()),
                                    title=variable.get_sensor(), hovermode='x', margin=go.layout.Margin(l=80, r=20, b=50, t=30))}, config
    # except (KeyError, psycopg2.ProgrammingError, psycopg2.errors.InFailedSqlTransaction) as e:
    #     variable.set_flag(True)
    cursor.close()
