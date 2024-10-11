FROM golang:1.21

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main main.go

# Expose port to the outside world
EXPOSE 8282

# Command to run the executable
CMD ["/app/main"]