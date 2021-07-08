from django.urls import path
from .views import (
    PostListView,
    PostDetailView,
    PostCreateView,
    PostUpdateView,
    PostDeleteView,
    UserPostListView,
)
from project.views import (
    ProjectDetailView,
    ProjectListView,
    ProjectRequestView,
    ProjectDeleteView,
    ProjectUpdateView
)

from app.views import (
    app_about,
    app_download,
)

from sensors.views import (
    sensors
)
from . import views
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', PostListView.as_view(), name='blog-home'),
    path('user/<str:username>', UserPostListView.as_view(), name='user-posts'),
    path('post/<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('post/new/', PostCreateView.as_view(), name='post-create'),
    path('post/<int:pk>/update/', PostUpdateView.as_view(), name='post-update'),
    path('post/<int:pk>/delete/', PostDeleteView.as_view(), name='post-delete'),
    path('about/acas', views.about, name='blog-about'),
    path('about/calendar/', views.calendar, name='blog-calendar'),
    path('about/sensors/', sensors, name='blog-sensors'),
    path('project/', ProjectListView.as_view(), name='project-list'),
    path('project/<int:pk>/', ProjectDetailView.as_view(), name='project-detail'),
    path('project/request/', ProjectRequestView.as_view(), name='project-request'),
    path('project/<int:pk>/delete/', ProjectDeleteView.as_view(), name='project-delete'),
    path('project/<int:pk>/update/', ProjectUpdateView.as_view(), name='project-update'),
    path('adapts/about', app_about, name='app-about'),
    path('adapts/download', app_download, name='app-download'),

]

admin.site.site_header = 'ACAS Administration'
admin.site.site_title = 'ACAS Administration'