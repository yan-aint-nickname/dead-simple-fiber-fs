package main

import (
	"fmt"
	"log"
	"os"

	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()

	app.Post("file/", func(c *fiber.Ctx) error {
		file, err := c.FormFile("image")
		if err != nil {
			return err
		}
		path := fmt.Sprintf("/files/%s", file.Filename)
		if err := c.SaveFile(file, path); err != nil {
			return err
		}
		return nil
	})

	app.Delete("file/:path", func(c *fiber.Ctx) error {
		path := c.Params("path")
		fullPath := fmt.Sprintf("/files/%s", path)
		if err := os.Remove(fullPath); err != nil {
			return err
		}
		return nil
	})

	log.Fatal(app.Listen(":3000"))
}