from django.shortcuts import render, get_object_or_404, redirect
from .models import Cliente, Usuario
from .forms import ClienteForm

# --- Vistas de Clientes (CRUD Completo) ---

def cliente_list(request):
    """ Muestra la lista de todos los clientes. (Read) """
    clientes = Cliente.objects.all().order_by('nombre')
    return render(request, 'gestion/cliente_list.html', {'clientes': clientes})

def cliente_create(request):
    """ Crea un nuevo cliente. (Create) """
    if request.method == 'POST':
        form = ClienteForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('cliente_list')
    else:
        form = ClienteForm()
    return render(request, 'gestion/cliente_form.html', {'form': form})

def cliente_update(request, pk):
    """ Actualiza un cliente existente. (Update) """
    cliente = get_object_or_404(Cliente, pk=pk)
    if request.method == 'POST':
        form = ClienteForm(request.POST, instance=cliente)
        if form.is_valid():
            form.save()
            return redirect('cliente_list')
    else:
        form = ClienteForm(instance=cliente)
    return render(request, 'gestion/cliente_form.html', {'form': form, 'cliente': cliente})

def cliente_delete(request, pk):
    """ Elimina un cliente. (Delete) """
    cliente = get_object_or_404(Cliente, pk=pk)
    if request.method == 'POST':
        cliente.delete()
        return redirect('cliente_list')
    return render(request, 'gestion/cliente_confirm_delete.html', {'cliente': cliente})


# --- Vistas de Usuarios ---

def usuario_list(request):
    """ Muestra la lista de todos los usuarios. """
    usuarios = Usuario.objects.all().order_by('username')
    return render(request, 'gestion/usuario_list.html', {'usuarios': usuarios})

