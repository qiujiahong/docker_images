##  mysql连接参数
MYSQL_IP=${MYSQL_IP:-127.0.0.1}
MYSQL_PORT=${MYSQL_PORT:-3306}
MYSQL_USERNAME=${MYSQL_USERNAME:-root}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-123456}
MYSQL_DATABASE=${MYSQL_DATABASE:-urpcs}
PASSWORD_HASH=${PASSWORD_HASH:-sha256}
ACCEPTORS=${ACCEPTORS:-64}
MAX_CONNECTIONS=${MAX_CONNECTIONS:-1000000}
USERNAME=${USERNAME:-admin}
PASSWORD=${PASSWORD:-fangle}

cd /opt/emqx/

sed -i "s/^allow_anonymous.*/allow_anonymous = false/g" /opt/emqx/etc/emqx.conf

sed -i "s/^listener.tcp.external.acceptors.*/listener.tcp.external.acceptors = ${ACCEPTORS}/g" /opt/emqx/etc/emqx.conf

sed -i "s/^listener.tcp.external.max_connections.*/listener.tcp.external.max_connections = ${MAX_CONNECTIONS}/g" /opt/emqx/etc/emqx.conf

sed -i "s/^auth.mysql.server.*/auth.mysql.server = ${MYSQL_IP}:${MYSQL_PORT}/g" /opt/emqx/etc/plugins/emqx_auth_mysql.conf

sed -i "s/## auth.mysql.username.*/auth.mysql.username = ${MYSQL_USERNAME}/g" /opt/emqx/etc/plugins/emqx_auth_mysql.conf

sed -i "s/## auth.mysql.password =/auth.mysql.password = ${MYSQL_PASSWORD}/g" /opt/emqx/etc/plugins/emqx_auth_mysql.conf

sed -i "s/^auth.mysql.database.*/auth.mysql.database = ${MYSQL_DATABASE}/g" /opt/emqx/etc/plugins/emqx_auth_mysql.conf

sed -i "s/^auth.mysql.password_hash.*/auth.mysql.password_hash = ${PASSWORD_HASH}/g" /opt/emqx/etc/plugins/emqx_auth_mysql.conf

sed -i "s/^dashboard.default_user.login.*/dashboard.default_user.login = ${USERNAME}/g" /opt/emqx/etc/plugins/emqx_dashboard.conf

sed -i "s/^dashboard.default_user.password.*/dashboard.default_user.password = ${PASSWORD}/g" /opt/emqx/etc/plugins/emqx_dashboard.conf


./bin/emqx stop

./bin/emqx start

./bin/emqx_ctl plugins load emqx_auth_mysql

tail -f /dev/null
