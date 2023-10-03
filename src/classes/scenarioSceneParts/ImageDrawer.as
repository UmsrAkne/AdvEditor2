package classes.scenarioSceneParts
{
import classes.contents.ImageFile;
import classes.contents.ImageOrder;
import classes.contents.Scenario;
import classes.ui.BitmapContainer;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;

public class ImageDrawer implements IScenarioSceneParts
{
    public function ImageDrawer(container:BitmapContainer, index:int = 0)
    {
        bitmapContainer = container;
        targetLayerIndex = index;
    }

    private var bitmapContainer:BitmapContainer;
    private var imageOrders:Vector.<ImageOrder>;
    private var targetLayerIndex:int;

    public function execute():void
    {
        var additionOrder:ImageOrder;
        var drawOrder:ImageOrder;

        for each(var o:ImageOrder in imageOrders)
        {
            if (o.targetLayerIndex == targetLayerIndex)
            {
                if (o.isMaskOrder)
                {
                    continue;
                }

                if (o.isDrawOrder)
                {
                    drawOrder = o;
                }

                if (!o.isDrawOrder)
                {
                    additionOrder = o;
                }

                if (drawOrder != null && additionOrder != null)
                {
                    // order は各一つずつしか入らない仕様なので、両方埋まっている場合は break
                    imageOrders = null;
                    break;
                }
            }
        }

        if (additionOrder != null)
        {
            addBitmap(additionOrder);
        }

        if (drawOrder != null)
        {
            drawToFront(drawOrder);
        }
    }

    public function setScenario(scenario:Scenario):void
    {
        if (scenario.imageOrders.length != 0)
        {
            imageOrders = scenario.imageOrders;
        }
    }

    public function addBitmap(order:ImageOrder):void
    {
        var baseImage:ImageFile = order.mostBackImage;
        var bmp:Bitmap = new Bitmap(new BitmapData(baseImage.width, baseImage.height, true, 0x0), PixelSnapping.AUTO, true);
        for each (var img:ImageFile in order.imageFiles)
        {
            if (img == null)
            {
                continue;
            }

            bmp.bitmapData.draw(img.bitmapData);
        }
    }

    public function drawToFront(order:ImageOrder):void
    {

    }
}
}
