# 프로토콜 버퍼 컴파일 관련 변수
PROTOC=protoc
PROTOC_GEN_GO=$(GOBIN)/protoc-gen-go
PROTOC_GEN_GO_GRPC=$(GOBIN)/protoc-gen-go-grpc
USER_DIR=./proto/v1/user
USER_FILES=$(wildcard $(USER_DIR)/*.proto)
USER_OUT=./proto/v1/user
USER_GRPC_OUT=./proto/v1/user

ITEM_DIR=./proto/v1/item
ITEM_FILES=$(wildcard $(ITEM_DIR)/*.proto)
ITEM_OUT=./proto/v1/item
ITEM_GRPC_OUT=./proto/v1/item

LOCATION_DIR=./proto/v1/location
LOCATION_FILES=$(wildcard $(LOCATION_DIR)/*.proto)
LOCATION_OUT=./proto/v1/location
LOCATION_GRPC_OUT=./proto/v1/location

IMAGE_DIR=./proto/v1/image
IMAGE_FILES=$(wildcard $(IMAGE_DIR)/*.proto)
IMAGE_OUT=./proto/v1/image
IMAGE_GRPC_OUT=./proto/v1/image

# 프로토콜 버퍼 컴파일 타겟
user: proto/v1/user/*.proto
	$(PROTOC) -I $(USER_DIR) \
		--go_out=$(USER_OUT) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(USER_GRPC_OUT) \
		--go-grpc_opt=paths=source_relative \
		$(USER_FILES)

item: proto/v1/item/*.proto
	$(PROTOC) -I $(ITEM_DIR) \
		--go_out=$(ITEM_OUT) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(ITEM_GRPC_OUT) \
		--go-grpc_opt=paths=source_relative \
		$(ITEM_FILES)

location: proto/v1/location/*.proto
	$(PROTOC) -I $(LOCATION_DIR) \
		--go_out=$(LOCATION_OUT) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(LOCATION_GRPC_OUT) \
		--go-grpc_opt=paths=source_relative \
		$(LOCATION_FILES)

image: proto/v1/image/*.proto
	$(PROTOC) -I $(IMAGE_DIR) \
		--go_out=$(IMAGE_OUT) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(IMAGE_GRPC_OUT) \
		--go-grpc_opt=paths=source_relative \
		$(IMAGE_FILES)