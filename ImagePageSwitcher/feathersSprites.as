package  {
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import starling.core.Starling;
	import feathers.system.DeviceCapabilities;
	
	
	public class feathersSprites extends Sprite {
		
		private var starling:Starling;
		
		
		public function feathersSprites() {
			this.stage.align=StageAlign.TOP_RIGHT;
			this.stage.scaleMode=StageScaleMode.NO_SCALE;
			this.stage.addEventListener(Event.RESIZE, resizeHandler);
			starling = new Starling(Main, this.stage);
			starling.start();
		}
		
		private function resizeHandler(e:Event){
			starling.stage.stageWidth = this.stage.stageWidth;
			starling.stage.stageHeight = this.stage.stageHeight;
			
			const viewPort:Rectangle = starling.viewPort;
			viewPort.width= this.stage.stageWidth;
			viewPort.height= this.stage.stageHeight;
			starling.viewPort= viewPort;
		}
		
	}
			
			// constructor code
	
}
