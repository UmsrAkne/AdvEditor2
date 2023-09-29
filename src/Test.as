package
{
import flash.desktop.NativeApplication;
import flash.display.Sprite;

import testClasses.contents.TestImageFile;
import testClasses.ui.TestBitmapContainer;

public class Test extends Sprite
{
    public function Test()
    {
        new TestBitmapContainer();
        new TestImageFile();

        NativeApplication.nativeApplication.exit(0);
        trace("Test completed");
    }
}
}
