public float fractSize;
public float ekkusu, wai;
public float sizeChange = 2;
public float increment = 1;

public void setup()
{
  background(0);
  size(601,601);
  fractSize = width-1;
}

public void draw()
{
  background(0);
  
  fractal(ekkusu,wai,fractSize,true);
  fractSize += sizeChange;
  ekkusu-= (sizeChange/2);
  wai-= (sizeChange/2);
  
  if(fractSize > width*sqrt(2)*increment)
  {
    sizeChange+=increment;
    increment+=0.4;
  }
}

public void fractal(float x, float y, float sideLength, boolean square)
{
  stroke(0,255,0);
  noFill();
  
  if(sideLength < width*sqrt(2))
  {
    if(square)
    {
       strokeWeight(2);
       rect(x,y,sideLength,sideLength);
    }
    else
    {
      strokeWeight(1);
      ellipseMode(CORNER);
      ellipse(x,y,sideLength,sideLength);
    }
  }

  if(sideLength > 60)
  {
    boolean nSquare = !square;
 
    if(nSquare)
    {
      double ex = (sideLength - (sideLength)/Math.sqrt(2))/2;
      double ey = sideLength/Math.sqrt(2);
      fractal((float)(x+ex),(float)(y+ex),(float)ey,nSquare);
    }
    else
    {
      fractal(x,y,sideLength,nSquare);
    }
  }
}