package runners;

import com.intuit.karate.junit5.Karate;

class MailSendAPIRunner {

    @Karate.Test
    Karate runAllTests() {
        return Karate.run("classpath:features").relativeTo(getClass());
    }
}



//For running parallel tests, use this runner instead of the above one:
//@Karate.Test
//Karate runAllTests() {
//    return Karate.run("classpath:features")
//            .parallel(4);
//}
