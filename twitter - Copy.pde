import gifAnimation.*;

import twitter4j.*;
import twitter4j.api.*;
import twitter4j.auth.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.management.*;
import twitter4j.util.*;
import twitter4j.util.function.*;

 import java.util.Date;
import java.util.*;

import processing.awt.PSurfaceAWT;
import java.awt.Robot;
import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import java.awt.Robot;
//screenshoot
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.imageio.ImageIO;
import java.awt.Robot;

 
//Déclaration des objets

TwitterFactory twitterFactory;
Twitter twitter;
RequestToken requestToken;
//Déclaration de l'objet requête
Query requete;
//Déclaration de l'objet de résultat de requête
QueryResult resultat;

//Déclaration d'un tableau pour stocker les requêtes récupérées de Twitter
ArrayList tweets;

//déclaration des variables textes qui nous permettront d'utiliser
//les résultats de requêtes
String msg, user, pseudo;
// Déclaration des objets TwitterFactory et Twitter 
 Status status;
String OAuthConsumerKey = "xx";
String OAuthConsumerSecret = "xx";
static String AccessToken = "xx";
static String AccessTokenSecret = "xx";
PImage img;
 PImage tower;
 
//List<Status> statuses = null;

boolean load=true;

Robot robot;
PFont pfont;
 
PImage screenShot;

  
String tweet_ = "#processing  #gif #happynewyear #your2017";
 
 File file = new File(sketchPath() + "/data/test.jpg");

