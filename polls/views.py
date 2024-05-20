from django.shortcuts import render, redirect, get_object_or_404, reverse
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.http import JsonResponse, Http404
from django.core.files import File
from django.urls import reverse, reverse_lazy
from django.views import generic
from django.contrib import messages
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login
from django.contrib.auth.models import Group, User, Permission
from django.contrib.contenttypes.models import ContentType
from django.db.models import Q

from .models import Przedmiot, KoszykZakupu, PozycjaKoszyka, Pracownik, Klient
from .forms import CustomUserCreationForm, KlientForm

import mysql.connector
from django.contrib.auth.decorators import permission_required



from django.contrib.auth.decorators import permission_required






#########################################################################
#########################################################################
# Tworzenie grupy pracowników i klientów
group, created = Group.objects.get_or_create(name='Pracownicy')
group, created = Group.objects.get_or_create(name='Klienci')
# Przypisanie uprawnień do grupy pracowników
content_type = ContentType.objects.get_for_model(Pracownik)
permissions = Permission.objects.filter(content_type=content_type)
group.permissions.set(permissions)
group.save()



###################FORMS##################################
#################################################

class PracownikForm(forms.ModelForm):
    class Meta:
        model = Pracownik
        fields = ['imie', 'nazwisko', 'nr_telefonu', 'funkcja']

class CustomUserCreationForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=True)
    last_name = forms.CharField(max_length=30, required=True)

    class Meta:
        model = User
        fields = ("username", "first_name", "last_name", "password1", "password2")

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

### Łączenie z bazą danych ####
###############################
mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    password='',
    port='3306',
    database='baza_danych'
)   
mycursor = mydb.cursor()


############## PANEL ADMINA #################################
########################################################

@permission_required('app_name.can_view_admin', raise_exception=True)
def administrator(request):
    return render(request, 'lombard/administrator/administrator.html')

@permission_required('app_name.can_view_admin', raise_exception=True)      
def pokazEkspertow(request):
    mycursor.execute("SELECT * FROM eksperci")
    eksperci = mycursor.fetchall()
    return render(request, 'lombard/administrator/eksperci.html', {'eksperci': eksperci})
@permission_required('app_name.can_view_admin', raise_exception=True)    
def pokazPracownikow(request):
    mycursor.execute("SELECT * FROM pracownicy")
    pracownicy = mycursor.fetchall()
    wszyscy_pracownicy = Pracownik.objects.all()
    return render(request, 'lombard/administrator/pokazPracownikow.html', {'pracownicy':wszyscy_pracownicy})
    
####################### STRONA KLIENTA ####################
#######################################################
   
def stronaGlowna(request):
    return render(request, 'lombard/stronaGlowna.html')
       
def koszykZakupow(request):
    mycursor.execute("SELECT * FROM koszyk_zakupu")
    koszyk_zakupu = mycursor.fetchall()
    return render(request, 'lombard/koszyki/koszykZakupow.html', {'koszyk_zakupu': koszyk_zakupu})
    
def oNas(request):
    return render(request, 'lombard/oNas.html')
    

