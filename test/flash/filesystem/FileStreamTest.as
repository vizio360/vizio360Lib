package flash.filesystem {
    import asunit.framework.TestCase;


    public class FileStreamTest extends TestCase
    {
        private var fileStream:FileStream;

        override protected function setUp():void
        {
            fileStream = new FileStream();
        }

        override protected function tearDown():void
        {
            fileStream = null;
        }

        public function testInstantiated():void
        {
            assertTrue("FileStream instantiated", fileStream is FileStream);
        }

        public function testOpenExistingFileForRead():void
        {
            var fileName:String = "testOpen.txt";
            var documentsDirectory:File = File.documentsDirectory;
            var newFile:File = documentsDirectory.resolvePath(fileName);
            createFile(newFile);
            fileStream.open(newFile, FileMode.READ);
            fileStream.close();
            newFile.deleteFile();

        }

        public function testOpenNonExistingFileForRead():void
        {
            var fileName:String = "FileThatDoesNotExist.txt";
            var documentsDirectory:File = File.documentsDirectory;
            var file:File = documentsDirectory.resolvePath(fileName);

            var errorOccured:Boolean = false;
            try{
                fileStream.open(file, FileMode.READ);
            }catch(e:Error)
            {
                errorOccured = true;
            }
            assertTrue("Trying opening a non existant file should raise an error", errorOccured);
        }

        private function createFile(destinationFile:File):void
        {
            var tempFile:File = File.createTempFile();
            tempFile.moveTo(destinationFile, true);
        }

        public function testOpenFileForAppend():void
        {
            var fileName:String = "testOpen.txt";
            var documentsDirectory:File = File.documentsDirectory;
            var newFile:File = documentsDirectory.resolvePath(fileName);
            fileStream.open(newFile, FileMode.APPEND);
            fileStream.close();
            assertTrue("File "+newFile.nativePath+" should exist", newFile.exists);
            newFile.deleteFile();
        }

    }
}
