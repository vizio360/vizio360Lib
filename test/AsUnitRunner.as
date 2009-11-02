package
{
    import asunit.textui.TestRunner;

    /**
     * Runs all the tests present in this folder
     */
    public class AsUnitRunner extends TestRunner
    {
        public function AsUnitRunner()
        {
            start(AllTests);
        }
    }
}
