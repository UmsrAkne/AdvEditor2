package testClasses.contents
{
import classes.contents.ImageOrder;

import testClasses.Assert;

public class TestImageOrder
{
    public function TestImageOrder()
    {
        testImageFiles();
    }

    private function testImageFiles():void
    {
        var order:ImageOrder = new ImageOrder();
        Assert.areEqual(order.imageFiles.length, 4);
        Assert.areEqual(order.imageFiles[0], null);
        Assert.areEqual(order.imageFiles[1], null);
        Assert.areEqual(order.imageFiles[2], null);
        Assert.areEqual(order.imageFiles[3], null);
    }
}
}
