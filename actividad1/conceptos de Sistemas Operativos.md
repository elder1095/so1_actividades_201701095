# Conceptos de Sistemas Operativos
### Tipos de Kernel y sus diferencias
| Kernel Monolítico | Kernel Microkernel | Kernel Híbrido | Kernel Híbrido |
|----------|----------|----------|----------|
| - Es el tipo más antiguo y simple de kernel. | - Diseñado para ser minimalista y modular. | Cell 3   |
| - Todas las funciones esenciales del sistema operativo se ejecutan en un espacio de memoria común.    | - Solo contiene las funciones esenciales del sistema operativo, como la gestión de memoria, planificación de procesos y comunicación interprocesos (IPC).   | Cell 6   |
| - Tiene una estructura monolítica, lo que significa que todas las funcionalidades están integradas en el mismo bloque de código.    | -Las funciones no esenciales, como el sistema de archivos, el controlador de dispositivos, etc., se ejecutan fuera del kernel en el espacio de usuario.  | Cell 9   |
| - Mayor eficiencia en el acceso a recursos del sistema, ya que no hay capas de abstracción adicionales.    | - Mayor estabilidad y seguridad, ya que los errores en los componentes externos al kernel no afectan directamente a su funcionamiento. | Cell 9   |
| - Sistemas operativos con kernel monolítico incluyen Linux (en su versión estándar), UNIX y MS-DOS. | - Sistemas operativos con kernel microkernel incluyen GNU Hurd y MINIX. |  |  |

### User vs Kernel Mode
