from django.shortcuts import render, get_object_or_404
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin, PermissionRequiredMixin
from django.contrib.auth.models import User
from sensors.models import Sensor
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)
from .models import Post, Slideshow, Image


def home(request):
    context = {
        'slides': Slideshow.objects.all()
    }
    return render(request, 'blog/home.html', context)

class StaffListView(ListView):
    model = User
    template_name = 'blog/staff.html'
    context_object_name = 'users'

class PostListView(ListView):
    model = Post
    template_name = 'blog/blog.html'  # <app>/<model>_<viewtype>.html
    context_object_name = 'posts'
    ordering = ['-date_posted']
    paginate_by = 5

class UserPostListView(ListView):
    model = Post
    template_name = 'blog/user_posts.html'  # <app>/<model>_<viewtype>.html
    context_object_name = 'posts'
    paginate_by = 5

    def get_queryset(self):
        user = get_object_or_404(User, username=self.kwargs.get('username'))
        return Post.objects.filter(author=user).order_by('-date_posted')


class PostDetailView(DetailView):
    model = Post

class PostCreateView(PermissionRequiredMixin, LoginRequiredMixin, CreateView):
    permission_required = 'blog.add_post'
    model = Post
    fields = ['title', 'content', 'image']


    def form_valid(self, form):
        # if self.request.method == 'POST':
        form.instance.author = self.request.user
        form.save()
        return super().form_valid(form)


class PostUpdateView(PermissionRequiredMixin, LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    permission_required = 'blog.change_post'
    model = Post
    fields = ['title', 'content', 'image']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False

class PostDeleteView(PermissionRequiredMixin, LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Post
    success_url = '/blog/'
    permission_required = 'blog.delete_post'

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False


def about(request):
    return render(request, 'blog/about.html', {'title': 'About'})

def calendar(request):
    return render(request, 'blog/calendar.html', {'title': 'Calendar'})

