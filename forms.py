from django import forms
from .models import Pracownik

class PracownikForm(forms.ModelForm):
    class Meta:
        model = Pracownik
        fields = ['imie', 'funkcja', 'nazwisko', 'nr_telefonu']
