from django.contrib import admin
from gestion.models import Usuario, Cliente

# Registramos el modelo Usuario personalizado
@admin.register(Usuario)
class UsuarioAdmin(admin.ModelAdmin):
    list_display = ('username', 'email', 'first_name', 'last_name', 'is_staff')
    search_fields = ('username', 'email', 'first_name', 'last_name')

# Registramos el modelo Cliente
@admin.register(Cliente)
class ClienteAdmin(admin.ModelAdmin):
    list_display = ('rut', 'nombre', 'apellido', 'email', 'telefono')
    search_fields = ('rut', 'nombre', 'apellido', 'email')
