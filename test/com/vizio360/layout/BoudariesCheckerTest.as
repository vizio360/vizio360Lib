package com.vizio360.layout
{
    import asunit.framework.TestCase;

    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.geom.Point;

    /**
     * @author Simone Vicentini
     */
    public class BoudariesCheckerTest extends TestCase
    {
        private var boundariesChecker:BoundariesChecker;

        override protected function setUp():void
        {
            boundariesChecker = new BoundariesChecker();
        }

        override protected function tearDown():void
        {
            boundariesChecker = null;
        }

        public function testLimitMovementToBoundaries():void
        {
            var cameraObject:Sprite = new Sprite();
            var movingObject:Sprite = new Sprite();
            cameraObject.graphics.lineStyle(2);
            cameraObject.graphics.drawRect(0, 0, 100, 80);
            movingObject.graphics.lineStyle(2);
            movingObject.graphics.drawRect(0, 0, 800, 600);

            var mainContainer:Sprite = new Sprite();
            cameraObject.x = 30;
            cameraObject.y = 40;
            mainContainer.addChild(cameraObject);
            movingObject.x = 0;
            movingObject.y = 0;
            mainContainer.addChild(movingObject);

            addChild(mainContainer);
            boundariesChecker.cameraDisplayObject = cameraObject;
            boundariesChecker.containerSprite = movingObject;
            var newMovingObjectPosition:Point;

            newMovingObjectPosition = boundariesChecker.moveMovingSpriteBy(10, 0);
            assertEquals(10, newMovingObjectPosition.x);
            assertEquals(0, newMovingObjectPosition.y);

            newMovingObjectPosition = boundariesChecker.moveMovingSpriteBy(-60, 0);
            assertEquals(-60, newMovingObjectPosition.x);
            assertEquals(0, newMovingObjectPosition.y);

            newMovingObjectPosition = boundariesChecker.moveMovingSpriteBy(0, 15);
            assertEquals(0, newMovingObjectPosition.x);
            assertEquals(15, newMovingObjectPosition.y);

            newMovingObjectPosition = boundariesChecker.moveMovingSpriteBy(0, -50);
            assertEquals(0, newMovingObjectPosition.x);
            assertEquals(-50, newMovingObjectPosition.y);

            newMovingObjectPosition = boundariesChecker.moveMovingSpriteBy(50, 0);
            assertEquals(30, newMovingObjectPosition.x);
            assertEquals(0, newMovingObjectPosition.y);

            newMovingObjectPosition = boundariesChecker.moveMovingSpriteBy(0, 950);
            assertEquals(0, newMovingObjectPosition.x);
            assertEquals(40, newMovingObjectPosition.y);

            newMovingObjectPosition = boundariesChecker.moveMovingSpriteBy(20, 20);
            assertEquals(20, newMovingObjectPosition.x);
            assertEquals(20, newMovingObjectPosition.y);

            removeChild(mainContainer);
        }


    }
}
