#!/usr/bin/env fish

set YEAR (date +%Y)
if not [ $COMPANY_VARS_LAST_SET_YEAR = $YEAR ]
    echo "Setting company variables"
    set -Ux COMPANY_VARS_LAST_SET_YEAR $YEAR
    set -Ux COMPANY_EXPENSES_PATH "/home/gdquest/Dropbox/Files/"$YEAR"/company/2.frais"
    set -Ux COMPANY_EXPENSES_DIRNAME_PROFESSIONAL "1.pros"
    set -Ux COMPANY_EXPENSES_DIRNAME_PERSONAL "2.personnels"
    set -Ux COMPANY_EXPENSES_DIRNAME_SHARED "3.partagés"
end

alias focus "nmcli networking off"
alias losefocus "nmcli networking on"
