package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go-skaffold-gin/routes"
)

func main() {
	r := gin.Default()

	routes.Routes(r)
	err := r.Run(fmt.Sprintf(":%s", "8001"))
	if err != nil {
		return
	}
}
