FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY . /app
RUN javac demo.java
CMD ["java","demo"]
