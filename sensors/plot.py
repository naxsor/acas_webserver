import dash
from dash.dependencies import Output, Input
from dash import html
from dash import dcc
import dash_bootstrap_components as dbc
import plotly
import random
import plotly.graph_objs as go
from collections import deque
from django_plotly_dash import DjangoDash
import psycopg2
import json
from datetime import datetime, timedelta

class variables:
    def __init__(self):
        self.datatable = None
        self.val = 3
        self.flag = False
        self.parameter = '"Water Vapor Content"'

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

app = DjangoDash('SimpleExample', external_stylesheets=[dbc.themes.BOOTSTRAP])

with open('/etc/config.json') as config_file:
	config = json.load(config_file)

conn = psycopg2.connect(dbname=config.get('db_sensor_name'), user=config.get('db_sensor_username'), password=config.get('db_sensor_password'), host=config.get('db_ip_failover'), port=config.get('db_sensor_port'))
cursor = conn.cursor()
sql = 'SELECT * FROM public.sensor WHERE "id" > 0 AND "available" = TRUE'
cursor.execute(sql)
sensors = cursor.fetchall()

sensor_list = []
for i in sensors:
    sensor_list.append({'label': i[1], 'value': i[0]})

x = datetime.now() - timedelta(days=1)
x = x.__str__()
y = "'"
x = y + x + y
sql_1 = 'SELECT * FROM public.sensor_hygrometer WHERE "Datetime" > ' + x +  ' ORDER BY "Datetime" ASC'

cursor.execute(sql_1)
data = cursor.fetchall()

variable = variables()
variable.set_flag(True)

X = deque(maxlen=1000)
Y = deque(maxlen=1000)

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
                             value=2,
                        ),
                html.Br(),
                html.H5(id='H5-2', children='Parameter:'),
                dcc.Dropdown(id='dropdown_2',
                             options=[],
                             value=0,
                        ),
                html.Br(),

                dcc.Graph(id='live-graph', animate=True),
                dcc.Interval(
                    id='graph-update',
                    interval=1000,
                    n_intervals=0
                ),
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

@app.callback([Output('dropdown_2','options'), Output('dropdown_2','value')],
              [Input('dropdown', 'value')])
def sensor_callback(input_value):
    sql = 'SELECT * FROM public.primary_variables WHERE "Sensor id" = ' + str(input_value) + ' AND "Available" = TRUE'
    cursor.execute(sql)
    sensors = cursor.fetchall()

    parameter_list = []
    for i in sensors:
        parameter_list.append({'label': i[1], 'value': i[0]})
    variable.set_value(sensors[-1][0])
    variable.set_flag(True)
    return parameter_list, variable.get_value()

# @app.callback(Output('live-graph','figure'), [Input('dropdown_2', 'value')])
# def Flag_callback():
#     set_flag(True)

@app.callback(Output('live-graph','figure'),
              [Input('dropdown_2', 'value'), Input('graph-update', 'n_intervals')])
def parameter_callback(input_value, n):
    date = datetime.now() - timedelta(days=1)
    date = date.__str__()
    aph = "'"
    date = aph + date + aph

    if variable.get_flag() == True or variable.get_value() != input_value:
        variable.set_value(input_value)
        X.clear()
        Y.clear()
        sql = 'SELECT primary_variables."id" "id", "data table", "Variable Name" FROM public.primary_variables JOIN public.sensor s on primary_variables."Sensor id" = s.id WHERE primary_variables."id" = ' + str(input_value)

        cursor.execute(sql)
        data = cursor.fetchall()

        datatable = data[0][1]
        parameter = data[0][2]

        aph = '"'
        parameter = aph + parameter + aph
        datatable = aph + datatable + aph

        variable.set_parameter(parameter)
        variable.set_datatable(datatable)
        variable.set_flag(False)

        sql = 'SELECT "Datetime",' + variable.get_parameter() + ' FROM ' + datatable + ' WHERE "Datetime" > ' + date + ' AND ' + variable.get_parameter() + ' IS NOT NULL ORDER BY "Datetime" DESC LIMIT 1000'

        cursor.execute(sql)
        data = cursor.fetchall()
        data.reverse()

        for i in data:
            X.append(i[0])
            Y.append(i[1])

        data = plotly.graph_objs.Scatter(
            x=list(X),
            y=list(Y),
            name='Scatter',
            mode='lines+markers'
        )

        if len(X) != 0:
            min_x = min(X)
            sec = max(X) - min(X)
            min_x = min_x - timedelta(seconds=sec.total_seconds() * 0.03)
            max_x = max(X)
            max_x = max_x + timedelta(seconds=sec.total_seconds() * 0.03)

            min_y = min(Y) - min(Y) * 0.01
            max_y = max(Y) + max(Y) * 0.01

            return {'data': [data],
                    'layout': go.Layout(autosize=True, xaxis=dict(range=[min_x, max_x]),
                                        yaxis=dict(range=[min_y, max_y]), )}

    elif variable.get_flag() == False:
        x = X[-1].__str__()
        y = "'"
        x = y + x + y
        sql = 'SELECT "Datetime",' + variable.get_parameter() + ' FROM ' + variable.get_datatable() + ' WHERE "Datetime" > ' + x + ' AND ' + variable.get_parameter() + ' IS NOT NULL ORDER BY "Datetime" ASC'
        cursor.execute(sql)
        data = cursor.fetchall()

        for i in data:
            X.append(i[0])
            Y.append(i[1])

        data = plotly.graph_objs.Scatter(
            x=list(X),
            y=list(Y),
            name='Scatter',
            mode='lines+markers'
        )

        min_x = min(X)
        sec = max(X) - min(X)
        min_x = min_x - timedelta(seconds=sec.total_seconds() * 0.03)

        max_x = max(X)
        max_x = max_x + timedelta(seconds=sec.total_seconds() * 0.03)

        return {'data': [data],
                'layout': go.Layout(autosize=True, xaxis=dict(range=[min_x, max_x]),
                                    yaxis=dict(range=[min(Y) - min(Y) * 0.01, max(Y) + max(Y) * 0.01]), )}
