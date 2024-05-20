from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User, Group
from .models import Pracownik

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

    class Meta:
        model = User
        fields = ("username", "first_name", "last_name", "password1", "password2")

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
            # Nadajemy uprawnienia na podstawie tego, czy użytkownik jest pracownikiem czy klientem
            if Pracownik.objects.filter(imie=user.first_name, nazwisko=user.last_name).exists():
                pracownik_group = Group.objects.get(name='Pracownicy')
                user.groups.add(pracownik_group)
            else:
                klient_group = Group.objects.get(name='Klienci')
                user.groups.add(klient_group)
        return user
