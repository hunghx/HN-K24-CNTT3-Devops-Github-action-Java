package ra.edu.session03docker;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
public class Session03DockerApplicationTest {

    @Test
    public void contextLoads() {
        // This test verifies that the Spring application context loads successfully
        assertNotNull(null);
    }

    @Test
    public void applicationStartsSuccessfully() {
        // Verify application can start
        Session03DockerApplication.main(new String[]{});
    }
}
