package classes.contents
{
import flash.display.Loader;
import flash.net.URLRequest;

public class ContentLoader implements ILoader
{
    public function ContentLoader()
    {
    }

    private var _loader:Loader = new Loader();

    public function get loader():Loader
    {
        return _loader;
    }

    public function load(url:String):void
    {
        _loader.load(new URLRequest(url));
    }
}
}
