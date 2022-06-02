from django import forms
from .models import Project
from bootstrap_datepicker_plus.widgets import DatePickerInput

from functools import partial
DateInput = partial(forms.DateInput, {'class': 'datepicker'})


class ProjectRequestForm(forms.ModelForm):
    class Meta:
        model = Project
        fields = ['project_name', 'research_objective', 'principal_investigator', 'project_tentative_start_date', 'project_duration', 'request_date']

        def get_form(self):
            form = super().get_form()
            form.fields['project_tentative_start_date'].widget = DatePickerInput()
            return form