from django import forms
from .models import Post
from bootstrap_datepicker_plus import DatePickerInput




class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ['title', 'content', 'date_posted', 'author']