public float lenChange = 0;
public boolean lenChanging = true;

public void setup()
{
	size(800,800);
	background(0);
}

public void draw()
{
	fractal(0,0,width);

	if(lenChanging)
	{
		if(lenChange > 400) { lenChange+=4; }
		else if(lenChange > 100) { lenChange+=2; }
		else { lenChange ++; }
	}
	else
	{
		if(lenChange < 100) { lenChange--; }
		else if(lenChange < 400) { lenChange-=2;}
		else { lenChange-=4; }
	}

	if(lenChange < -15 || lenChange > 700) { lenChanging = !lenChanging; }
}

// public void fractal(float x, float y, float sideLength, boolean square)
public void fractal(float x, float y, float len)
{
	noStroke();
	fill(210,140,255);
	
	if(len > 20+lenChange)
	{
		fractal(x,y,len/3);
		fractal(x+len/3,y,len/3);
		fractal(x+(2*len/3),y,len/3);

		fractal(x,y+len/3,len/3);
		fractal(x+(2*len/3),y+len/3,len/3);

		fractal(x,y+(2*len/3),len/3);
		fractal(x+len/3,y+(2*len/3),len/3);
		fractal(x+(2*len/3),y+(2*len/3),len/3);
	}
	else
	{
		rect(x,y,len,len);

		fill(0);
		rect(x+len/3,y+len/3,len/3,len/3);
	}

	// if(square)
	// {
	// 	strokeWeight(2);
	// 	rect(x,y,sideLength,sideLength);

	// 	ellipseMode(CORNER);
	// 	ellipse(x,y,sideLength,sideLength);
	// 	rect(x+(sideLength/8),y+(sideLength/8),3*sideLength/4,3*sideLength/4);
	// }
	// else
	// {
	// 	strokeWeight(1);
	// 	ellipseMode(CORNER);
	// 	ellipse(x,y,sideLength,sideLength);
	// }

	// if(sideLength > 10)
	// {
	// 	boolean nSquare = !square;
		
	// 	if(nSquare)
	// 	{
			
	// 	}
	// 	else
	// 	{
	// 		fractal(x+sideLength,y+sideLength,sideLength,nSquare);
	// 	}
	// }
}
