package classes.contents
{
import flash.display.BitmapData;
import flash.display.IBitmapDrawable;
import flash.display.Loader;
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

    private var _bitmapData:IBitmapDrawable;

    public function get bitmapData():IBitmapDrawable
    {
        return _bitmapData;
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

    public function get width():int
    {
        if (_loader == null || _loader.loader == null)
        {
            return 0;
        }

        return _loader.loader.width;
    }

    public function get height():int
    {
        if (_loader == null || _loader.loader == null)
        {
            return 0;
        }

        return _loader.loader.height;
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

    public function CreateBitmapData(l:Loader):IBitmapDrawable
    {
        return l.width > 0 ? new BitmapData(l.width, l.height, true, 0x0) : new BitmapData(10, 10, true, 0x00ff0000);
    }

    private function completeEventHandler(e:Event):void
    {
        _bitmapData = CreateBitmapData(_loader.loader);
        _eventDispatcher.dispatchEvent(new Event(Event.COMPLETE));
        _loader.removeEventListener(Event.COMPLETE, completeEventHandler);
    }
}
}
