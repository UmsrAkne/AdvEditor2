package testClasses.animes
{
import classes.animes.DummyAnimation;

import flash.display.Sprite;

import testClasses.Assert;

public class TestDummyAnimation
{
    public function TestDummyAnimation()
    {
        executeTest_1();
        executeTest_2();
        executeTest_3();
        executeTest_4();
    }

    private function executeTest_1():void
    {
        var dummy:DummyAnimation = new DummyAnimation();
        dummy.target = new Sprite();
        dummy.duration = 2;
        Assert.isTrue(dummy.isWorking);

        dummy.execute();
        Assert.isTrue(dummy.isWorking);

        dummy.execute();
        Assert.isFalse(dummy.isWorking);
    }

    private function executeTest_2():void
    {
        var dummy:DummyAnimation = new DummyAnimation();
        dummy.target = new Sprite();
        dummy.duration = 2;
        dummy.delay = 2;
        Assert.isTrue(dummy.isWorking);

        dummy.execute();
        Assert.isTrue(dummy.isWorking);
        dummy.execute();
        dummy.execute();
        dummy.execute();
        Assert.isFalse(dummy.isWorking);
    }

    private function executeTest_3():void
    {
        var dummy:DummyAnimation = new DummyAnimation();
        dummy.target = new Sprite();
        dummy.duration = 2;
        dummy.delay = 2;
        dummy.repeatCount = 1;
        Assert.isTrue(dummy.isWorking);

        dummy.execute();
        dummy.execute();
        dummy.execute();
        dummy.execute();
        dummy.execute();
        dummy.execute();
        Assert.isFalse(dummy.isWorking, "interval 未設定なので、 delay:2 + (duration:2 * rep:1) で 6 回実行で終了");
    }

    private function executeTest_4():void
    {
        var dummy:DummyAnimation = new DummyAnimation();
        dummy.target = new Sprite();
        dummy.duration = 2;
        dummy.delay = 2;
        dummy.repeatCount = 1;
        dummy.interval = 3;
        Assert.isTrue(dummy.isWorking);

        dummy.execute();
        dummy.execute();
        dummy.execute();
        dummy.execute();
        dummy.execute();
        dummy.execute();
        dummy.execute();
        dummy.execute();
        dummy.execute();
        Assert.isFalse(dummy.isWorking);
    }
}
}