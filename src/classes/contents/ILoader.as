package classes.contents
{
import flash.display.Loader;
import flash.events.IEventDispatcher;

public interface ILoader extends IEventDispatcher
{
    function get loader():Loader;

    function load(url:String):void;
}
}
