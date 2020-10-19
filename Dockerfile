FROM golang:alpine as hello
RUN echo 'hello!' > /tmp/hello.txt

FROM hello as build
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I'm running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log

FROM alpine
COPY --from=build /log /log

FROM alpine as copy
COPY . .
RUN ls -al
