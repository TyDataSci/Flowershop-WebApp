#Build Stage 
FROM dart:stable as builder
RUN mkdir /build
WORKDIR /build
COPY . .

RUN go build -o main web/src/main.dart


#Run Stage 
FROM alpine
WORKDIR /build
COPY --from=builder /build/main .
EXPOSE 8080

ENTRYPOINT [ "/build/main" ]