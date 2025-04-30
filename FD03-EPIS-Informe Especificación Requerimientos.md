Logo de Mi Empresa		Logo de mi Cliente

![C:\Users\EPIS\Documents\upt.png](/media/logo-upt.png)

**UNIVERSIDAD PRIVADA DE TACNA**

**FACULTAD DE INGENIERÍA**

**Escuela Profesional de Ingeniería de Sistemas**


` `**“App de Gestión Financiera para el Registro y Análisis de Gastos Personales”**

Curso: Patrones de Software 

Docente: Ing. Patrick Cuadros


Integrantes:

***Ayma Choque, Erick Yoel (2021072616)***

***Poma Machicado, Fabiola Estefani (2021070030)***

***Tapia Vargas, Dylan Yariet (2021072630)***






**Tacna – Perú**

***2025***

|CONTROL DE VERSIONES||||||
| :-: | :- | :- | :- | :- | :- |
|Versión|Hecha por|Revisada por|Aprobada por|Fecha|Motivo|
|1\.0|MPV|ELV|ARV|10/10/2020|Versión Original|












App de Gestión Financiera para el Registro y Análisis de Gastos Personales

Documento de Especificación de Requerimientos de Software

Versión *{1.0}*



|CONTROL DE VERSIONES||||||
| :-: | :- | :- | :- | :- | :- |
|Versión|Hecha por|Revisada por|Aprobada por|Fecha|Motivo|
|1\.0|MPV|ELV|ARV|10/10/2020|Versión Original|

**ÍNDICE GENERAL**

