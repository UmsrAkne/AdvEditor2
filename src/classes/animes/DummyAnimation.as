package classes.animes
{
import flash.display.DisplayObject;

public class DummyAnimation implements IAnimation
{
    public var delay:int = 0;
    public var duration:int = 0;
    public var interval:int = 0;
    public var repeatCount:int = 0;
    public var processCounter:int = 0;

    private var _target:DisplayObject;

    public function set target(value:DisplayObject):void
    {
        this._target = value;
    }

    private var _targetLayerIndex:int;

    public function get targetLayerIndex():int
    {
        return 0;
    }

    public function set targetLayerIndex(value:int):void
    {
        _targetLayerIndex = value;
    }

    private var _isWorking:Boolean = true;

    public function get isWorking():Boolean
    {
        return _isWorking;
    }

    public function get name():String
    {
        return "DummyAnimation";
    }

    public function start():void
    {
    }

    public function execute():void
    {
        if (!isWorking || _target == null)
        {
            return;
        }

        if (--delay > 0)
        {
            return;
        }

        processCounter++;

        if (processCounter >= duration)
        {
            if (repeatCount > 0)
            {
                repeatCount--;
                processCounter = 0;
                delay = interval;
            } else
            {
                stop();
            }
        }
    }

    public function stop():void
    {
        _isWorking = false;
    }
}
}
