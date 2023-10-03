package classes.contents
{
public class ImageOrder
{
    public var x:int;
    public var y:int;
    public var scale:Number = 1.0;
    public var targetLayerIndex:int;
    public var isDrawOrder:Boolean;
    public var isMaskOrder:Boolean;
    private var _imageFiles:Vector.<ImageFile>;

    /**
     * (get) imageFiles ベクターを取得します。このベクターの容量は 4 で固定されています。
     */
    public function get imageFiles():Vector.<ImageFile>
    {
        if (_imageFiles == null)
        {
            _imageFiles = new Vector.<ImageFile>(4, true);
        }

        return _imageFiles;
    }

    /**
     * (get)このオブジェクトが保持 ImageFile している中で、最も奥（レイヤーのインデックスが若いもの）を取得します。
     * ImageFile を一つも保持していない場合は、null を返します。
     */
    public function get mostBackImage():ImageFile
    {
        for each (var img:ImageFile in imageFiles)
        {
            if (img != null)
            {
                return img;
            }
        }

        return null;
    }
}
}
