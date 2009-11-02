package flash.filesystem
{
    import asunit.framework.TestSuite;

    public class AllTests extends TestSuite
    {

        public function AllTests()
        {
            super();
            addTest(new FileTest());
            addTest(new FileStreamTest());
        }
    }
}
