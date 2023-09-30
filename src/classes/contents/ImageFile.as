package classes.contents
{
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

        _loader.load(file.nativePath);
    }
}
}
