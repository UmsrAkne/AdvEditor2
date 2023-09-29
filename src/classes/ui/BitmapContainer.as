package classes.ui
{
import flash.display.Bitmap;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

public class BitmapContainer
{
    private var baseObject:Sprite = new Sprite();
    private var bitmaps:Vector.<Bitmap> = new Vector.<Bitmap>();
    private var capacity:int = 3;

    public function BitmapContainer(parent:DisplayObjectContainer, capacity:int = 3)
    {
        parent.addChild(baseObject);
        this.capacity = capacity;
    }

    public function add(bmp:Bitmap):void
    {
        baseObject.addChild(bmp);
        bitmaps.push(bmp);

        if (bitmaps.length >= capacity)
        {
            var b:Bitmap = bitmaps.shift();
            b.bitmapData.dispose();
            b.visible = false;
            baseObject.removeChild(b);
        }
    }

    public function get count():int
    {
        return bitmaps.length;
    }
}
}
