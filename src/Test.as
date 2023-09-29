package
{
import flash.desktop.NativeApplication;
import flash.display.Sprite;

public class Test extends Sprite
{
    public function Test()
    {
        NativeApplication.nativeApplication.exit(0);
        trace("Test completed");
    }
}
}
