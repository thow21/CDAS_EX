FROM golang:1.20-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
LABEL maintainer=thomas.wagner@students.fh-hagenberg.at

# Set working directory: `/src`
WORKDIR /src

# Copy go.mod and go.sum first (best for Docker caching)
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy local file `main.go` to the working directory
COPY *.go ./

# List items in the working directory (ls)
RUN ls

# Build the GO app as myapp binary and move it to /usr/
RUN go build -o cdas-exercise . && mv cdas-exercise /usr/

#Expose port 8888
EXPOSE 8888

# Run the service myapp when a container of this image is launched
CMD ["/usr/myapp"]
