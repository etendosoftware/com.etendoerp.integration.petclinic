.PHONY: help up.db up.tomcat install setup.config insert setupconnector
# get env variables from .env

OSFLAG := $(shell uname -s)
ifeq ($(OSFLAG),Darwin)
   SED_ADD :=  ''
else
   SED_ADD := 
endif

help:
	@echo "insert: Insert data into the database"
	@echo "setupconnector: Setup the connector"
	@echo "set_wal: Set wal_level to logical"

set_wal:
	docker exec -it etendo-db-1 sh -c "psql -U postgres -d etendo -c 'ALTER SYSTEM SET wal_level to logical;'"
	docker restart etendo-db-1

setupconnector:
	docker cp scripts/setup-connector.sh etendo-connect-1:/tmp/setup-connector.sh
	# Execute the setup-connector.sh script
	docker exec -it etendo-connect-1 sh -c "sh /tmp/setup-connector.sh"

deleteconnector:
	docker cp scripts/delete-connector.sh etendo-connect-1:/tmp/delete-connector.sh
	# Execute the delete-connector.sh script
	docker exec -it etendo-connect-1 sh -c "sh /tmp/delete-connector.sh"


