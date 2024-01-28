postgres:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14-alpine
createdb:
	docker exec -it postgres14 createdb --username=root --owner=root simple_bank
droppedb:
	docer exec -it postgres14 droppedb simple_bank
migrateup:
	Migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	Migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down
sqlc:
	sqlc generate

.PHONY: postgres createdb droppedb migrateup migratedown sqlc