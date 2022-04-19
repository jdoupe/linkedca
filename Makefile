all: test generate

test:
	go test -race -coverpkg=./... -covermode=atomic ./... 

generate:
	protoc --proto_path=. --go_out=. --go-grpc_out=. --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative provisioners.proto admin.proto config.proto eab.proto majordomo.proto policy.proto

.PHONY: all test generate
