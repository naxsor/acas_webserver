from django.urls import path
from .views import (
    ProjectDetailView, ProjectListView, ProjectRequestView, ProjectDeleteView
)

urlpatterns = [
    path('project/', ProjectListView.as_view(), name='project-list'),
    path('project/<int:pk>/', ProjectDetailView.as_view(), name='project-detail'),
    path('project/request/', ProjectRequestView.as_view(), name='project-request'),
    # path('post/<int:pk>/update/', PostUpdateView.as_view(), name='post-update'),
    path('post/<int:pk>/delete/', ProjectDeleteView.as_view(), name='project-delete'),
]