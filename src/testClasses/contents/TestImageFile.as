package testClasses.contents
{
import classes.contents.ImageFile;

import flash.events.Event;
import flash.filesystem.File;

import testClasses.Assert;

public class TestImageFile
{
    public function TestImageFile()
    {
        getFileNameTest();
        loadTest();
    }

    private function loadTest():void
    {
        var imageFile:ImageFile = new ImageFile(new File("c:\\test.png"));

        var dummyLoader:DummyLoader = new DummyLoader();
        imageFile.loader = dummyLoader;
        Assert.areEqual(dummyLoader.loadedPath, null);

        var completed:Boolean;
        imageFile.eventDispatcher.addEventListener(Event.COMPLETE, function (e:Event):void {
            completed = true;
        });

        imageFile.load();
        Assert.areEqual(dummyLoader.loadedPath, "c:\\test.png");

        Assert.isFalse(completed, "この時点ではまだ false");
        dummyLoader.dispatchCompleteEvent();
        Assert.isTrue(completed, "Complete Event を送ったので true になっている");
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
