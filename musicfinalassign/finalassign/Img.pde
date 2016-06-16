class Img{
      PImage background;
      PImage greengirl;
      PImage greengirlopen;     
      PImage heart;
      PImage startimage;
      PImage endimage;
      PImage house;
      PImage change;
      PImage up;
      PImage down;
      PImage left;
      PImage right;
      
      Img(){
        this.endimage   = loadImage("data/END.png");
        this.startimage = loadImage("data/START.png");
        this.background = loadImage("data/background.png") ;
        this.greengirl  = loadImage("data/ggirl.png");
        this.heart      = loadImage("data/heart.png");
        this.greengirlopen    = loadImage("data/ggirlopen.png");
        this.house      = loadImage("data/house.png");
        this.change      = loadImage("data/change.png");
        this.up      = loadImage("data/up.png");
        this.down      = loadImage("data/down.png");
        this.left      = loadImage("data/left.png");
        this.right      = loadImage("data/right.png");        
      }
      
      void show(){
       image(this.background,0,0);
       image(this.house,0,0);
       image(this.greengirl,childrenX+155,childrenY,childrenXsize,childrenYsize);
      }
      void ggirleat(){
        image(this.greengirlopen,childrenX+155,childrenY,childrenXsize,childrenYsize);
      }
      void startshow(){
       image(this.startimage,0,0);
      }
      void change(){
       image(this.change,0,0); 
      }
      void endshow(){
        image(this.endimage,0,0);
      }
}
