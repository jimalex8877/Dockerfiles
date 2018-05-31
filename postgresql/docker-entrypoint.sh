#!/bin/bash
chown -R postgres:postgres /opt/postgres
chmod -R 0700 $PGDATA

if [ -z "$(ls -A "$PGDATA")" ]; then

	if [ "$MASTER_HOST" ]; then
		gosu postgres touch /var/lib/postgresql/.pgpass
		echo "*:$MASTER_PORT:*:$MASTER_REPLICA_USER:$MASTER_REPLICA_USER_PASS" >> /var/lib/postgresql/.pgpass
		gosu postgres chmod 0600 /var/lib/postgresql/.pgpass

		gosu postgres pg_basebackup -D $PGDATA -Fp -Xs -v -P -h $MASTER_HOST -p $MASTER_PORT -U "$MASTER_REPLICA_USER" -w;

		#=======================

		cp /usr/share/postgresql/10/postgresql.conf.sample $PGDATA/postgresql.conf
		cp /usr/share/postgresql/10/recovery.conf.sample $PGDATA/recovery.conf

		sed -i "s/#recovery_target_timeline = 'latest'/recovery_target_timeline = 'latest'/" "$PGDATA"/recovery.conf
		sed -i "s/#standby_mode = off/standby_mode = on/" "$PGDATA"/recovery.conf
		sed -i "s/#primary_conninfo = ''/primary_conninfo = 'host=$MASTER_HOST port=$MASTER_PORT user=$MASTER_REPLICA_USER password=$MASTER_REPLICA_USER_PASS'/" "$PGDATA"/recovery.conf
		sed -i "s|#trigger_file = ''|trigger_file = '$PGDATA/trigger_file'|" "$PGDATA"/recovery.conf
	else
		gosu postgres initdb
	fi

	#=======================

	sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$PGDATA"/postgresql.conf
	sed -i 's#run/postgresql#opt/postgres#g' "$PGDATA"/postgresql.conf

	if [ "$POSTGRES_PORT" ]; then
	  sed -i "s/#port = 5432/port = $POSTGRES_PORT/" "$PGDATA"/postgresql.conf
	  sed -ri "s/(port\s*=\s*)\S+/\1$POSTGRES_PORT/" "$PGDATA"/postgresql.conf
	fi

	sed -i "s/#wal_level = replica/wal_level = replica/" "$PGDATA"/postgresql.conf
	sed -i "s/#archive_mode = off/archive_mode = on/" "$PGDATA"/postgresql.conf
	sed -i "s|#archive_command = ''|archive_command = 'cd ./'|" "$PGDATA"/postgresql.conf
	sed -i "s/#hot_standby = on/hot_standby = on/" "$PGDATA"/postgresql.conf
	sed -i "s/#full_page_writes = on/full_page_writes = on/" "$PGDATA"/postgresql.conf
	sed -i "s/#wal_log_hints = off/wal_log_hints = on/" "$PGDATA"/postgresql.conf

	if [ "$WAL_KEEP_SEGMENTS" ]; then
		sed -i "s/#wal_keep_segments = 0/wal_keep_segments = $WAL_KEEP_SEGMENTS/" "$PGDATA"/postgresql.conf
		sed -ri "s/(wal_keep_segments\s*=\s*)\S+/\1$WAL_KEEP_SEGMENTS/" "$PGDATA"/postgresql.conf
	fi

	if [ "$MAX_WAL_SENDERS" ]; then
		sed -i "s/#max_wal_senders = 10/max_wal_senders = $MAX_WAL_SENDERS/" "$PGDATA"/postgresql.conf
		sed -ri "s/(max_wal_senders\s*=\s*)\S+/\1$MAX_WAL_SENDERS/" "$PGDATA"/postgresql.conf
	fi

	if [ "$MAX_CONNECTIONS" ]; then
		sed -i "s/#max_connections = 100/max_connections = $MAX_CONNECTIONS/" "$PGDATA"/postgresql.conf
		sed -ri "s/(max_connections\s*=\s*)\S+/\1$MAX_CONNECTIONS/" "$PGDATA"/postgresql.conf
	fi

	sed -i "s/#hot_standby_feedback = off/hot_standby_feedback = on/" "$PGDATA"/postgresql.conf

	#=======================

	{ echo; echo "host all         all 0.0.0.0/0 md5"; } >> "$PGDATA"/pg_hba.conf
	{ echo; echo "host replication all 0.0.0.0/0 password"; } >> "$PGDATA"/pg_hba.conf

	#=======================

	gosu postgres pg_ctl -D "$PGDATA" \
        -o "-c listen_addresses=''" \
        -w start

	## 修改postgres的密码
	if [ "$POSTGRES_PASS" ] && [ "$MASTER_HOST"x == ""x ]; then
		gosu postgres psql -U postgres -p $POSTGRES_PORT <<-EOSQL
			ALTER USER postgres WITH PASSWORD '${POSTGRES_PASS}';
		EOSQL
		echo
	fi

	if [ "$REPLICA_USER" ]; then
		gosu postgres psql -U postgres -p $POSTGRES_PORT <<-EOSQL
			CREATE ROLE $REPLICA_USER LOGIN REPLICATION ENCRYPTED PASSWORD '${REPLICA_USER_PASS}';
		EOSQL
		echo
	fi

	gosu postgres pg_ctl -D "$PGDATA" -m fast -w stop
fi

exec gosu postgres "$@"