def register(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('stronaGlowna')  
    else:
        form = CustomUserCreationForm()
    return render(request, 'lombard/register.html', {'form': form})
    
    
###################### KLIENCI ############################
############################################################


@permission_required('app_name.can_view_admin', raise_exception=True)
def pokazKlientow(request):
    klienci = Klient.objects.all()  
    return render(request, 'lombard/administrator/pokazKlientow.html', {'klienci': klienci})


@permission_required('app_name.can_view_admin', raise_exception=True)
def usun_klienta(request, id_klienta):
    try:
        klient = Klient.objects.get(id_klienta=id_klienta)
    except Klient.DoesNotExist:
        raise Http404("Klient o podanym identyfikatorze nie istnieje")

    if request.method == 'POST':
        klient.delete()
        return redirect('wszyscy_klienci')

    return render(request, 'lombard/administrator/usunKlienta', {'klient': klient})


@permission_required('app_name.can_view_admin', raise_exception=True)    
def edytuj_klienta(request, id_klienta):
    klient = Klient.objects.get(pk=id_klienta)
    if request.method == 'POST':
        form = EdytujKlientaForm(request.POST, instance=klient)
        if form.is_valid():
            form.save()
            return redirect('wszyscy_klienci')
    else:
        form = KlientForm(instance=klient)
    return render(request, 'lombard/administrator/edytujKlientow.html', {'form': form, 'klient': klient})
    
@permission_required('app_name.can_view_admin', raise_exception=True)   
def dodaj_klienta(request):
    if request.method == 'POST':
        form = KlientForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect(reverse('wszyscy_klienci'))
    else:
        form = KlientForm()
    return render(request, 'lombard/administrator/dodajKlienta.html', {'form': form})

    
       
################# PRACOWNICY ###################
###########################################

@permission_required('app_name.can_view_admin', raise_exception=True)
def wszyscy_pracownicy(request):
    pracownicy = Pracownik.objects.all()
    return render(request, 'lombard/administrator/pokazPracownikow.html', {'pracownicy': pracownicy})
    
@permission_required('app_name.can_view_admin', raise_exception=True)   
def dodaj_pracownika(request):
    if request.method == 'POST':
        form = PracownikForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect(reverse('wszyscy_pracownicy'))
    else:
        form = PracownikForm()
    return render(request, 'lombard/administrator/dodajPracownika.html', {'form': form})
    
@permission_required('app_name.can_view_admin', raise_exception=True)
def edytuj_pracownika(request, id_pracownika):
    pracownik = Pracownik.objects.get(pk=id_pracownika)
    if request.method == 'POST':
        form = PracownikForm(request.POST, instance=pracownik)
        if form.is_valid():
            form.save()
            return redirect(reverse('wszyscy_pracownicy'))
    else:
        form = PracownikForm(instance=pracownik)
    return render(request, 'lombard/administrator/edytujPracownika.html', {'form': form})
    
@permission_required('app_name.can_view_admin', raise_exception=True)
def usun_pracownika(request, id_pracownika):
    pracownik = Pracownik.objects.get(pk=id_pracownika)
    if request.method == 'POST':
        pracownik.delete()
        return redirect(reverse('wszyscy_pracownicy'))
    return render(request, 'lombard/administrator/usunPracownika.html', {'pracownik': pracownik})

    
 
    
##################### PRODUKTY #######################
##################################################

def pokazWszystkieKlientowi(request):
    mycursor.execute("SELECT * FROM przedmioty")
    przedmioty = mycursor.fetchall()
    wszystkie_przedmioty = Przedmiot.objects.all()
    return render(request, 'lombard/pokazWszystkieKlientowi.html', {'przedmioty': wszystkie_przedmioty})
    
    
def pokazWszystkie(request):
    mycursor.execute("SELECT * FROM przedmioty")
    przedmioty = mycursor.fetchall()
    wszystkie_przedmioty = Przedmiot.objects.all()
    return render(request, 'lombard/kategorie/wszystkie.html', {'przedmioty': wszystkie_przedmioty})
    
@permission_required('app_name.can_view_admin', raise_exception=True)    
def dodajProdukt(request):
    wszystkie_przedmioty = Przedmiot.objects.all()
    if request.method == 'POST':
        data = request.POST
        id_przedmiotu = data.get('id_przedmiotu')
        nazwa = data.get('nazwa')
        kategoria_id = data.get('kategoria_id')
        stan = data.get('stan')
        jak_pozyskany = data.get('jak_pozyskany')
        cena = data.get('cena')
        ekspertyza = data.get('ekspertyza')
        zdjecie = data.get('zdjecie')
        ilosc= data.get('ilosc')
        opis= data.get('opis')

        try:
            przedmiot = Przedmiot.objects.create(
                id_przedmiotu=id_przedmiotu,
                nazwa=nazwa,
                kategoria_id=kategoria_id,
                stan=stan,
                jak_pozyskany=jak_pozyskany,
                cena=cena,
                ekspertyza=ekspertyza,
                zdjecie=zdjecie,
                ilosc=ilosc,
                opis=opis
            )

            return redirect('wszystkie')
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})

    return render(request, 'lombard/administrator/dodajProdukt.html', {'przedmioty': wszystkie_przedmioty})
     
@permission_required('app_name.can_view_admin', raise_exception=True)
def edytujPrzedmiot(request, id_przedmiotu):
    try:
        przedmiot = Przedmiot.objects.get(id_przedmiotu=id_przedmiotu)
    except Przedmiot.DoesNotExist:
        raise Http404("Przedmiot o podanym identyfikatorze nie istnieje")

    if request.method == 'POST':
        przedmiot.nazwa = request.POST.get('nazwa')
        przedmiot.kategoria_id = request.POST.get('kategoria_id')
        przedmiot.stan = request.POST.get('stan')
        przedmiot.jak_pozyskany = request.POST.get('jak_pozyskany')
        przedmiot.cena = request.POST.get('cena')
        przedmiot.ekspertyza = request.POST.get('ekspertyza')
        przedmiot.zdjecie = request.POST.get('zdjecie')
        przedmiot.ilosc = request.POST.get('ilosc')
        przedmiot.opis = request.POST.get('opis')
        przedmiot.save()
        
        return redirect('wszystkie')

    return render(request, 'lombard/administrator/edytujPrzedmiot.html', {'przedmiot': przedmiot})
