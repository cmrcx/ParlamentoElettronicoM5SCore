#!/bin/bash
# calls ls_update, lf_update_suggestion_order and lf_notification once, for development purposes
# has to be executed as apache/www-data

# read configuration
path=$( dirname $( readlink -f $( dirname $0 ) ) )
source $path/ParlamentoElettronicoM5SCore/config

# lf_update
$path/ParlamentoElettronicoM5SCore/lf_update dbname=$dbname

# lf_update_suggestion_order
$path/ParlamentoElettronicoM5SCore/lf_update_suggestion_order dbname=$dbname

# lf_notification
(
  cd $path/ParlamentoElettronicoM5S/
  echo "Event:send_notifications()" | ../webmcp/bin/webmcp_shell myconfig
)