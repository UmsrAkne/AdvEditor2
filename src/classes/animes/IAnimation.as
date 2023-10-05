package classes.animes
{
import flash.display.DisplayObject;

public interface IAnimation
{
    function get name():String;

    function get isWorking():Boolean;

    function get targetLayerIndex():int;

    function set target(value:DisplayObject):void

    function start():void;

    function execute():void;

    function stop():void;

}
}