@permission_required('app_name.can_view_admin', raise_exception=True)   
def usunPrzedmiot(request, id_przedmiotu):
    przedmiot = get_object_or_404(Przedmiot, id_przedmiotu=id_przedmiotu)
    przedmiot.delete()
    
    return redirect('wszystkie')
    

def szczegoly_przedmiotu(request, id_przedmiotu):
    przedmiot = get_object_or_404(Przedmiot, id_przedmiotu=id_przedmiotu)
    return render(request, 'lombard/przedmiot/szczegoly_przedmiotu.html', {'przedmiot': przedmiot})
@permission_required('app_name.can_view_admin', raise_exception=True)    
def szczegoly_przedmiotu_admin(request, id_przedmiotu):
    przedmiot = get_object_or_404(Przedmiot, id_przedmiotu=id_przedmiotu)
    return render(request, 'lombard/przedmiot/szczegoly_przedmiotu_admin.html', {'przedmiot': przedmiot})
    
def wynikiWyszukiwania(request):
    query = request.GET.get('query')
    results = Przedmiot.objects.filter(
        Q(nazwa__icontains=query) |  
        Q(opis__icontains=query) |  
        Q(kategoria_id__icontains=query)  
    )
    return render(request, 'lombard/wynikiWyszukiwania.html', {'results': results, 'query': query})
    

   

   
######################### KATEGORIE ##################################
##################################################################
  
def elektronika(request):
    przedmioty_elektroniczne = Przedmiot.objects.filter(kategoria_id='elektronika')
    return render(request, 'lombard/kategorie/elektronika.html', {'przedmioty': przedmioty_elektroniczne})
    
def domIOgrod(request):
    przedmioty_dom_i_ogrod = Przedmiot.objects.filter(kategoria_id='domIOgrod')
    return render(request, 'lombard/kategorie/domIOgrod.html', {'przedmioty': przedmioty_dom_i_ogrod})

def sport(request):
    przedmioty_sport = Przedmiot.objects.filter(kategoria_id='sport')
    return render(request, 'lombard/kategorie/sport.html', {'przedmioty': przedmioty_sport})

def motoryzacja(request):
    przedmioty_motoryzacja = Przedmiot.objects.filter(kategoria_id='motoryzacja')
    return render(request, 'lombard/kategorie/motoryzacja.html', {'przedmioty': przedmioty_motoryzacja})

def bizuteria(request):
    przedmioty_bizuteria = Przedmiot.objects.filter(kategoria_id='bizuteria')
    return render(request, 'lombard/kategorie/bizuteria.html', {'przedmioty': przedmioty_bizuteria})

    
def produkty_wybrana_kategoria(request):
    if request.method == "GET":
        kategoria_id = request.GET.get("kategoria_id")
        if kategoria_id:
            przedmioty = Przedmiot.objects.filter(kategoria_id=kategoria_id)
        else:
            przedmioty = Przedmiot.objects.all()  
        return render(request, 'lombard/pokazWszystkieKlientowi.html', {'przedmioty': przedmioty})
    return redirect('pokazWszystkieKlientowi')
    
    
#################### KOSZYKI - ZAKUPU ################
###############################################

@login_required
def dodaj_do_koszyka(request, przedmiot_id):
    przedmiot = get_object_or_404(Przedmiot, id_przedmiotu=przedmiot_id)
    koszyk, created = KoszykZakupu.objects.get_or_create(id_klienta=request.user.id)
    pozycja, created = PozycjaKoszyka.objects.get_or_create(koszyk=koszyk, przedmiot=przedmiot)
    if not created:
        pozycja.ilosc += 1
        pozycja.save()
    return redirect('pokazWszystkieKlientowi')  

@login_required
def koszyk_zakupow(request):
    koszyk, created = KoszykZakupu.objects.get_or_create(id_klienta=request.user.id)
    pozycje = koszyk.pozycje.all()
    
    # Obliczanie sumy cen
    suma_cen = sum(float(pozycja.przedmiot.cena) * pozycja.ilosc for pozycja in pozycje)
    
    return render(request, 'lombard/koszyki/koszykZakupow.html', {'pozycje': pozycje, 'koszyk': koszyk, 'suma_cen': suma_cen})

def usun_z_koszyka(request):
    if request.method == 'POST':
        pozycja_id = request.POST.get('pozycja_id')
        pozycja = get_object_or_404(PozycjaKoszyka, id=pozycja_id)
        pozycja.delete()
        return redirect('koszykZakupow')  
    return redirect('stronaGlowna') 


############### DO dokonczenia#################
################################################


