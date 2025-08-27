#!/bin/bash
for i in `cat /down/lista-novos`
do
	pmgsh create /config/ruledb/who/3/domain --domain $i
done

# pmgsh get /config/ruledb/who para ver o id do grupo
