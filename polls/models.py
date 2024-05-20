from django.conf import settings
from django.db import models
from django.contrib.auth.models import User
from django import forms 
from django.db import models

class Przedmiot(models.Model):
    id_przedmiotu = models.AutoField(primary_key=True)
    nazwa = models.CharField(max_length=255)
    kategoria_id = models.CharField(max_length=255)
    stan = models.CharField(max_length=255)
    jak_pozyskany = models.CharField(max_length=255)
    cena = models.CharField(max_length=255)
    ekspertyza = models.CharField(max_length=255)
    zdjecie = models.URLField()
    ilosc = models.CharField(max_length=255)
    opis = models.CharField(max_length=255)

    def __str__(self):
        return self.nazwa
        
    class Meta:
        db_table = 'przedmioty'  
        app_label = 'Lombard'  

class Klient(models.Model):
    id_klienta = models.AutoField(primary_key=True)
    imie = models.CharField(max_length=255)
    nazwisko = models.CharField(max_length=255)
    nr_telefonu = models.CharField(max_length=255)
    ulica_i_nr = models.CharField(max_length=255)
    miasto = models.CharField(max_length=255)

    def __str__(self):
        return self.nr_telefonu
        
    class Meta:
        db_table = 'klienci'
        app_label = 'Lombard'  
        
class Pracownik(models.Model):
    id_pracownika = models.AutoField(primary_key=True)
    imie = models.CharField(max_length=255)
    nazwisko = models.CharField(max_length=255)
    nr_telefonu = models.CharField(max_length=255)
    funkcja = models.CharField(max_length=255)
    
    def __str__(self):
        return self.nr_telefonu
        
    class Meta:
        db_table = 'pracownicy' 
        app_label = 'Lombard'
        permissions = [
            ("can_view_admin", "Can view admin panel"),]
class KoszykZakupu(models.Model):
    id_koszyka = models.AutoField(primary_key=True)
    przedmiot1 = models.CharField(max_length=255)
    cena1 = models.CharField(max_length=255)
    przedmiot2 = models.CharField(max_length=255)
    cena2 = models.CharField(max_length=255)
    id_klienta = models.CharField(max_length=255)

    def __str__(self):
        return f'Koszyk użytkownika {self.id_klienta}'

    class Meta:
        db_table = 'koszyk_zakupu'
        app_label = 'Lombard'

class PozycjaKoszyka(models.Model):
    id = models.AutoField(primary_key=True)
    koszyk = models.ForeignKey(KoszykZakupu, on_delete=models.CASCADE, related_name='pozycje')
    przedmiot = models.ForeignKey(Przedmiot, on_delete=models.CASCADE)
    ilosc = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f'{self.ilosc} x {self.przedmiot.nazwa} w koszyku {self.koszyk.id_klienta}'

    class Meta:
        db_table = 'pozycja_koszyka'
        app_label = 'Lombard'
        
        

class PracownikForm(forms.ModelForm):
    class Meta:
        model = Pracownik
        fields = ['imie', 'funkcja', 'nazwisko', 'nr_telefonu']
        permissions = [
            ("can_view_admin", "Can view admin panel"),]
        
        
        
