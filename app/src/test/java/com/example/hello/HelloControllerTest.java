package com.example.hello;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.beans.factory.annotation.Autowired;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class HelloControllerTest {

  @LocalServerPort
  int port;

  @Autowired
  TestRestTemplate rest;

  @Test
  void helloReturnsMessage() {
    var response = rest.getForEntity("http://localhost:" + port + "/hello", String.class);
    assertThat(response.getStatusCode().value()).isEqualTo(200);
    assertThat(response.getBody()).contains("hello");
  }
}
