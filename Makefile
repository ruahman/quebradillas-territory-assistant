.PHONEY: up
up:
	@echo "Docker Compose Up"
	docker compose up -d 

.PHONEY: start 
start:
	@echo "Docker Compose Start"
	docker compose start

.PHONEY: golang
golang:
	@echo "Golang Shell"
	docker compose exec golang bash

.PHONEY: bun
bun:
	@echo "Bun Shell"
	docker compose exec bun bash

.PHONEY: psql
psql:
	@echo "Postgres psql"
	docker compose exec postgres psql -U postgres

.PHONEY: postgres
postgres:
	@echo "Postgres shell"
	docker compose exec postgres bash

.PHONEY: down
down:
	@echo "Docker Compose Down"
	docker compose down --volumes

.PHONEY: stop 
stop:
	@echo "Docker Compose Stop"
	docker compose stop

.PHONEY: run 
run:
	@echo "...Run JW"
	go run main.go $(cmd)

.TEST: test 
test:
ifdef r
	@echo "...Testing $(p) $(r)"
	go test -v $(p) -run $(r)
else
	@echo "...Testing $(p)"
	go test -v $(p)
endif

.PHONEY: check
check:
	@echo "...Check"
	go build -o /dev/null .

.PHONEY: clean
clean:
	@echo "...Clean"
	go clean 


