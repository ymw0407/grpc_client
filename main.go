package main

import (
	"context"
	"io"
	"os"

	"google.golang.org/grpc"

	pb "test/proto/v1/image"
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
    c := pb.NewImageServiceClient(conn)
	sp, e := load("image.jpg")
	if e != nil {
		println(e.Error())
	}
    res, e := c.ProfileImage(context.TODO(), &pb.ProfileImageRequest{
		Uid: "test2222",
		Image: sp,
	})
	if e != nil {
		println(e.Error())
	}
	println(res.Success)
    println(res.Msg)
	println(res.Url)
}
