from django.db import models
from django.contrib.auth.models import AbstractUser

class Usuario(AbstractUser):
    """
    Modelo de usuario personalizado que hereda de AbstractUser.
    
    Se añaden los argumentos `related_name` a los campos `groups` y 
    `user_permissions` para resolver los conflictos de acceso inverso
    con el modelo User base de Django.
    """
    
    # Agrega aquí cualquier otro campo personalizado que necesites para tu modelo Usuario.
    # ejemplo: fecha_nacimiento = models.DateField(null=True, blank=True)

    groups = models.ManyToManyField(
        'auth.Group',
        verbose_name='groups',
        blank=True,
        help_text=(
            'The groups this user belongs to. A user will get all permissions '
            'granted to each of their groups.'
        ),
        # Nombre único para el accesor inverso desde el modelo Group
        related_name="usuario_set", 
        related_query_name="usuario",
    )
    user_permissions = models.ManyToManyField(
        'auth.Permission',
        verbose_name='user permissions',
        blank=True,
        help_text='Specific permissions for this user.',
        # Nombre único para el accesor inverso desde el modelo Permission
        related_name="usuario_set",
        related_query_name="usuario",
    )

    def __str__(self):
        return self.username

    def __str__(self):
        return self.get_full_name() or self.email

# Modelo para la gestión de Vehículos
class Vehiculo(models.Model):
    ESTADO_CHOICES = (
        ('Disponible', 'Disponible'),
        ('En Ruta', 'En Ruta'),
        ('Mantenimiento', 'Mantenimiento'),
    )
    patente = models.CharField(max_length=10, unique=True)
    marca = models.CharField(max_length=50)
    modelo = models.CharField(max_length=50)
    anio = models.IntegerField(verbose_name="Año")
    estado = models.CharField(max_length=20, choices=ESTADO_CHOICES, default='Disponible')

    def __str__(self):
        return f"{self.marca} {self.modelo} ({self.patente})"


class Cliente(models.Model):
    """
    Modelo para representar a los clientes.
    """
    rut = models.CharField(max_length=10, unique=True, verbose_name='RUT')
    nombre = models.CharField(max_length=100, verbose_name='Nombre')
    apellido = models.CharField(max_length=100, verbose_name='Apellido')
    email = models.EmailField(max_length=254, unique=True, verbose_name='Correo Electrónico')
    telefono = models.CharField(max_length=15, blank=True, verbose_name='Teléfono')
    direccion = models.CharField(max_length=255, blank=True, verbose_name='Dirección')
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.nombre} {self.apellido} ({self.rut})"

    class Meta:
        verbose_name = 'cliente'
        verbose_name_plural = 'clientes'

# Modelo para la gestión de Pedidos
class Pedido(models.Model):
    ESTADO_CHOICES = (
        ('Pendiente', 'Pendiente'),
        ('Asignado', 'Asignado'),
        ('En Ruta', 'En Ruta'),
        ('Entregado', 'Entregado'),
    )
    cliente = models.CharField(max_length=150, help_text="Nombre del cliente o empresa")
    direccion = models.CharField(max_length=255, verbose_name="Dirección de Entrega")
    descripcion = models.TextField(blank=True, null=True)
    estado = models.CharField(max_length=20, choices=ESTADO_CHOICES, default='Pendiente')
    
    # Relaciones con otras tablas (ForeignKey)
    # Un pedido puede tener un conductor. Si el conductor es eliminado, el campo se pone en NULO.
    conductor = models.ForeignKey(
        Usuario, 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True,
        limit_choices_to={'rol': 'Conductor'}, # Solo permite seleccionar usuarios con rol 'Conductor'
        related_name="pedidos_asignados"
    )
    
    # Un pedido puede tener un vehículo. Si el vehículo es eliminado, el campo se pone en NULO.
    vehiculo = models.ForeignKey(
        Vehiculo, 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True,
        limit_choices_to={'estado': 'Disponible'} # Solo permite seleccionar vehículos 'Disponibles'
    )
    
    fecha_creacion = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Pedido #{self.id} - {self.cliente}"