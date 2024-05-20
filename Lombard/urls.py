from django.urls import path
from django.contrib import admin
from polls import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    # Ścieżki panelu administratora
    path('a/', admin.site.urls),
    path('admin/', views.administrator, name='administrator'),
    path('admin/wszystkie/', views.pokazWszystkie, name='wszystkie'),
    path('admin/klienci/', views.pokazKlientow, name='klienci'),
    path('admin/eksperci/', views.pokazEkspertow, name='eksperci'),
    path('admin/dodajProdukt/', views.dodajProdukt, name='dodajProdukt'),
    path('admin/pracownicy/', views.pokazPracownikow, name='pokazPracownikow'),
    path('admin/dodaj/', views.dodaj_pracownika, name='dodajPracownika'),
    path('admin/edytuj/<int:id_pracownika>/', views.edytuj_pracownika, name='edytujPracownika'),
    path('admin/usun/<int:id_pracownika>/', views.usun_pracownika, name='usunPracownika'),
    path('admin/pracownicy', views.wszyscy_pracownicy, name='wszyscy_pracownicy'),
    path('admin/przedmioty/<int:id_przedmiotu>/', views.szczegoly_przedmiotu_admin, name='szczegoly_przedmiotu_admin'),
    path('admin/przedmioty/edycja/<int:id_przedmiotu>/', views.edytujPrzedmiot, name='edytujPrzedmiot'),
    path('admin/przedmioty/usun/<int:id_przedmiotu>/', views.usunPrzedmiot, name='usunPrzedmiot'),
    path('admin/edytujkl/<int:id_klienta>/', views.edytuj_klienta, name="edytujKlienta"),
    path('admin/usun/<int:id_klienta>/', views.usun_klienta, name='usunKlienta'),
    path('admin/dodajklienta/', views.dodaj_klienta, name="dodajKlienta"),
    
    # Rejestracja, logowanie i wylogowywanie
    path('register/', views.register, name='register'),
    path('login/', auth_views.LoginView.as_view(template_name='lombard/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='/'), name='logout'),


    # Ścieżki dla użytkowników
    path('', views.stronaGlowna, name='stronaGlowna'),
    path('onas/', views.oNas, name='oNas'),
    path('kategoria/bizuteria/', views.bizuteria, name='bizuteria'),
    path('kategoria/motoryzacja/', views.motoryzacja, name='motoryzacja'),
    path('kategoria/sport/', views.sport, name='sport'),
    path('kategoria/domiogrod/', views.domIOgrod, name='domIOgrod'),
    path('kategoria/elektronika/', views.elektronika, name='elektronika'),
    path('kategoria/wszystkie/', views.pokazWszystkieKlientowi, name='pokazWszystkieKlientowi'),
    path('koszyk/dodaj-do-koszyka/<int:przedmiot_id>/', views.dodaj_do_koszyka, name='dodaj_do_koszyka'),
    path('koszyk/', views.koszyk_zakupow, name='koszykZakupow'),
    path('produkty_wybrana_kategoria/', views.produkty_wybrana_kategoria, name='produkty_wybrana_kategoria'),
    path('koszyk/usun_z_koszyka/', views.usun_z_koszyka, name='usun_z_koszyka'),
    path('przedmioty/<int:id_przedmiotu>/', views.szczegoly_przedmiotu, name='szczegoly_przedmiotu'),
    path('szukaj/', views.wynikiWyszukiwania, name='wynikiWyszukiwania'),
]
