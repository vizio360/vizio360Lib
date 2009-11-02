package com.vizio360.log {
    import br.com.stimuli.string.printf;

    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;

    /**
     * This class can be used only in the AIR environment as
     * it uses specific AIR Classes.
     *
     * The Log Directories will be created in the Documents folder
     * of the current user.
     *
     * @author simone
     */
    public class Logger
    {
        private const LOG_FOLDER_PATH:String = File.documentsDirectory.nativePath;
        private const LOG_FOLDER_NAME:String = "log";
        private const LOG_FILE_EXTENSION:String = ".log";
        private var logFolderName:String;
        private var logFolder:File;
        private var logFile:File;
        private var fileNamePostfix_:String;

        public function Logger()
        {
            logFile = new File();
        }

        private function createLogFolderIfNecessary():void
        {
            if (logFolderName == null || logFolderName == "")
                logFolderName = LOG_FOLDER_NAME;
            logFolder = new File(LOG_FOLDER_PATH +"/"+ logFolderName);
            logFolder.createDirectory();
        }

        /**
         * Logs a message in the current log file
         *
         * @param message The message to be logged
         */
        public function log(message:String):void
        {
            createLogFolderIfNecessary();
            getLogFileReady();
            appendLogMessage(message);
        }

        private function getLogFileReady():void
        {
            var fileName:String = getTodaysDate();
            if (fileNamePostfix_)
                fileName += "_" + fileNamePostfix_;
            fileName += LOG_FILE_EXTENSION;

            logFile = logFolder.resolvePath(fileName);
        }

        private function appendLogMessage(message:String):void
        {
            var logLinePrefix:String = getLogMessagePrefix();
            var fileStream:FileStream = new FileStream();
            fileStream.open(logFile, FileMode.APPEND);
            fileStream.writeUTFBytes(logLinePrefix+" "+message+"\r\n");
            fileStream.close();
        }

        private function getLogMessagePrefix():String
        {
            var date:Date = new Date();
            var timeAsString:String = printf("%02d:%02d:%02d", date.hours, date.minutes, date.seconds);
            return timeAsString;
        }

        private function getTodaysDate():String
        {
            var date:Date = new Date(2009, 2, 3);
            var dateAsString:String = printf("%02d%02d%4d", date.getDate(), date.getMonth() + 1, date.getFullYear());
            return dateAsString;
        }

        /**
         * Gets the file Path of the current log file
         *
         * @return The log file's path
         */
        public function getLogFilePath():String
        {
            return logFile.nativePath;
        }

        /**
         * Sets the destination folder of the logs
         *
         * @param folderName
         */
        public function setLogDestinationFolder(folderName:String):void
        {
            logFolderName = folderName;
        }
        /**
         * Set the postfix for the file name
         * i.e. 01022209_yourpostfix.log
         *
         * @param postfix
         */
        public function set fileNamePostfix(postfix:String):void
        {
            this.fileNamePostfix_ = postfix;
        }

        /**
         * Deletes the current log file
         */
        public function deleteLogFile():void
        {
            logFile.deleteFile();
        }
        /**
         * Deletes the current log folder and all its content
         */
        public function deleteLogDirectory():void
        {
            logFolder.deleteDirectory(true);
        }
    }
}
