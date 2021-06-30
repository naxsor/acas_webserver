from django.db import models
from django.urls import reverse
from django.contrib.auth.models import User
from django.utils import timezone

# Create your models here.
class Project(models.Model):
    project_name = models.CharField(max_length=50)
    research_objective = models.TextField()
    principal_investigator = models.CharField(max_length=50)
    project_tentative_start_date = models.DateField()
    project_duration = models.CharField(max_length=50)
    request_date = models.DateTimeField(default=timezone.now)
    request_by = models.ForeignKey(User, on_delete=models.CASCADE)
    active = models.BooleanField()

    def __str__(self):
        return self.project_name

    def get_absolute_url(self):
        return reverse('project-detail', kwargs={'pk': self.pk})
