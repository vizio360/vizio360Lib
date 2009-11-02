package flash
{
    import asunit.framework.TestSuite;
    import flash.filesystem.AllTests;


    public class AllTests extends TestSuite
    {

        public function AllTests()
        {
            super();
            addTest(new flash.filesystem.AllTests());
        }
    }
}
