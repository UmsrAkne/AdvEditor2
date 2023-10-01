package classes.ui
{
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

public class BitmapContainer
{
    /**
     * @param parent
     *  この BitmapContainer を表示するオブジェクトを指定します。
     *  (正確には内部で保持している Sprite を登録します)
     * @param capacity
     *  このオブジェクトに登録できる Bitmap の最大数です。
     */
    public function BitmapContainer(parent:DisplayObjectContainer, capacity:int = 3)
    {
        parent.addChild(baseObject);
        this.capacity = capacity;
    }

    private var baseObject:Sprite = new Sprite();
    private var bitmaps:Vector.<Bitmap> = new Vector.<Bitmap>();
    private var capacity:int = 3;

    /**
     * (get) このオブジェクトに登録されている Bitmap の数を取得します。
     */
    public function get count():int
    {
        return bitmaps.length;
    }

    /**
     * (get) このオブジェクトの先頭に位置する Bitmap を取得します。
     */
    public function get front():Bitmap
    {
        return bitmaps.length > 0 ? bitmaps[bitmaps.length - 1] : null;
    }

    /**
     * (set)この BitmapContainer に登録されている全てのオブジェクトに対して適用するマスクを登録します。
     * 動作検証済み。
     * @param mask
     */
    public function set mask(mask:DisplayObject):void
    {
        baseObject.mask = mask;
    }

    /**
     * このオブジェクトに新しい Bitmap を追加登録します。
     * 登録時に、登録数が capacity を超えていた場合、古い Bitmap が解放、削除されます。
     * @param bmp 追加登録する Bitmap です。既にコンテナに登録済みの Bitmap を追加した場合の挙動は未検証です。
     */
    public function add(bmp:Bitmap):void
    {
        baseObject.addChild(bmp);
        bitmaps.push(bmp);

        if (bitmaps.length > capacity)
        {
            var b:Bitmap = bitmaps.shift();
            if (b.bitmapData != null)
            {
                b.bitmapData.dispose();
            }

            baseObject.removeChild(b);
        }
    }
}
}
