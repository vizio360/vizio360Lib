package com.vizio360.layout {
    import asunit.framework.TestSuite;

    /**
     * @author Simone Vicentini
     */
    public class AllTests extends TestSuite
    {

        public function AllTests()
        {
            super();
            addTest(new BoudariesCheckerTest());
        }
    }
}
