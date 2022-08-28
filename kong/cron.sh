#!/usr/bin/env sh

set +e

if [ -z ${LOG_CHECK_CRON_SCHEDULE+x} ]; then
  /usr/local/bin/checklog
else
  BACKUP_CRON_SCHEDULE=${LOG_CHECK_CRON_SCHEDULE}
  echo "${LOG_CHECK_CRON_SCHEDULE} /usr/local/bin/checklog" > /etc/crontabs/root
  # Starting cron
  crond -f -d 0
fi

exec "$@"