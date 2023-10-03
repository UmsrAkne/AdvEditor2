package classes.scenarioSceneParts
{
import classes.contents.ImageOrder;
import classes.contents.Scenario;
import classes.ui.BitmapContainer;

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
    }

    public function drawToFront(order:ImageOrder):void
    {

    }
}
}
