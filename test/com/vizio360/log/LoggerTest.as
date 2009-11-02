package com.vizio360.log {
    import asunit.framework.TestCase;

    import flash.filesystem.File;

    /**
     * @author simone
     */
    public class LoggerTest extends TestCase
    {
        private const loggerTestDirectory:String = "LoggerTestDirectory";
        private var logger:Logger;

        override protected function setUp():void
        {
            logger = new Logger();
        }

        override protected function tearDown():void
        {
            logger = null;
        }

        public function testInstantiated():void
        {
            assertTrue("Logger instantiated", logger is Logger);
        }

        public function testLog():void
        {
            setDestinationFolder();
            logger.log("test");
            var file:File = new File(logger.getLogFilePath());
            assertTrue(logger.getLogFilePath()+" file should exists!", file.exists);
            logger.deleteLogDirectory();
        }

        public function testFileNamePostfix():void
        {
            setDestinationFolder();
            logger.fileNamePostfix = "LoggerTest";
            logger.log("test");
            var file:File = new File(logger.getLogFilePath());
            assertTrue(logger.getLogFilePath()+" should exists!", file.exists);
            logger.deleteLogDirectory();
        }

        public function testDeleteLogFile():void
        {
            setDestinationFolder();
            logger.fileNamePostfix = "fileToBeDeleted";
            logger.log("test");
            logger.deleteLogFile();
            var file:File = new File(logger.getLogFilePath());
            assertFalse(logger.getLogFilePath()+" should not exists!", file.exists);
            logger.deleteLogDirectory();
        }

        public function testDeleteLogDirectory():void
        {
            setDestinationFolder();
            logger.log("test");
            logger.deleteLogDirectory();
            var file:File = new File(logger.getLogFilePath());
            file = file.parent;
            assertFalse(file.nativePath+" should not exists!", file.exists);
        }

        private function setDestinationFolder(destinationFolder:String = ""):void
        {
            if (destinationFolder != "")
                logger.setLogDestinationFolder(destinationFolder);
            else
                logger.setLogDestinationFolder(loggerTestDirectory);
        }


    }
}
