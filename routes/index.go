package routes

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Routes(route *gin.Engine) {
	route.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "health",
		})
	})
	route.GET("/test", Test)
}

type TestStruct struct {
	name string
	age  int
	note string
}

func (s *TestStruct) TestFn() string {
	return fmt.Sprintf("%s,%d,%s", s.name, s.age, s.note)
}

func test1(test *TestStruct) {
	log.Println(test.TestFn())
}
func Test(c *gin.Context) {
	test := &TestStruct{
		name: "jonny",
		age:  27,
	}
	test1(test)
	c.JSON(
		200,
		test,
	)
}
