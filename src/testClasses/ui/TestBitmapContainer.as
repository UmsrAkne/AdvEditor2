package testClasses.ui
{
import classes.ui.BitmapContainer;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

import testClasses.Assert;

public class TestBitmapContainer
{

    public function TestBitmapContainer()
    {
        addTest();
        frontTest();
        addedBitmapDataDisposeTest();
    }

    private function addedBitmapDataDisposeTest():void
    {
        var sp:Sprite = new Sprite();
        var container:BitmapContainer = new BitmapContainer(sp, 3);

        var b1:Bitmap = new Bitmap(new BitmapData(1, 1, true, 0xffffff));
        var b2:Bitmap = new Bitmap(new BitmapData(1, 1, true, 0xffffff));
        var b3:Bitmap = new Bitmap(new BitmapData(1, 1, true, 0xffffff));
        var b4:Bitmap = new Bitmap(new BitmapData(1, 1, true, 0xffffff));

        container.add(b1);
        container.add(b2);
        container.add(b3);
        container.add(b4);

        var disposed:Boolean = false;

        try
        {
            trace(b1.bitmapData.width);
        } catch (error:Error)
        {
            disposed = true;
        }

        Assert.isTrue(disposed, "アクセスに失敗していれば disposed == true のはず");
    }

    private function frontTest():void
    {
        var sp:Sprite = new Sprite();
        var container:BitmapContainer = new BitmapContainer(sp, 3);

        var b1:Bitmap = new Bitmap();
        var b2:Bitmap = new Bitmap();
        var b3:Bitmap = new Bitmap();
        var b4:Bitmap = new Bitmap();

        Assert.areEqual(container.front, null, "まだ bmp を追加していないので、null のはず");

        container.add(b1);
        Assert.areEqual(container.front, b1);

        container.add(b2);
        Assert.areEqual(container.front, b2);

        container.add(b3);
        Assert.areEqual(container.front, b3);

        container.add(b4);
        Assert.areEqual(container.front, b4);
    }

    private function addTest():void
    {
        var sp:Sprite = new Sprite();
        var container:BitmapContainer = new BitmapContainer(sp, 3);

        var b1:Bitmap = new Bitmap();
        var b2:Bitmap = new Bitmap();
        var b3:Bitmap = new Bitmap();
        var b4:Bitmap = new Bitmap();

        Assert.areEqual(container.count, 0, "デフォルト値");

        container.add(b1);
        Assert.areEqual(container.count, 1);

        container.add(b2);
        Assert.areEqual(container.count, 2);

        container.add(b3);
        Assert.areEqual(container.count, 3);

        container.add(b4);
        Assert.areEqual(container.count, 3, "上限を超えるの増えない");
    }
}
}