GifMaker gifExport;
PImage logo;
void setup() {
  //Taille de la fenêtre de l'applet
  size(500, 500);
  smooth();
   frameRate(24);

  println("gifAnimation " + Gif.version());
  gifExport = new GifMaker(this, "/data/export.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
 // gifExport.setTransparent(0,0,0); // make black the transparent color. every black pixel in the animation will be transparent
  // GIF doesn't know have alpha values like processing. a pixel can only be totally transparent or totally opaque.
  // set the processing background and the transparent gif color to the same value as the gifs destination background color 
  // (e.g. the website bg-color). Like this you can have the antialiasing from processing in the gif.
 
  element();
  
  
saveFrame(sketchPath() + "/data/test.jpg");
  //Authentification
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("gf4HfzaBZ8dsBTbEyu4FHTgwk");
  cb.setOAuthConsumerSecret("pFULBrRfR6DPJJ2GBYVqYvkGsbEHWSFPb8ep0AVFnmm5s4gwJc");
  cb.setOAuthAccessToken("780488255800274944-Is9h0QmJG7pPFX8OhNednD7YHJLqKwY");
  cb.setOAuthAccessTokenSecret("ahe7k1eKEasTEpE7RtD9RmVdtDy9vfE2kqCk4fMvYEdD9");
  //Utilisation des informations d'authentification pour se connecter à l'API twitter
 TwitterFactory tf = new TwitterFactory(cb.build());
  twitter = tf.getInstance();
    
   // try{
      // **
      
     
 
  // Using just the path of this sketch to demonstrate,
  // but you can list any directory you like.
  

 file = new File(sketchPath()+ "/data/test.jpg");   
 testPassingFile(file );
  
         
//  statuses = twitter.getHomeTimeline();
 
 /**/
/*
      for (Status status:statuses){
 
        
        // 
        println(status.getUser().getName(),status.getText());
    

//status = twitter.updateStatus("love me ");
        
     
 }
    }catch(TwitterException e){
     println("Get timeline:" + e + "Status code:" + e.getStatusCode());
     */ 
      
      
    //}
}


void testPassingFile(File _file)
{
  println(_file.exists());
  println(_file.getName());
  println(_file.getPath());
  println(_file.canRead());
}



float ii=0;

final   int[] pos=new int[200];



void element(){

//background(0,1);
fill(0,80);
rect(0,0,500,500);
 
ellipseMode(CENTER);
//if(  frameCount<1)for(int i=0;i<200;i++)pos[i]=int(random(-50,50));

 
for(int i=1;i<10;i++)for(int z=0;z<5;z++){

float d= dist(250,250,100*(z),50*(i));
int centerx=250,centery=250;
float flot=20*sin(ii+=0.0001+PI*2);
float flotx=20*cos(ii+=0.001 +PI*2);


  

 fill(250/flot-flotx%ii%flot);
 rect(50+i*80,50+35*z,25,40);
 fill(250*flotx);
 //rect(0+z*80,10+35*i,10,150);
stroke(80+flotx/flot);
 fill(250/100,10);
 ellipse(centerx,centery,250,250);  
 fill(250*flotx,0,0); 
 stroke  (250,0,0); 
 strokeWeight(abs(flot));fill(250/100,10);
 ellipse(centerx,centery,250+flotx,250+flotx); 
  strokeWeight(1);
 fill(250/flot-flotx%ii%flot);
 ellipse(flotx/flot+centerx+80*sin(z/PI*2),flot/flotx+centery+80*cos(z/PI*2),10,10);
 fill(250,0,0);noStroke();
  ellipse(flot/flotx+centerx,flotx/flot+centery,50,50);

 
 
/*ellipse(50+100*(z),+50+
50*(i),d%ii*3%100+
(50*(cos( ii+=0.0002))-z%30),d%ii*3%100+(50*(cos( ii ))-z%30));
 fill(i*100,z*10,z*i*10,i*100);
//ellipse(100*(z),50*(i),(10*(cos( ii+=0.00010))-z%30),(10*(cos( ii ))-z%30));
ellipse(50+100*(z),+50+
50*(i),d%ii*3%100+
(20*(cos( ii+=0.0002))-z%30),
d%ii*3%100+(20*(cos( ii ))-z%30));
//println(frameCount);

;
*/
if(ii>20000)ii=0;
}



  gifExport.setDelay(1);
  gifExport.addFrame();
    if(frameCount==200){ gifExport.finish();
  println("gif saved");
} 
}

void draw() {
  //

element();
 if(!load) image (screenShot,0,0,550,500);
  textSize(15); 
text(tweet_,10,450);

}// Fonction d'envoi de tweet


// à chaque fois que nous cliquons dans la fenêtre de l'applet...
/*void mousePressed() {
 saveFrame(sketchPath() + "/data/test.jpg");

 try
    {
       StatusUpdate status = new StatusUpdate(tweet_);
       status.setMedia(file);
       twitter.updateStatus(status);
    }
    catch (TwitterException te)
    {
        println("Error: "+ te.getMessage()); 
    }
}
*/
void keyPressed (){
if(key=='1'){
  
  
  try { 
    robot = new Robot();
    robot.setAutoDelay(0);
  } 
  catch (Exception e) {
    e.printStackTrace();
  }
  
 //PImage pimage = new PImage(src); 
    
         Rectangle screenRect = new Rectangle( Toolkit.getDefaultToolkit().getScreenSize() );

     try {
        
        BufferedImage screenBuffer = new Robot().createScreenCapture( screenRect );
        
        screenShot = new PImage( screenBuffer.getWidth(), screenBuffer.getHeight(), PConstants.ARGB );
        screenBuffer.getRGB( 0, 0, screenShot.width, screenShot.height, screenShot.pixels, 0, screenShot.width );
        screenShot.updatePixels();
        load=false;
    } catch ( AWTException e ) {
        e.printStackTrace();
    }
  

saveFrame(sketchPath() + "/data/test.jpg");
 file = new File(sketchPath()+ "/data/test.jpg");   
 testPassingFile(file );


}
  

  
 



if(key=='2'){


 file = new File(sketchPath()+ "/data/export.gif");   
 testPassingFile(file );

}



if(key=='3'){
 try
    {
       StatusUpdate status = new StatusUpdate(tweet_);
       status.setMedia(file);
       twitter.updateStatus(status);
    }
    catch (TwitterException te)
    {
        println("Error: "+ te.getMessage()); 
    }
}

}