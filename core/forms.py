
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class EntrarForm(forms.ModelForm):

    # nome = forms.CharField(widget=forms.TextInput(attrs={"class":"form-control"}))

    class Meta:
        fields = '__all__'

class ProdutoForm(forms.ModelForm):

    class Meta:
        fields = '__all__'


