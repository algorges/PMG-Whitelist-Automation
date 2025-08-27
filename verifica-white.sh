cat /var/log/mail.log | grep "status=sent (250 2.6.0" | grep -o "to=<.*.>," | grep -o '@[^:]*' | cut -d '<' -f 2 | cut -d '>' -f 1 | sort -u > /down/tmp
cat /var/log/mail.log | grep "status=sent (250 2.0.0" | grep -o "to=<.*.>," | grep -o '@[^:]*' | cut -d '<' -f 2 | cut -d '>' -f 1 | sort -u >> /down/tmp

tr '[:upper:]' '[:lower:]' < /down/tmp > /down/tmp2
cat /down/tmp2 |uniq|sort -u|egrep -v "hotmail|yahoo|outlook|gmail|live|gmx|terra|uol|bol|icloud|me.com|zipmail.com.br|.mil.br|.def.br|.mp.br|.tc.br|.gov.br|.leg.br|.jus.br|emktlw-|smtplw-|lists.|bounce." > /down/lista
cat /down/lista |tr -d '@' >> /down/lista1
mv /down/lista1 /down/lista

pmgsh get /config/ruledb/who/3/objects|grep domain|awk {'print $3'}|sort -u > /down/lista-atual
cat /down/lista-atual | tr -d '",' >> /down/lista-atual-tmp
mv /down/lista-atual-tmp /down/lista-atual

comm -23 /down/lista /down/lista-atual > /down/t1
mv /down/t1 /down/lista-novos

