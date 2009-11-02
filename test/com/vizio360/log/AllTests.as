package com.vizio360.log {
    import asunit.framework.TestSuite;

    /**
     * @author Simone Vicentini
     */
    public class AllTests extends TestSuite
    {

        public function AllTests()
        {
            super();
            addTest(new LoggerTest());
        }
    }
}
