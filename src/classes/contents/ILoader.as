package classes.contents
{
import flash.display.Loader;

public interface ILoader
{
    function get loader():Loader;

    function load(url:String):void;
}
}
