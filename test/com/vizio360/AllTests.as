package com.vizio360
{
    import asunit.framework.TestSuite;
    import com.vizio360.log.AllTests;
    import com.vizio360.layout.AllTests;

    /**
     * @author Simone Vicentini
     */
    public class AllTests extends TestSuite
    {

        public function AllTests()
        {
            super();
            addTest(new com.vizio360.log.AllTests());
            addTest(new com.vizio360.layout.AllTests());

        }
    }
}
