package classes.contents
{
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.filesystem.File;

public class ImageFile
{

    public function ImageFile(imageFile:File)
    {
        file = imageFile;
    }

    private var file:File;
    private var nameWe:String;

    private var _loader:ILoader;

    public function set loader(value:ILoader):void
    {
        _loader = value;
    }

    private var _eventDispatcher:IEventDispatcher;

    public function get eventDispatcher():IEventDispatcher
    {
        if (_eventDispatcher == null)
        {
            _eventDispatcher = new EventDispatcher();
        }

        return _eventDispatcher;
    }

    public function get fileNameWithoutExtension():String
    {
        if (nameWe == null)
        {
            nameWe = file.name.split(".")[0];
        }

        return nameWe;
    }

    public function get fileName():String
    {
        return file.name;
    }

    public function load():void
    {
        if (_loader == null)
        {
            _loader = new ContentLoader();
        }

        _loader.addEventListener(Event.COMPLETE, completeEventHandler);
        _loader.load(file.nativePath);
    }

    private function completeEventHandler(e:Event):void
    {
        _eventDispatcher.dispatchEvent(new Event(Event.COMPLETE));
        _loader.removeEventListener(Event.COMPLETE, completeEventHandler);
    }
}
}
