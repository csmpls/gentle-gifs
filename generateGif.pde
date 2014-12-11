

import gifAnimation.*;

GifMaker gifExport;

void setupGifExport() {
	gifExport = new GifMaker(this, getTimestamp() + ".gif");
	gifExport.setRepeat(0);             // make it an "endless" animation
	// gifExport.setTransparent(0,0,0);    // black is transparent
} 

void addToGif() {
	gifExport.setDelay(1);
    gifExport.addFrame();
}


String getTimestamp() {
	return str(millis());
}