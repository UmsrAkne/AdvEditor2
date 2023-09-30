package classes.contents
{
import flash.display.Loader;
import flash.events.Event;
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

    public function addEventListener(eventType:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
    {
        _loader.addEventListener(eventType, listener, useCapture, priority, useWeakReference);
    }

    public function removeEventListener(eventType:String, listener:Function, useCapture:Boolean = false):void
    {
        _loader.removeEventListener(eventType, listener, useCapture);
    }

    public function hasEventListener(eventType:String):Boolean
    {
        return _loader.hasEventListener(eventType);
    }

    public function willTrigger(eventType:String):Boolean
    {
        return _loader.willTrigger(eventType);
    }

    public function dispatchEvent(event:Event):Boolean
    {
        return _loader.dispatchEvent(event);
    }
}
}
