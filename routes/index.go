package routes

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func Routes(route *gin.Engine) {
	route.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "health",
		})
	})
	route.GET("/test", Test)
}

func Test(c *gin.Context) {
	log.Print(123223)
	log.Print(123223333)
	c.JSON(
		200,
		223,
	)
}
