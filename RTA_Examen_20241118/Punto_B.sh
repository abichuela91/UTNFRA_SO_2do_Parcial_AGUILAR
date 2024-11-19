#!/bin/bash
echo "inicia la creacion de usuarios y grupos"
#!/bin/bash

echo "se prueba que los parametros se  cumplen y que el usuario del parametro 1 existe"
[ "$#" -ne 2 ] && { echo "Uso: \$0 <usuario_origen> <ruta_repo>/202406/bash_script/Lista_Usuarios.txt"; exit 1; }

USER_ORIGEN=\$1
LISTA_USUARIOS=\$2
echo "se obtiene la contrase√a del usiario"
PASSWORD=$(getent shadow "$USER_ORIGEN" | cut -d: -f2)

echo "se crea los usuarios y grupos"
cat "$LISTA_USUARIOS" | xargs -n 2 sh -c '
    groupadd "\$1" 2>/dev/null
    useradd -m -g "\$1" -p "$PASSWORD" "\$0" 2>/dev/null' _

echo "Proceso de creaci√≥n de usuarios y grupos finalizad"
