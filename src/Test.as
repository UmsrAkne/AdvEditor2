package
{
import flash.desktop.NativeApplication;
import flash.display.Sprite;

import testClasses.Assert;
import testClasses.animes.TestDummyAnimation;
import testClasses.contents.TestImageFile;
import testClasses.contents.TestImageOrder;
import testClasses.ui.TestBitmapContainer;

public class Test extends Sprite
{
    public function Test()
    {
        new TestDummyAnimation();

        new TestImageFile();
        new TestImageOrder();

        new TestBitmapContainer();

        NativeApplication.nativeApplication.exit(0);
        trace(Assert.TestCounter + " Assertions completed");
    }
}
}
