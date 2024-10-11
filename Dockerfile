FROM golang:1.18 as builder

# Set the Current Working Directory inside the container
WORKDIR /app

RUN go mod init main

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
RUN go build -o main main.go

# Expose port 8080 to the outside world
EXPOSE 6666

# Command to run the executable
ENTRYPOINT ["./main"]