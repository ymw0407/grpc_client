# 프로토콜 버퍼 컴파일 관련 변수
PROTOC=protoc
PROTOC_GEN_GO=$(GOBIN)/protoc-gen-go
PROTOC_GEN_GO_GRPC=$(GOBIN)/protoc-gen-go-grpc
USER_DIR=./proto/v1/user
USER_FILES=$(wildcard $(USER_DIR)/*.proto)
USER_OUT=./proto/v1/user
USER_GRPC_OUT=./proto/v1/user

# 프로토콜 버퍼 컴파일 타겟
user: proto/v1/user/*.proto
	$(PROTOC) -I $(USER_DIR) \
		--go_out=$(USER_OUT) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(USER_GRPC_OUT) \
		--go-grpc_opt=paths=source_relative \
		$(USER_FILES)
