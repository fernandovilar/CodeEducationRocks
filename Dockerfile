# REFERENCIA: https://chemidy.medium.com/create-the-smallest-and-secured-golang-docker-image-based-on-scratch-4752223b7324
FROM golang:latest AS builder

WORKDIR /home/root

COPY fullcyclerocks.go .

RUN go build -ldflags "-s -w" fullcyclerocks.go 

FROM scratch

COPY --from=builder /home/root/fullcyclerocks /usr/bin/fullcyclerocks

CMD [ "fullcyclerocks" ]

