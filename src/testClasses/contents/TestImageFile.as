package testClasses.contents
{
import classes.contents.ImageFile;

import flash.filesystem.File;

import testClasses.Assert;

public class TestImageFile
{
    public function TestImageFile()
    {
        getFileNameTest();
    }

    private function getFileNameTest():void
    {
        var imageFile:ImageFile = new ImageFile(new File("c:\\dir\\test.png"));
        Assert.areEqual("test.png", imageFile.fileName);
        Assert.areEqual("test", imageFile.fileNameWithoutExtension);

        var imageFile2:ImageFile = new ImageFile(new File("c:\\dir\\test.jpeg"));
        Assert.areEqual("test", imageFile2.fileNameWithoutExtension);
    }
}
}
