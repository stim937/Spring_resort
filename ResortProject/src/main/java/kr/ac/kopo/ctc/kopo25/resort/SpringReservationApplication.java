package kr.ac.kopo.ctc.kopo25.resort;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class SpringReservationApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringReservationApplication.class, args);
	}

}
