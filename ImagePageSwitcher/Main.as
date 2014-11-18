package  {

	//import feathers.themes.AeonDesktopTheme;
	
	import feathers.themes.MinimalMobileTheme;
	
	//5 controls Button, Screen, Panel, ImageLoader and the Tab Bar
	
	import starling.display.Sprite;
	import starling.events.Event;
	import feathers.controls.Button;
	import feathers.controls.Screen;
	import feathers.controls.Panel;
	import feathers.controls.ImageLoader;
	import feathers.controls.TabBar;
	//5 layouts
	import feathers.layout.VerticalLayout;
	import feathers.layout.VerticalLayoutData;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.HorizontalLayoutData;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	
	import feathers.controls.ScrollContainer;
	import feathers.controls.ScrollText;
	
	import feathers.events.FeathersEventType;
	import feathers.data.ListCollection;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	import starling.display.Image;	
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	import flash.media.Sound;
	import flash.media.SoundChannel;
	import EmbeddedAssets;
		
	public class Main extends Screen {
		
		[Embed(source = "sprites/spriteOne.xml", mimeType = "application/octet-stream")]
	   
		public static const ATLAS_XML: Class;
		[Embed(source = "sprites/spriteOne.png")]
		public static const ATLAS_TEXTURE: Class; 
		[Embed(source = "sprites/ImageSlider_SPRITE.xml", mimeType = "application/octet-stream")]
		public static const ATLAS_XML2: Class;
	    [Embed(source = "sprites/ImageSlider_SPRITE.png")]
		public static const ATLAS_TEXTURE2: Class; 
		
		private var atlas: TextureAtlas;
		private var atlasTexture: Texture;
		private var bgTexture: Texture;
		private var bgImgLoader: ImageLoader;
		private var button: Button;
		private var contentPanel: Panel;
		private var buttonPanel: Panel;
		private var assetMgr: AssetManager;

		public function Main() {
			
			super();
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}
		private function initializeHandler(e: Event): void {
			
			this.removeEventListener(FeathersEventType.INITIALIZE, initializeHandler);
			//this.headerProperties.title = "LooneyTunes";
			this.stage.addEventListener(Event.RESIZE, stageResized);
			assetMgr = new AssetManager();
			assetMgr.verbose = true;
			assetMgr.enqueue(EmbeddedAssets);
			assetMgr.loadQueue(handleAssetsLoading);
		}
		private function handleAssetsLoading(ratioLoaded: Number): void {
			trace("handleAssetsLoading: " + ratioLoaded);
			if (ratioLoaded == 1) {
				startApp()
				assetMgr.playSound("Intro");
			}
		}
		private function startApp() {
			//new AeonDesktopTheme();
			new MinimalMobileTheme();
			//new MetalWorksMobileTheme();
			//new MinimalMobileTheme();

			var screenLayout: AnchorLayout = new AnchorLayout();
			this.layout = screenLayout;
			this.width = this.stage.stageWidth;
			this.height = this.stage.stageHeight;
			atlasTexture = Texture.fromBitmap(new ATLAS_TEXTURE());
			var xml: XML = XML(new ATLAS_XML());
			atlas = new TextureAtlas(atlasTexture, xml);

			this.buttonPanel = new Panel();
			var buttonPanelLayoutData: AnchorLayoutData = new AnchorLayoutData();
			buttonPanelLayoutData.left = 10;
			buttonPanelLayoutData.right = 10;
			buttonPanelLayoutData.bottom = 10;
			
			this.buttonPanel.layoutData = buttonPanelLayoutData;
			var buttonPanelLayout: HorizontalLayout = new HorizontalLayout();
			buttonPanelLayout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
			this.buttonPanel.layout = buttonPanelLayout;
			this.addChild(this.buttonPanel);

			this.contentPanel = new Panel();
			var contentPanelLayoutData: AnchorLayoutData = new AnchorLayoutData();
			contentPanelLayoutData.top = 5;
			contentPanelLayoutData.bottom = 15;
			contentPanelLayoutData.left = 5;
			contentPanelLayoutData.right = 5;
			contentPanelLayoutData.bottomAnchorDisplayObject = this.buttonPanel;
			contentPanel.layoutData = contentPanelLayoutData;
			this.addChild(contentPanel);
contentPanel.headerProperties.title = "Start_Page";


			bgTexture = atlas.getTexture("Videos");
			bgImgLoader = new ImageLoader();
			bgImgLoader.source = bgTexture;
			bgImgLoader.width = 200;
			bgImgLoader.x = 90;//155;
			bgImgLoader.y = 5;
			bgImgLoader.maintainAspectRatio = true;
			contentPanel.addChild(bgImgLoader);
			
			
				this.button = new Button();
			this.button.label = "Start_Page";
			
			
			this.button.width=70;
			this.button.height=80;
			this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler4);
			this.buttonPanel.addChild(this.button);
			this.button = new Button();
			this.button.label = "Videos";
			
			this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler2);
			this.button.width=70;
			this.button.height=80;
			this.button.x=-10;
			this.button.y=10;
			
			this.buttonPanel.addChild(this.button);
			
			this.button = new Button();
			this.button.label = "Drawings";
				this.button.width=70;
			this.button.height=80;
			this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler1);
			this.buttonPanel.addChild(this.button);
			
			this.button = new Button();
			this.button.label = "Characters";
				this.button.width=70;
			this.button.height=80;
			this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler3);
			this.buttonPanel.addChild(this.button);
			
			this.button = new Button();
			this.button.label = "About";
			this.button.width=70;
			this.button.height=80;
			this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler5);
			this.buttonPanel.addChild(this.button);
			
			//this.Drawings.addEventListener(Event.TRIGGERED,drawings_image_triggered);
			
		
		}	
		
		private function button_triggeredHandler1(e: Event): void {
			bgImgLoader.source = atlas.getTexture("Characters");
			contentPanel.headerProperties.title = "Drawings";
			
			trace("Characters");
         
		}
		private function button_triggeredHandler2(e: Event): void {
			bgImgLoader.source = atlas.getTexture("Videos");
			//bgImgLoader.source = atlas.getTexture("About");
			contentPanel.headerProperties.title = "Videos";
			trace("Videos");
	
		}
	
		private function button_triggeredHandler3(e: Event): void {
			bgImgLoader.source = atlas.getTexture("Drawings");
			contentPanel.headerProperties.title = "Characters";
			trace("Drawings");
	
		}
			private function button_triggeredHandler4(e: Event): void {
			bgImgLoader.source = atlas.getTexture("About");
			contentPanel.headerProperties.title = "Start_Page";
		
           
			trace("About");
	
		}
				private function button_triggeredHandler5(e: Event): void {
			bgImgLoader.source = atlas.getTexture("About");
			contentPanel.headerProperties.title = "About";
		
           
			trace("About");
	
		}
		private function stageResized(e: Event): void {
			this.width = this.stage.stageWidth;
			this.height = this.stage.stageHeight;
			bgImgLoader.width = this.width;
			bgImgLoader.height = this.height;
		}
		
	}
	
}
