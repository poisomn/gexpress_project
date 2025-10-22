from django.urls import path
from gestion import views

# Este archivo define las URLs específicas para la app 'gestion'
urlpatterns = [
    # Cuando un usuario visite la URL raíz de clientes ('/clientes/'), 
    # se ejecutará la vista 'cliente_list'.
    path('', views.cliente_list, name='cliente_list'),
    path('clientes/nuevo/', views.cliente_create, name='cliente_create'),
    path('clientes/<int:pk>/editar/', views.cliente_update, name='cliente_update'),
    path('clientes/<int:pk>/eliminar/', views.cliente_delete, name='cliente_delete'),
    path('usuarios/', views.usuario_list, name='usuario_list'),
]
