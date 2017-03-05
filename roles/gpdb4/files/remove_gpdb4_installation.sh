#!/bin/bash

set +e
set -x

su - gpadmin -c "source /usr/local/greenplum-db/greenplum_path.sh && gpstop -a"
su - gpadmin -c "killall -9 postgres"
rm -rf /data
rm -rf /usr/local/greenplum-db*
rm -rf /home/gpadmin/gpdb4.zip /home/gpadmin/gpAdminLogs/ /home/gpadmin/gpinitsystem_singlenode /home/gpadmin/hostlist_singlenode /home/gpadmin/.gphostcache
rm -rf /tmp/.s.PGSQL.40* /tmp/.s.PGSQL.50* /tmp/.s.PGSQL.5432*
