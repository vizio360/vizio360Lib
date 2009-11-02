package flash.filesystem {
    import asunit.framework.TestCase;


    public class FileTest extends TestCase
    {
        private var file:File;

        override protected function setUp():void
        {
            file = new File();
        }

        override protected function tearDown():void
        {
            file = null;
        }

        public function testInstantiated():void
        {
            assertTrue("File instantiated", file is File);
        }

        public function testCreateDirectory():void
        {
            //you cannot create Folders/Files in the application Folder
            //you are forced to use:
            //documentsDirectory
            //applicationStorageDirectory
            //desktopDirectory
            file = File.documentsDirectory;
            var directory:File = file.resolvePath("FolderForUnitTest");
            assertFalse("FolderForUnitTest shouldn't be a folder in "+file.nativePath ,directory.isDirectory);
            directory.createDirectory();
            assertTrue("FolderForUnitTest should be a folder in "+file.nativePath ,directory.isDirectory);
            directory.deleteDirectory(true);
        }

        public function testExists():void
        {
            var fileName:String = "file.txt";
            var documentsDir:File = File.documentsDirectory;
            file = documentsDir.resolvePath(fileName);
            assertFalse("The file "+fileName+" shouldn't be present in "+documentsDir.nativePath, file.exists);

            var tempFile:File = File.createTempFile();
            var destinationFile:File = documentsDir.resolvePath(fileName);
            tempFile.moveTo(destinationFile, true);
            file = documentsDir.resolvePath(fileName);
            assertTrue("The file "+fileName+" should be present in "+documentsDir.nativePath, file.exists);
            destinationFile.deleteFile();
        }


    }
}
