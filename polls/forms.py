from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User, Group
from .models import Pracownik

from django import forms
from .models import Klient

class KlientForm(forms.ModelForm):
    class Meta:
        model = Klient
        fields = ['imie', 'nazwisko', 'nr_telefonu', 'ulica_i_nr', 'miasto']

class PracownikForm(forms.ModelForm):
    class Meta:
        model = Pracownik
        fields = ['imie', 'funkcja', 'nazwisko', 'nr_telefonu']

class CustomUserCreationForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=True)
    last_name = forms.CharField(max_length=30, required=True)
    password1 = forms.CharField(
        label='Password',
        widget=forms.PasswordInput,
        help_text="Hasło musi zawierać co najmniej 5 znaków."
    )
    password2 = forms.CharField(
        label='Password confirmation',
        widget=forms.PasswordInput,
        help_text="Wprowadź to samo hasło co wcześniej, dla weryfikacji."
    )
    imie = forms.CharField(max_length=255, required=True)
    nazwisko = forms.CharField(max_length=255, required=True)
    nr_telefonu = forms.CharField(max_length=255, required=True)
    funkcja = forms.CharField(max_length=255, required=True)

    class Meta:
        model = User
        fields = ("username", "first_name", "last_name", "password1", "password2", "imie", "nazwisko", "nr_telefonu", "funkcja")

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Hasła nie pasują do siebie.")
        if len(password1) < 5:
            raise forms.ValidationError("Hasło musi mieć co najmniej 5 znaków.")
        return password2

    def save(self, commit=True):
        user = super(CustomUserCreationForm, self).save(commit=False)
        user.first_name = self.cleaned_data["first_name"]
        user.last_name = self.cleaned_data["last_name"]
        if commit:
            user.save()
            # Tworzenie obiektu Pracownik po zarejestrowaniu użytkownika
            Pracownik.objects.create(
                imie=self.cleaned_data["imie"],
                nazwisko=self.cleaned_data["nazwisko"],
                nr_telefonu=self.cleaned_data["nr_telefonu"],
                funkcja=self.cleaned_data["funkcja"]
            )
            # Nadanie uprawnień na podstawie tego, czy użytkownik jest pracownikiem czy klientem
            if Pracownik.objects.filter(imie=user.first_name, nazwisko=user.last_name).exists():
                pracownik_group = Group.objects.get(name='Pracownicy')
                user.groups.add(pracownik_group)
            else:
                klient_group = Group.objects.get(name='Klienci')
                user.groups.add(klient_group)
        return user
