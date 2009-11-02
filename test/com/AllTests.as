package com {
    import asunit.framework.TestSuite;
    import com.vizio360.AllTests;

    public class AllTests extends TestSuite
    {

        public function AllTests()
        {
            super();
            addTest(new com.vizio360.AllTests());

        }
    }
}
