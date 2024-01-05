package main

import (
	"context"
	"io"
	"os"

	"google.golang.org/grpc"
	"google.golang.org/protobuf/types/known/wrapperspb"

	pb "test/proto"
)

func load(path string) ([]byte, error) {
	file, e := os.Open(path)
	if e != nil {
		return nil, e
	}
	defer file.Close()

	done := make([]byte, 0)
	buf := make([]byte, 2048)
	for {
		_, e := file.Read(buf)
		if e == io.EOF {
			break
		}
		if e != nil {
			return nil, e
		}
		done = append(done, buf...)
	}
	return done, nil
}

func main() {
	conn, e := grpc.Dial("127.0.0.1:8080", grpc.WithInsecure())
	if e != nil {
		return
	}
	defer conn.Close()

	// gRPC 클라이언트 접속
	c := pb.NewUserServiceClient(conn)
	sp, e := load("image.png")
	if e != nil {
		println(e.Error())
	}
	res, e := c.UpdateProfile(context.TODO(), &pb.UpdateProfileRequest{
		Uid:  "6596588ed8de6590c8ee902f",
		Name: wrapperspb.String("윤민우"),
		Chip: &pb.Chip{
			SchoolName:    "국민대",
			Grade:         "2학년",
			InstaAccount:  "ymw0407",
			TiktokAccount: "",
			Mbti:          "INFJ",
			Others:        []string{"test1", "test2"},
		},
		ProfileImg:  sp,
		Description: wrapperspb.String("test Description"),
	})
	if e != nil {
		println(e.Error())
	}
	println(res.Status.Success, res.Status.ErrCode)
}
