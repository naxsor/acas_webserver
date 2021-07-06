from django.shortcuts import render
from bootstrap_datepicker_plus import DatePickerInput
from .models import Project
from django import forms
from adapts.settings import EMAIL_HOST_USER
from django.core.mail import send_mail
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)

# Create your views here.
class ProjectListView(ListView):
    model = Project
    template_name = 'project/projects.html'  # <app>/<model>_<viewtype>.html
    context_object_name = 'projects'
    ordering = ['-request_date']
    paginate_by = 5

class ProjectDetailView(DetailView):
    model = Project

class ProjectRequestView(LoginRequiredMixin, CreateView):
    model = Project
    fields = ['project_name', 'research_objective', 'principal_investigator', 'project_tentative_start_date', 'project_duration']

    def form_valid(self, form):
        form.instance.author = self.request.user
        send_mail('Project Request: ' + form.cleaned_data['project_name'],
                  'A Project Request was summited through the ACAS Blog. The project requested'
                  'name is ' + form.cleaned_data['project_name'] + '. The request is being made by ' + form.cleaned_data['principal_investigator'].first_name
                  + ' ' + form.cleaned_data['principal_investigator'].last_name + '('+ form.cleaned_data['principal_investigator'].username +')'  + '. Please check the request.', EMAIL_HOST_USER, recipient_list=['lemanuel.colon@upr.edu'])
        return super().form_valid(form)

    def get_form(self):
        form = super().get_form()
        form.fields['project_tentative_start_date'].widget = DatePickerInput()
        form.fields['principal_investigator'].initial = self.request.user
        form.fields['principal_investigator'].widget = forms.HiddenInput()
        return form

class ProjectDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Project
    success_url = '/'

    def test_func(self):
        project = self.get_object()
        if self.request.user == project.principal_investigator:
            return True
        return False

class ProjectUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Project
    fields = ['project_name', 'research_objective','project_tentative_start_date', 'project_duration']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

    def test_func(self):
        project = self.get_object()
        if self.request.user == project.principal_investigator:
            return True
        return False

    def get_form(self):
        form = super().get_form()
        form.fields['project_tentative_start_date'].widget = DatePickerInput()
        return form
