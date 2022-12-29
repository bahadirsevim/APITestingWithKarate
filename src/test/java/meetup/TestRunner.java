package meetup;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate testAll(){
        return Karate.run().relativeTo(getClass());
    }

    @Karate.Test
    Karate testSample(){
        return Karate.run("tasks").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags(){
        return Karate.run("tasks").tags("@Smoke").relativeTo(getClass());
    }

    @Karate.Test
    Karate testFullPath(){
        return Karate.run("classpath:meetup/tasks.feature").tags("@Regression");
    }

    @Karate.Test
    Karate testSystemProperty(){
        return Karate.run("classpath:meetup/tasks.feature")
                .tags("@Smoke")
                .karateEnv("test")
                .systemProperty("foo","bar");
    }
}