[**INTRODUCCIÓN**	](#_heading=h.hkj9irjtfnf0)**4****

[**1. Generalidades de la Empresa**	](#_heading=h.n095i82z547i)**4**

[1.1. Nombre de la Empresa	](#_heading=h.dsp8avf8byvd)4

[1.2. Visión	](#_heading=h.3ccnsux4af0v)4

[1.3. Misión	](#_heading=h.30i5xn9dtdwu)4

[1.4. Organigrama	](#_heading=h.ch8vafgabzp7)4

[**2. Visionamiento de la Empresa**	](#_heading=h.6qsjmqc6l022)**4**

[2.1. Descripción del Problema	](#_heading=h.v3jn9dx9trbp)4

[2.2. Objetivos de Negocios	](#_heading=h.ahdyjwdfqpui)4

[2.3. Objetivos de Diseño	](#_heading=h.l57bvfgp33mm)4

[2.4. Alcance del Proyecto	](#_heading=h.jg0glgag3ig4)4

[2.5. Viabilidad del Sistema	](#_heading=h.ncrk7bfo05qo)4

[2.6. Información obtenida del Levantamiento de Información	](#_heading=h.hfgszxp71nhh)4

[**3. Análisis de Procesos**	](#_heading=h.t8p89hxyife5)**4**

[3.1. Diagrama del Proceso Actual – Diagrama de Actividades	](#_heading=h.uou7qh3rlt4m)4

[3.2. Diagrama del Proceso Propuesto – Diagrama de Actividades Inicial	](#_heading=h.juc9i9qan9u7)4

[**4. Especificación de Requerimientos de Software**	](#_heading=h.9630cn1jymfa)**4**

[4.1. Cuadro de Requerimientos Funcionales Inicial	](#_heading=h.3w2kxivyxur9)4

[4.2. Cuadro de Requerimientos No Funcionales	](#_heading=h.knyl8m7qpkn0)4

[4.3. Cuadro de Requerimientos Funcionales Final	](#_heading=h.ceiefm8h27jj)4

[4.4. Reglas de Negocio	](#_heading=h.j2u9vp8vb2bb)4

[**5. Fase de Desarrollo**	](#_heading=h.olqlt4rbjbs0)**4**

[5.1. Perfiles de Usuario	](#_heading=h.jxxt7i93qtt)4

[5.2. Modelo Conceptual	](#_heading=h.cefe7l136404)4

[5.2.1. Diagrama de Paquetes	](#_heading=h.c0ocx0tdywye)4

[5.2.2. Diagrama de Casos de Uso	](#_heading=h.8igw5sr3ist0)4

[5.2.3. Escenarios de Caso de Uso (Narrativa)	](#_heading=h.3c7vri2ina2g)4

[5.3. Modelo Lógico	](#_heading=h.e4p5a8yvx0p)4

[5.3.1. Análisis de Objetos	](#_heading=h.o6p9xmo1br0k)4

[5.3.2. Diagrama de Actividades con Objetos	](#_heading=h.1mwyg0g67n3y)4

[5.3.3. Diagrama de Secuencia	](#_heading=h.z63ene7kf45u)4

[5.3.4. Diagrama de Clases	](#_heading=h.ikfrxib9mw0d)4

[**CONCLUSIONES**	](#_heading=h.5ejs9u6stk5o)**4**

[**RECOMENDACIONES**	](#_heading=h.5rydli3yr902)**4**

[**BIBLIOGRAFÍA**	](#_heading=h.yxf44mscz88v)**4**

# <a name="_heading=h.hkj9irjtfnf0"></a>INTRODUCCIÓN
1. # <a name="_heading=h.n095i82z547i"></a>Generalidades de la Empresa
   1. ## <a name="_heading=h.dsp8avf8byvd"></a>Nombre de la Empresa
      BCP - Banco de Crédito Personalizado 
   1. ## <a name="_heading=h.3ccnsux4af0v"></a>Visión
      Ser el banco líder en todos los segmentos y productos que ofrecemos, promoviendo el éxito de nuestros clientes con soluciones financieras adecuadas para sus necesidades, facilitando el desarrollo de nuestros colaboradores, generando valor para nuestros accionistas y apoyando el desarrollo sostenido del país.
   1. ## <a name="_heading=h.30i5xn9dtdwu"></a>Misión
      Promover el éxito de nuestros clientes con soluciones financieras adecuadas para sus necesidades, facilitar el desarrollo de nuestros colaboradores, generar valor para nuestros accionistas y apoyar el desarrollo sostenido del país.
   1. ## <a name="_heading=h.ch8vafgabzp7"></a>Organigrama
1. # <a name="_heading=h.6qsjmqc6l022"></a>Visionamiento de la Empresa
   1. ## <a name="_heading=h.v3jn9dx9trbp"></a>Descripción del Problema
      En el contexto actual, muchos clientes enfrentan desafíos relacionados con la accesibilidad y la eficiencia de los servicios bancarios tradicionales. La necesidad de soluciones digitales que ofrezcan comodidad, seguridad y personalización es cada vez más evidente. Además, la creciente demanda de servicios financieros inclusivos y sostenibles requiere una respuesta ágil y adaptada a las nuevas tecnologías.
   1. ## <a name="_heading=h.ahdyjwdfqpui"></a>Objetivos de Negocios
- Expandir la inclusión financiera, proporcionando acceso a servicios bancarios a segmentos de la población no atendidos.
- Incrementar la digitalización de los servicios, ofreciendo plataformas en línea que faciliten la gestión de cuentas y transacciones.
- Mejorar la experiencia del cliente, personalizando los servicios para satisfacer sus necesidades específicas.
- Fortalecer la sostenibilidad financiera, implementando prácticas que aseguren la estabilidad y crecimiento del banco.
  1. ## <a name="_heading=h.l57bvfgp33mm"></a>Objetivos de Diseño
- Desarrollar interfaces de usuario intuitivas, que faciliten la navegación y uso de las plataformas digitales del banco.
- Implementar sistemas de seguridad avanzados, que protejan la información y transacciones de los clientes.
- Integrar tecnologías emergentes, como inteligencia artificial y análisis de datos, para ofrecer servicios personalizados y eficientes.
- Garantizar la accesibilidad, asegurando que los servicios sean utilizables por personas con diversas capacidades y en diferentes contextos.



1. ## <a name="_heading=h.jg0glgag3ig4"></a>Alcance del Proyecto
   El proyecto abarca la creación y mejora de plataformas digitales que permitan a los clientes realizar operaciones bancarias de manera remota, segura y eficiente. Esto incluye el desarrollo de aplicaciones móviles y web, la implementación de sistemas de atención al cliente en línea y la integración de servicios financieros digitales que respondan a las necesidades actuales del mercado.

1. ## <a name="_heading=h.ncrk7bfo05qo"></a>Viabilidad del Sistema
   **Técnica**: Se utilizarán tecnologías modernas y escalables que aseguren el rendimiento y la seguridad de las plataformas digitales.

   **Económica**: El proyecto se financiará mediante una combinación de recursos internos y externos, con un enfoque en la rentabilidad a largo plazo.

   **Regulatoria**: Se cumplirá con todas las normativas y regulaciones vigentes en el sector financiero, garantizando la transparencia y legalidad de las operaciones.

1. ## <a name="_heading=h.hfgszxp71nhh"></a>Información obtenida del Levantamiento de Información

1. # <a name="_heading=h.t8p89hxyife5"></a>Análisis de Procesos
   1. ## <a name="_heading=h.uou7qh3rlt4m"></a>Diagrama del Proceso Actual – Diagrama de Actividades

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.002.png)
1. ## <a name="_heading=h.juc9i9qan9u7"></a>Diagrama del Proceso Propuesto – Diagrama de Actividades Inicial


1. # <a name="_heading=h.9630cn1jymfa"></a>Especificación de Requerimientos de Software
   1. ## <a name="_heading=h.3w2kxivyxur9"></a>Cuadro de Requerimientos Funcionales Inicial
|RF|Requerimiento|Descripción|
| :- | :- | :- |
|RF01 |Registrar usuario	|Registro de usuarios con email y contraseña.	|
|RF02|Iniciar sesión	|Inicio de sesión con validación de credenciales y autenticación de usuario.|
|RF03 |Recuperar contraseña|Recuperación de contraseña mediante enlace de recuperación.|
|RF04 |Gestionar perfil|Gestión de perfil de usuario (editar, ver información).|
|RF05 |Registrar ingresos|Registro de ingresos (monto, categoría, fecha, descripción).|
|RF06 |Registrar egresos	|Registro de egresos (monto, categoría, fecha, descripción, ubicación opcional).|
|RF07 |Editar transacciones	|Edición de transacciones registradas.|
|RF08 |Crear categorías|Creación de categorías personalizables para ingresos y egresos.|
|RF09 |Generar gráficos de gastos|Generación de gráficos de gastos por categoría (barras, pastel).|
|RF10 |Visualizar histórico financiero|Visualización de histórico mensual/anual de ingresos y egresos.|
|RF11 |Comparar gastos	|Comparación de gastos entre diferentes periodos.|
|RF12 |Generar balance general	|Generación de balance general (ingresos vs egresos).|
|RF13|Clasificar gastos desde imagen|El sistema escanea fotos de boletas y extrae montos, y los categoriza automáticamente.|
|RF14|Clasificar gastos desde audio|El sistema convierte las grabaciones de voz a texto, identifica los datos clave del gasto mencionado y los clasifica en la categoría adecuada de forma automatizada.|
|RF15|Notificar gastos excesivos	|Alertar cuando los gastos superen un porcentaje de los ingresos.|
|RF16|Alertar sobre presupuesto	|Avisar cuando se alcance el límite presupuestado en una categoría.|
|RF17|Recomendar ahorros	|Sugerir pautas de ahorro según patrones de gasto del usuario.|
|RF18|Recordar pagos recurrentes	|Notificar sobre vencimientos de servicios o suscripciones.|
|RF19|Generar reportes en PDF	|<p>Crear informes financieros en formato PDF.</p><p></p>|
|RF20|Exportar datos	|Permitir la exportación de datos a formatos CSV o Excel.|

1. ## <a name="_heading=h.knyl8m7qpkn0"></a>Cuadro de Requerimientos No Funcionales
|RNF|Requerimiento|Descripción|
| :- | :- | :- |
|RNF01 |Rendimiento|El aplicativo debe responder rápidamente en todas las operaciones comunes (registrar transacciones, generar reportes, mostrar gráficos) sin demoras notables, con tiempos de carga no mayores a 2 segundos.	|
|RNF02|Seguridad|Los datos del usuario (como contraseñas y transacciones) deben estar protegidos mediante encriptación robusta (como AES-256) y protocolos de seguridad actualizados (como HTTPS y autenticación multifactor).|
|RNF03|Usabilidad	|La interfaz del aplicativo debe ser intuitiva y fácil de usar, permitiendo a los usuarios completar tareas como ingresar transacciones y visualizar reportes sin complicaciones. La navegación debe ser fluida tanto en dispositivos móviles como en escritorio.|
|RNF04|Escalabilidad|El aplicativo debe ser capaz de manejar un número creciente de usuarios y transacciones sin afectar su rendimiento. Se debe poder escalar en la base de datos y en el manejo de reportes sin comprometer la experiencia del usuario.|
|RNF05|Disponibilidad|El sistema debe estar disponible la mayor parte del tiempo, con un mínimo de 99.5% de tiempo de funcionamiento sin interrupciones significativas.|
|RNF06|Mantenimiento|El aplicativo debe permitir actualizaciones y mejoras continuas sin que los usuarios experimenten interrupciones significativas. La implementación de nuevas funcionalidades no debe requerir reescritura del código base.|
|RNF07|Notificaciones|El aplicativo debe permitir la configuración de notificaciones push para alertas personalizadas (gastos excesivos, presupuesto, pagos recurrentes) que se envíen en tiempo real, asegurando que el usuario esté siempre al tanto de sus finanzas.|

1. ## <a name="_heading=h.ceiefm8h27jj"></a>Cuadro de Requerimientos Funcionales Final
|RF|Requerimiento|Descripción|
| :- | :- | :- |
|RF01 |Registrar usuario	|Registro de usuarios con email y contraseña.	|
|RF02|Iniciar sesión	|Inicio de sesión con validación de credenciales y autenticación de usuario.|
|RF03 |Recuperar contraseña|Recuperación de contraseña mediante enlace de recuperación.|
|RF04 |Gestionar perfil|Gestión de perfil de usuario (editar, ver información).|
|RF05 |Registrar ingresos|Registro de ingresos (monto, categoría, fecha, descripción).|
|RF06 |Registrar egresos	|Registro de egresos (monto, categoría, fecha, descripción, ubicación opcional).|
|RF07 |Editar transacciones	|Edición de transacciones registradas.|
|RF08 |Crear categorías|Creación de categorías personalizables para ingresos y egresos.|
|RF09 |Generar gráficos de gastos|Generación de gráficos de gastos por categoría (barras, pastel).|
|RF10 |Visualizar histórico financiero|Visualización de histórico mensual/anual de ingresos y egresos.|
|RF11 |Comparar gastos	|Comparación de gastos entre diferentes periodos.|
|RF12 |Generar balance general	|Generación de balance general (ingresos vs egresos).|
|RF13|Clasificar gastos desde imagen|El sistema escanea fotos de boletas y extrae montos, y los categoriza automáticamente.|
|RF14|Clasificar gastos desde audio|El sistema convierte las grabaciones de voz a texto, identifica los datos clave del gasto mencionado y los clasifica en la categoría adecuada de forma automatizada.|
|RF15|Notificar gastos excesivos	|Alertar cuando los gastos superen un porcentaje de los ingresos.|
|RF16|Alertar sobre presupuesto	|Avisar cuando se alcance el límite presupuestado en una categoría.|
|RF17|Recomendar ahorros	|Sugerir pautas de ahorro según patrones de gasto del usuario.|
|RF18|Recordar pagos recurrentes	|Notificar sobre vencimientos de servicios o suscripciones.|
|RF19|Generar reportes en PDF	|<p>Crear informes financieros en formato PDF.</p><p></p>|
|RF20|Exportar datos	|Permitir la exportación de datos a formatos CSV o Excel.|
|RNF01 |Rendimiento|El aplicativo debe responder rápidamente en todas las operaciones comunes (registrar transacciones, generar reportes, mostrar gráficos) sin demoras notables, con tiempos de carga no mayores a 2 segundos.	|
|RNF02|Seguridad|Los datos del usuario (como contraseñas y transacciones) deben estar protegidos mediante encriptación robusta (como AES-256) y protocolos de seguridad actualizados (como HTTPS y autenticación multifactor).|
|RNF03|Usabilidad	|La interfaz del aplicativo debe ser intuitiva y fácil de usar, permitiendo a los usuarios completar tareas como ingresar transacciones y visualizar reportes sin complicaciones. La navegación debe ser fluida tanto en dispositivos móviles como en escritorio.|
|RNF04|Escalabilidad|El aplicativo debe ser capaz de manejar un número creciente de usuarios y transacciones sin afectar su rendimiento. Se debe poder escalar en la base de datos y en el manejo de reportes sin comprometer la experiencia del usuario.|
|RNF05|Disponibilidad|El sistema debe estar disponible la mayor parte del tiempo, con un mínimo de 99.5% de tiempo de funcionamiento sin interrupciones significativas.|
|RNF06|Mantenimiento|El aplicativo debe permitir actualizaciones y mejoras continuas sin que los usuarios experimenten interrupciones significativas. La implementación de nuevas funcionalidades no debe requerir reescritura del código base.|
|RNF07|Notificaciones|El aplicativo debe permitir la configuración de notificaciones push para alertas personalizadas (gastos excesivos, presupuesto, pagos recurrentes) que se envíen en tiempo real, asegurando que el usuario esté siempre al tanto de sus finanzas.|

1. ## <a name="_heading=h.j2u9vp8vb2bb"></a>Reglas de Negocio
   Validación de Usuario

   Un usuario no puede acceder al sistema sin registrarse previamente con un correo electrónico válido y una contraseña segura.

   Categorías Personalizadas

   El usuario puede crear y personalizar categorías para clasificar sus transacciones (ingresos y egresos), pero no podrá eliminar las categorías predeterminadas.

   Límites de Presupuesto

   Los usuarios podrán establecer presupuestos mensuales para cada categoría, pero el total de los presupuestos no puede exceder el 100% de los ingresos mensuales registrados.

   Registro de Transacciones

   Una transacción debe incluir un monto, una categoría, una fecha y una descripción. Las transacciones no pueden ser registradas con valores negativos (a menos que se trate de un "ingreso negativo" o devolución).

   Validación de Ingresos y Egresos

   Los ingresos y egresos no pueden ser registrados con valores nulos o sin una categoría asociada.

   Historial de Transacciones

   El sistema debe permitir consultar las transacciones pasadas en un rango de fechas específico (mensual, anual, etc.).

   Comparación de Periodos

   Los usuarios pueden comparar sus gastos en diferentes periodos (por ejemplo, este mes vs. el mes pasado), pero solo podrán hacerlo dentro del mismo año.

   Generación de Reportes

   Los usuarios podrán generar reportes financieros personalizados, pero solo se incluirán transacciones que hayan sido validadas y no estén marcadas como "pendientes" o "erróneas".

   Notificación de Gastos Excesivos

   Si un usuario excede un porcentaje configurado de su presupuesto, se enviará una notificación de alerta. El porcentaje debe estar entre el 5% y el 50% según la configuración del usuario.

   Recomendaciones de Ahorro

   El sistema debe sugerir opciones de ahorro personalizadas basadas en los hábitos de gastos, considerando un umbral mínimo de ahorro recomendado que no afecte negativamente los gastos esenciales del usuario.

   Presupuesto por Categoría

   Los presupuestos establecidos para cada categoría no pueden ser inferiores a un valor mínimo predeterminado para asegurar que las necesidades básicas (alimentación, transporte, etc.) sean cubiertas.

   Pagos Recurrentes

   Los usuarios podrán configurar pagos recurrentes (por ejemplo, alquiler o suscripciones), y el sistema debe notificarles con una antelación mínima de 5 días antes de la fecha de vencimiento.

   Exportación de Datos

   Los usuarios pueden exportar sus datos financieros en formatos como CSV o Excel, pero los reportes exportados solo incluirán transacciones aprobadas.


1. # <a name="_heading=h.olqlt4rbjbs0"></a>Fase de Desarrollo
   1. ## <a name="_heading=h.jxxt7i93qtt"></a>Perfiles de Usuario
      El perfil de usuario de la aplicación está compuesto principalmente por individuos interesados en gestionar sus finanzas personales de manera eficiente. Estos usuarios pueden ser jóvenes, adultos o freelancers que buscan llevar un control de sus ingresos, egresos y presupuestos mensuales. La aplicación está diseñada para ser intuitiva y fácil de usar, permitiendo a los usuarios registrar transacciones, establecer límites de presupuesto, generar reportes financieros y recibir notificaciones sobre gastos excesivos o pagos recurrentes. Además, los usuarios valoran la seguridad de sus datos, por lo que la aplicación ofrece medidas de protección robustas, como la encriptación y autenticación multifactor.
   1. ## <a name="_heading=h.cefe7l136404"></a>Modelo Conceptual
      ### <a name="_heading=h.c0ocx0tdywye"></a>5.2.1 Diagrama de Paquetes

### <a name="_heading=h.8igw5sr3ist0"></a>5.2.2 Diagrama de Casos de Uso

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.003.png)
### <a name="_heading=h.3c7vri2ina2g"></a>5.2.3 Escenarios de Caso de Uso (Narrativa)

|**Caso de uso**|CU-01|
| :- | :- |
|**Actores**|Cliente|
|**Propósito**|Permitir que un nuevo cliente cree una cuenta en el sistema|
|**Tipo**|Principal|
|**Descripción**|El cliente ingresa al sistema proporcionando su información básica para crear una cuenta y poder utilizar los servicios bancarios.|
|**Precondición**|<p>El cliente no debe tener una cuenta existente en el sistema.</p><p>El cliente debe tener acceso a internet.</p>|
|**Curso normal de eventos**||
|**Acciones de actores**|**Acciones de página web**|
|1. El cliente selecciona la opción "Registrar".|2. El sistema muestra el formulario de registro.|
|3. El cliente ingresa su nombre, correo electrónico, número de teléfono y crea una contraseña.|4. El sistema valida que los campos no estén vacíos.|
|5. El cliente acepta los términos y condiciones.|6. El sistema muestra un mensaje de confirmación.|
|7. El cliente envía el formulario.|8. El sistema valida la información y crea la cuenta.|

### <a name="_heading=h.b4rviqdu060f"></a>**🔁 Flujo normal de eventos**

|**Paso**|**Acción del actor**|**Respuesta del sistema**|
| :-: | :-: | :-: |
|1|El cliente selecciona la opción "Registrar".|El sistema muestra el formulario de registro.|
|2|El cliente ingresa su nombre, correo electrónico, número de teléfono y crea una contraseña.|El sistema valida que los campos no estén vacíos.|
|3|El cliente acepta los términos y condiciones.|El sistema muestra un mensaje de confirmación.|
|4|El cliente envía el formulario.|El sistema valida la información y crea la cuenta.|
|5|El sistema envía un correo electrónico de confirmación al cliente.|El cliente recibe el correo electrónico.|
### <a name="_heading=h.q3qqnot1w072"></a>**⚠️**


|**Caso de uso**|Registrar|
| :- | :- |
|**Actores**|Cliente|
|**Propósito**|Permitir que un cliente se registre en el sistema creando una cuenta.|
|**Tipo**|Principal|
|**Descripción**|El cliente puede crear una cuenta proporcionando la información requerida para poder utilizar el sistema.|
|**Precondición**|El cliente no debe tener una cuenta existente.|
|**Curso normal de eventos**||
|**Acciones de actores**|**Acciones de página web**|
|**1. El cliente selecciona la opción "Registrar".**|**2. El sistema muestra un formulario de registro con campos como nombre, correo electrónico, y contraseña.**|


|**Caso de uso**|Registrar|
| :- | :- |
|**Actores**|Cliente|
|**Propósito**|Permitir que un cliente se registre en el sistema creando una cuenta.|
|**Tipo**|Principal|
|**Descripción**|El cliente puede crear una cuenta proporcionando la información requerida para poder utilizar el sistema.|
|**Precondición**|El cliente no debe tener una cuenta existente.|
|**Curso normal de eventos**||
|**Acciones de actores**|**Acciones de página web**|
|**1. El cliente selecciona la opción "Registrar".**|**2. El sistema muestra un formulario de registro con campos como nombre, correo electrónico, y contraseña.**|


|**Caso de uso**|Registrar|
| :- | :- |
|**Actores**|Cliente|
|**Propósito**|Permitir que un cliente se registre en el sistema creando una cuenta.|
|**Tipo**|Principal|
|**Descripción**|El cliente puede crear una cuenta proporcionando la información requerida para poder utilizar el sistema.|
|**Precondición**|El cliente no debe tener una cuenta existente.|
|**Curso normal de eventos**||
|**Acciones de actores**|**Acciones de página web**|
|**1. El cliente selecciona la opción "Registrar".**|**2. El sistema muestra un formulario de registro con campos como nombre, correo electrónico, y contraseña.**|


|**Caso de uso**|Registrar|
| :- | :- |
|**Actores**|Cliente|
|**Propósito**|Permitir que un cliente se registre en el sistema creando una cuenta.|
|**Tipo**|Principal|
|**Descripción**|El cliente puede crear una cuenta proporcionando la información requerida para poder utilizar el sistema.|
|**Precondición**|El cliente no debe tener una cuenta existente.|
|**Curso normal de eventos**||
|**Acciones de actores**|**Acciones de página web**|
|**1. El cliente selecciona la opción "Registrar".**|**2. El sistema muestra un formulario de registro con campos como nombre, correo electrónico, y contraseña.**|


|**Caso de uso**|Registrar|
| :- | :- |
|**Actores**|Cliente|
|**Propósito**|Permitir que un cliente se registre en el sistema creando una cuenta.|
|**Tipo**|Principal|
|**Descripción**|El cliente puede crear una cuenta proporcionando la información requerida para poder utilizar el sistema.|
|**Precondición**|El cliente no debe tener una cuenta existente.|
|**Curso normal de eventos**||
|**Acciones de actores**|**Acciones de página web**|
|**1. El cliente selecciona la opción "Registrar".**|**2. El sistema muestra un formulario de registro con campos como nombre, correo electrónico, y contraseña.**|


|**Caso de uso**|Registrar|
| :- | :- |
|**Actores**|Cliente|
|**Propósito**|Permitir que un cliente se registre en el sistema creando una cuenta.|
|**Tipo**|Principal|
|**Descripción**|El cliente puede crear una cuenta proporcionando la información requerida para poder utilizar el sistema.|
|**Precondición**|El cliente no debe tener una cuenta existente.|
|**Curso normal de eventos**||
|**Acciones de actores**|**Acciones de página web**|
|**1. El cliente selecciona la opción "Registrar".**|**2. El sistema muestra un formulario de registro con campos como nombre, correo electrónico, y contraseña.**|


|**Caso de uso**|Registrar|
| :- | :- |
|**Actores**|Cliente|
|**Propósito**|Permitir que un cliente se registre en el sistema creando una cuenta.|
|**Tipo**|Principal|
|**Descripción**|El cliente puede crear una cuenta proporcionando la información requerida para poder utilizar el sistema.|
|**Precondición**|El cliente no debe tener una cuenta existente.|
|**Curso normal de eventos**||
|**Acciones de actores**|**Acciones de página web**|
|**1. El cliente selecciona la opción "Registrar".**|**2. El sistema muestra un formulario de registro con campos como nombre, correo electrónico, y contraseña.**|


|**Caso de uso**|Registrar|
| :- | :- |
|**Actores**|Cliente|
|**Propósito**|Permitir que un cliente se registre en el sistema creando una cuenta.|
|**Tipo**|Principal|
|**Descripción**|El cliente puede crear una cuenta proporcionando la información requerida para poder utilizar el sistema.|
|**Precondición**|El cliente no debe tener una cuenta existente.|
|**Curso normal de eventos**||
|**Acciones de actores**|**Acciones de página web**|
|**1. El cliente selecciona la opción "Registrar".**|**2. El sistema muestra un formulario de registro con campos como nombre, correo electrónico, y contraseña.**|


|**Caso de uso**|Registrar|
| :- | :- |
|**Actores**|Cliente|
|**Propósito**|Permitir que un cliente se registre en el sistema creando una cuenta.|
|**Tipo**|Principal|
|**Descripción**|El cliente puede crear una cuenta proporcionando la información requerida para poder utilizar el sistema.|
|**Precondición**|El cliente no debe tener una cuenta existente.|
|**Curso normal de eventos**||
|**Acciones de actores**|**Acciones de página web**|
|**1. El cliente selecciona la opción "Registrar".**|**2. El sistema muestra un formulario de registro con campos como nombre, correo electrónico, y contraseña.**|



1. ## <a name="_heading=h.e4p5a8yvx0p"></a>Modelo Lógico
   ### <a name="_heading=h.o6p9xmo1br0k"></a>5.3.1 Análisis de Objetos














### <a name="_heading=h.1mwyg0g67n3y"></a>5.3.2 Diagrama de Actividades con Objetos
Diagrama de actividad General

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.004.png)
###
### <a name="_heading=h.4vmo5u56of8n"></a><a name="_heading=h.7aslsgvjnyny"></a>**1. Caso de uso: Registrar usuario**
![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.005.png)











### <a name="_heading=h.q8cz2pceapu7"></a>**2. Caso de uso: Iniciar sesión**
![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.006.png)

### <a name="_heading=h.w1hf5lyj65u7"></a>**3. Caso de uso: Recuperar contraseña**
![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.007.png)

### <a name="_heading=h.xln8d3beihw2"></a>**4. Caso de uso: Registrar ingresos**
![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.008.png)

### <a name="_heading=h.32vxvxviy9yn"></a>**5. Caso de uso: Registrar egresos**
![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.009.png)



### <a name="_heading=h.jqpls0qluysc"></a>**6. Caso de uso: Registrar con cámara**
![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.010.png)
### <a name="_heading=h.7lv75oamnygi"></a>**7. Caso de uso: Editar transacciones**
![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.011.png)

### <a name="_heading=h.47z5mxyportt"></a>**8. Caso de uso: Visualizar histórico financiero**
![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.012.png)

### <a name="_heading=h.kr4q6ie7k8ci"></a>**9. Caso de uso: Generar gráficos de ingresos/gastos**
![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.013.png)

### <a name="_heading=h.wc4hy9agxkzx"></a>**10. Caso de uso: Ver balance general**
![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.014.png)
### <a name="_heading=h.z63ene7kf45u"></a>5.3.3 Diagrama de Secuencia
Diagrama de Secuencia General

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.015.png)

**1. Diagrama de Secuencia: Registrar usuario**

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.016.png)

**2. Diagrama de Secuencia: Iniciar sesión**

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.017.png)

**3. Diagrama de Secuencia: Recuperar contraseña**

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.018.png)

**4. Diagrama de Secuencia: Registrar ingresos**

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.019.png)

**5. Diagrama de Secuencia: Registrar egresos**

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.020.png)

**6. Diagrama de Secuencia: Registrar con cámara**

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.021.png)

**7. Diagrama de Secuencia: Editar transacciones**

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.022.png)

**8. Diagrama de Secuencia: Visualizar histórico financiero**

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.023.png)

**9. Diagrama de Secuencia: Generar gráficos de ingresos/gastos**

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.024.png)

**10. Diagrama de Secuencia: Ver balance general**

![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.025.png)





### <a name="_heading=h.ikfrxib9mw0d"></a>5.3.4 Diagrama de Clases
`		`![](/media/Aspose.Words.9a6cf5f6-10c6-480f-8a05-2857773d863d.026.png)

# <a name="_heading=h.5ejs9u6stk5o"></a>CONCLUSIONES
# <a name="_heading=h.5rydli3yr902"></a>RECOMENDACIONES
# <a name="_heading=h.yxf44mscz88v"></a>BIBLIOGRAFÍA





