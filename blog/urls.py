from django.urls import path
from .views import (
    home,
    PostListView,
    PostDetailView,
    PostCreateView,
    PostUpdateView,
    PostDeleteView,
    UserPostListView,
    StaffListView,
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
    sensors,
    data
)
from . import views
from django.contrib import admin
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home,name='blog-home'),
    path('blog/', PostListView.as_view(), name='blog-blog'),
    path('user/<str:username>', UserPostListView.as_view(), name='user-posts'),
    path('post/<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('post/new/', PostCreateView.as_view(), name='post-create'),
    path('post/<int:pk>/update/', PostUpdateView.as_view(), name='post-update'),
    path('post/<int:pk>/delete/', PostDeleteView.as_view(), name='post-delete'),
    path('about/acas', views.about, name='blog-about'),
    path('about/calendar/', views.calendar, name='blog-calendar'),
    path('about/sensors/', sensors, name='blog-sensors'),
    path('about/staff/', StaffListView.as_view(), name='blog-staff'),
    path('project/', ProjectListView.as_view(), name='project-list'),
    path('project/<int:pk>/', ProjectDetailView.as_view(), name='project-detail'),
    path('project/request/', ProjectRequestView.as_view(), name='project-request'),
    path('project/<int:pk>/delete/', ProjectDeleteView.as_view(), name='project-delete'),
    path('project/<int:pk>/update/', ProjectUpdateView.as_view(), name='project-update'),
    path('adapts/about', app_about, name='app-about'),
    path('adapts/download', app_download, name='app-download'),
    path('adapts/data', data, name='app-data'),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

admin.site.site_header = 'ACAS Administration'
admin.site.site_title = 'ACAS Administration'