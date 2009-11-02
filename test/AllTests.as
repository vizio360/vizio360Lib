package
{
    import asunit.framework.TestSuite;
    import com.AllTests;
    import flash.AllTests;
    /**
     *
     * @author Simone Vicentini
     */
    public class AllTests extends TestSuite
    {

        public function AllTests()
        {
            super();
            addTest(new flash.AllTests());
            addTest(new com.AllTests());
        }
    }
}
