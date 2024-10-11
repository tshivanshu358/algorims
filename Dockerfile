# Use an official Go runtime as a parent image
FROM golang:1.21-alpine

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o server .

# Expose port 8282 to the outside world
EXPOSE 8282

# Run the executable
CMD ["./server"]
