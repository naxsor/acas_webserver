from django.shortcuts import render
from bootstrap_datepicker_plus import DatePickerInput
from .models import Project
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
    fields = ['project_name', 'research_objective', 'principal_investigator', 'project_tentative_start_date', 'project_duration', 'request_by']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

    def get_form(self):
        form = super().get_form()
        form.fields['project_tentative_start_date'].widget = DatePickerInput()
        return form

class ProjectDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Project
    success_url = '/'

    def test_func(self):
        project = self.get_object()
        if self.request.user == project.request_by:
            return True
        return False

