#!/bin/bash
# POST this payload to http://localhost:8083/connectors

curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
    "name": "default",
    "config": {
        "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
        "topic.prefix": "default",
        "database.user": "postgres",
        "database.dbname": "etendo",
        "database.hostname": "db",
        "database.password": "syspass",
        "name": "default",
        "table.include.list": "public.pet_owner,public.pet_pet,public.pet_type,public.pet_visit",
        "plugin.name": "pgoutput",
        "key.converter": "org.apache.kafka.connect.json.JsonConverter",
        "key.converter.schemas.enable": "false",
        "value.converter": "org.apache.kafka.connect.json.JsonConverter",
        "value.converter.schemas.enable": "false"
    }
}'
