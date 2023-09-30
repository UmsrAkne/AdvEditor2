package testClasses.contents
{
import classes.contents.ILoader;

import flash.display.Loader;

public class DummyLoader implements ILoader
{
    public function DummyLoader()
    {
    }
    public var loadedPath:String;

    private var _loader:Loader;

    public function get loader():Loader
    {
        return _loader;
    }

    public function load(url:String):void
    {
        loadedPath = url;
    }
}
}
