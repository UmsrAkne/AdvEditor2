package classes.contents
{
import flash.display.Loader;
import flash.filesystem.File;
import flash.net.URLRequest;

public class ImageFile
{

    public function ImageFile(imageFile:File)
    {
        file = imageFile;
    }

    private var file:File;
    private var loader:Loader;
    private var nameWe:String;

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
        if (loader == null)
        {
            loader = new Loader();
            loader.load(new URLRequest(file.nativePath));
        }
    }
}
}
