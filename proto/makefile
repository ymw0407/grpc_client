# 프로토콜 버퍼 컴파일 관련 변수
PROTOC=protoc
PROTOC_GEN_GO=$(GOBIN)/protoc-gen-go
PROTOC_GEN_GO_GRPC=$(GOBIN)/protoc-gen-go-grpc

REMOTE_DIR=./remote
REMOTE_FILES=$(wildcard $(REMOTE_DIR)/*.proto)
REMOTE_OUT=./
REMOTE_GRPC_OUT=./

proto: remote/*.proto
	$(PROTOC) -I $(REMOTE_DIR) \
		--go_out=$(REMOTE_OUT) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(REMOTE_GRPC_OUT) \
		--go-grpc_opt=paths=source_relative \
		$(REMOTE_FILES)

submodule:
	git submodule update --init --recursive

update:
	git submodule update --remote remote
