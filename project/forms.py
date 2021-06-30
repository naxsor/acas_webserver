from django import forms
from .models import Project
from bootstrap_datepicker_plus import DatePickerInput

from functools import partial
DateInput = partial(forms.DateInput, {'class': 'datepicker'})


class ProjectRequestForm(forms.ModelForm):
    class Meta:
        model = Project
        fields = ['project_name', 'research_objective', 'principal_investigator', 'project_tentative_start_date', 'project_duration', 'request_date', 'request_by']
        # widgets = {
        #     'project_tentative_start_date': DatePickerInput(),  # default date-format %m/%d/%Y will be used
        #          # specify date-frmat
        # }