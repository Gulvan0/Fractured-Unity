package graphic.components;

import openfl.display.DisplayObject;
import hxassert.Assert;
import openfl.display.Sprite;

class Grid extends Sprite
{
    public var components(default, null):Array<Array<DisplayObject>>;
    public var columnCount(default, null):Int;
    public var cellWidth(default, null):Float;
    public var cellHeight(default, null):Float;
    public var hasBorder(default, null):Bool;
    public var borderColor(default, null):Null<Int>;
    public var borderThickness(default, null):Null<Int>;

    public function addComponent(comp:DisplayObject) 
    {
        if (Lambda.empty(components) || components[components.length-1].length == columnCount)
        {
            components.push([]);
            if (hasBorder)
            {
                var hdelimiter = Shapes.line(cellWidth * columnCount, 0, borderColor, borderThickness);
                hdelimiter.x = 0;
                hdelimiter.y = cellHeight * (components.length-1);
                addChild(hdelimiter);
            }
        }
        var row:Int = components.length-1;
        var column:Int = components[row].length;
        components[row].push(comp);
        comp.x = cellWidth * column;
        comp.y = cellHeight * row;
        addChild(comp);
        if (hasBorder)
        {
            var vdelimiter = Shapes.line(0, cellHeight, borderColor, borderThickness);
            vdelimiter.x = cellWidth * (column + 1);
            vdelimiter.y = cellHeight * (components.length-1);
            addChild(vdelimiter);
        }
    }

    //When the time comes to add the remove() method, delimiters should correspond to the total cell count the time they were added. No matter which component is
    //going to be removed, after its removal all the cells after it should be moved and only the last delimiters should be removed. Easy

    public function new(columns:Int, cellWidth:Float, cellHeight:Float, ?borderColor:Int, ?borderThickness:Int) 
    {
        Assert.require(columns > 0);
        Assert.require((borderColor == null) == (borderThickness == null));
        super();
        this.columnCount = columns;
        this.components = [];
        this.cellWidth = cellWidth;
        this.cellHeight = cellHeight;
        this.hasBorder = borderColor != null;
        this.borderColor = borderColor;
        this.borderThickness = borderThickness;
    }
}