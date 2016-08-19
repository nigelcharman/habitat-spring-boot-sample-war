# spring-boot-sample-war

Build and run as usual -

```
$ hab studio enter
> build
> hab pkg export docker chetan/spring-boot-sample-war
> exit

$ docker run -d -p 8080:8080 chetan/spring-boot-sample-war
$ curl http://$(docker-machine ip default):8080/spring-boot-sample/
```
