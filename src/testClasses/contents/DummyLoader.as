package testClasses.contents
{
import classes.contents.ILoader;

import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;

public class DummyLoader implements ILoader
{
    public function DummyLoader()
    {
    }

    public var loadedPath:String;
    private var eventDispatcher:EventDispatcher = new EventDispatcher();

    private var _loader:Loader = new Loader();

    public function get loader():Loader
    {
        return _loader;
    }

    public function load(url:String):void
    {
        loadedPath = url;
    }

    public function dispatchCompleteEvent():void
    {
        eventDispatcher.dispatchEvent(new Event(Event.COMPLETE));
    }

    public function addEventListener(eventType:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
    {
        eventDispatcher.addEventListener(eventType, listener, useCapture, priority, useWeakReference);
    }

    public function removeEventListener(eventType:String, listener:Function, useCapture:Boolean = false):void
    {
        eventDispatcher.removeEventListener(eventType, listener, useCapture);
    }

    public function hasEventListener(eventType:String):Boolean
    {
        return eventDispatcher.hasEventListener(eventType);
    }

    public function willTrigger(eventType:String):Boolean
    {
        return eventDispatcher.willTrigger(eventType);
    }

    public function dispatchEvent(event:Event):Boolean
    {
        return false;
    }
}
}
