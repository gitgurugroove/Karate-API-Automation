package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class MailSendAPIRunner {

//    @Karate.Test
//    Karate runAllTests() {
//        return Karate.run("classpath:features")
//                .tags("@sendGridMail")
//                .relativeTo(getClass());
//    }


    //For running parallel tests, use this runner instead of the above one:
    @Test
    void runSendGridMailTestsInParallel() {
        Results results = Runner.path("classpath:features")
                .tags("@sendGridMail")
                .parallel(4);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}



