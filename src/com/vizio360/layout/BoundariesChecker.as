package com.vizio360.layout
{
    import flash.display.DisplayObject;
    import flash.display.Stage;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    /**
     * @author Simone Vicentini
     */
    public class BoundariesChecker
    {
        private var cameraDisplayObject_:DisplayObject;
        private var movingDisplayObject_:DisplayObject;

        public function set cameraDisplayObject(camera:DisplayObject):void
        {
            cameraDisplayObject_ = camera;
        }

        public function set containerSprite(containerSprite:DisplayObject):void
        {
            movingDisplayObject_ = containerSprite;
        }

        public function moveMovingSpriteBy(xOffset:Number, yOffset:Number):Point
        {
            var newPosition:Point = new Point();

            var spriteRectangle:Rectangle;
            spriteRectangle = cameraDisplayObject_.getRect(cameraDisplayObject_);
            var cameraTopLeftPoint:Point = new Point();
            cameraTopLeftPoint.x = spriteRectangle.left;
            cameraTopLeftPoint.y = spriteRectangle.top;
            cameraTopLeftPoint = cameraDisplayObject_.localToGlobal(cameraTopLeftPoint);

            var cameraDisplayObjectWidth:Number = cameraDisplayObject_.width;
            var cameraDisplayObjectHeight:Number = cameraDisplayObject_.height;

            if (cameraDisplayObject_ is Stage)
            {
                var stageRef:Stage = Stage(cameraDisplayObject_);
                cameraTopLeftPoint.x = 0;
                cameraTopLeftPoint.y = 0;
                cameraDisplayObjectWidth = stageRef.stageWidth;
                cameraDisplayObjectHeight = stageRef.stageHeight;


            }

            spriteRectangle = movingDisplayObject_.getRect(movingDisplayObject_);
            var movingDisplayObjectTopLeftPoint:Point = new Point();
            movingDisplayObjectTopLeftPoint.x = spriteRectangle.left;
            movingDisplayObjectTopLeftPoint.y = spriteRectangle.top;
            movingDisplayObjectTopLeftPoint = movingDisplayObject_.localToGlobal(movingDisplayObjectTopLeftPoint);


            var rightXOffset:Number = (cameraTopLeftPoint.x + cameraDisplayObjectWidth) -
                                      (movingDisplayObjectTopLeftPoint.x + movingDisplayObject_.width);

            var leftXOffset:Number = cameraTopLeftPoint.x - movingDisplayObjectTopLeftPoint.x;

            var bottomYOffset:Number = (cameraTopLeftPoint.y + cameraDisplayObjectHeight) -
                                       (movingDisplayObjectTopLeftPoint.y + movingDisplayObject_.height);

            var topYOffset:Number = cameraTopLeftPoint.y - movingDisplayObjectTopLeftPoint.y;


            if (xOffset < 0 && xOffset < rightXOffset)
                xOffset = rightXOffset;

            if (xOffset > 0 && xOffset > leftXOffset)
                xOffset = leftXOffset;

            if (yOffset < 0 && yOffset < bottomYOffset)
                yOffset = bottomYOffset;

            if (yOffset > 0 && yOffset > topYOffset)
                yOffset = topYOffset;

            newPosition.x = movingDisplayObject_.x + xOffset;
            newPosition.y = movingDisplayObject_.y + yOffset;
            return newPosition;
        }
    }
}
