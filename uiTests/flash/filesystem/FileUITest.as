package flash.filesystem
{
    import flash.display.Sprite;
    import flash.events.Event;

    /**
     * @author Simone Vicentini
     */
    public class FileUITest extends Sprite
    {
        private var file:File;
        public function FileUITest()
        {
            file = new File();
            addEventListeners();
            openBrowseForOpenDialog();
        }

        public function openBrowseForOpenDialog():void
        {
            file.browseForOpen("select a file");
        }

        private function addEventListeners():void
        {
            file.addEventListener(Event.CANCEL, onBrowseDialogCanceled, false, 0, true);
            file.addEventListener(Event.SELECT, onBrowseDialogFileSelected, false, 0, true);
        }

        private function onBrowseDialogCanceled(event:Event):void
        {
            trace("Dialog canceled!");
        }

        private function onBrowseDialogFileSelected(event:Event):void
        {
            trace("File Selected to open", event.target);
        }
    }
}
