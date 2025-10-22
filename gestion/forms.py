from django import forms
from .models import Cliente

class ClienteForm(forms.ModelForm):
    """
    Formulario basado en el modelo Cliente.
    Django creará automáticamente los campos del formulario a partir del modelo.
    """
    class Meta:
        model = Cliente
        # '__all__' significa que queremos incluir todos los campos del modelo en el formulario.
        fields = '__all__'

        # Personalización de los widgets para que se vean bien con Bootstrap
        widgets = {
            'rut': forms.TextInput(attrs={'class': 'form-control'}),
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'apellido': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'telefono': forms.TextInput(attrs={'class': 'form-control'}),
            'direccion': forms.TextInput(attrs={'class': 'form-control'}),
        }
