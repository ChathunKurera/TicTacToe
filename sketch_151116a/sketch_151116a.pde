import de.voidplus.myo.*;

Myo myo;
int[] ref;
int tmp = 0;
String lastPlayer;
Pose pose;

void setup() {
  size(600, 600); 
  background(255);

  myo = new Myo(this);
}

void draw() {
  int counter=0;
  for (int x=150; x < 450; x=x+100) {
    if (counter < 3) {
      int index=0;
      fill(255, 255, 255);
      stroke(0, 0, 0);
      strokeWeight(9);
      rect(x + index, 150, 100, 100 );
      index= index+100;
    }
    if (3 <= counter || counter < 6) {
      int index=0;
      fill(255, 255, 255);
      stroke(0, 0, 0);
      strokeWeight(9);
      rect(x + index, 250, 100, 100 );
      index= index+100;
    }
    if (6 <= counter || counter < 9) {
      int index=0;
      fill(255, 255, 255);
      stroke(0, 0, 0);
      rect(x + index, 350, 100, 100 );
      index= index+100;
    }
  }

  stroke(255, 255, 255);
  strokeWeight(9);
  line(150, 150, 150, 450);
  line(150, 150, 450, 150);
  line(450, 150, 450, 450);
  line(150, 450, 450, 450);

}

void gamePlay(int[] posArray) {
 while( matchWon(int[] posArray) == false ){
    switch (myo.getType()) {
      case LEFT:
        println("Left myo");
        break;
      case RIGHT:
        println("Right myo");
        break;
      }
   }
 }

void myoOnPose(Myo myo, long timestamp, Pose pose) {
  switch (pose.getType()) {
    case FIST:
      myo.vibrate();
      move();
      break;
    default:
      break;
    }
  }

void move() {
  if( tmp == 5){
    if (pose.getType().equals("FIST")) {
      tmp = 2;
    }
    if (pose.getType().equals("FINGERS_SPREAD")){
      tmp = 6;
    }
    if (pose.getType().equals("WAVE_IN")){
      tmp = 8;
    }
    if (pose.getType().equals("WAVE_OUT")){
      tmp = 4;
      drawPlayer();}
  }
   
    switch(tmp) {         
    case 2:
      if (keyCode == LEFT) {
        tmp = 1;
      } else if (keyCode == RIGHT) {
        tmp = 3;
      } else {
        tmp = 2;
      }

    case 4:
      if (keyCode == UP) {
        tmp = 1;
      } else if (keyCode == DOWN) {
        tmp = 7;
      } else {
        tmp = 4;
      }

    case 6:
      if (keyCode == UP) {
        tmp = 3;
      } else if (keyCode == DOWN) {
        tmp = 9;
      } else {
        tmp = 6;
      }

    case 8:
      if (keyCode == LEFT) {
        tmp = 7;
      } else if (keyCode == RIGHT) {
        tmp = 9;
      } else {
        tmp = 8;
      }
    default:
      break;
    }
  }



void drawPlayer() {
  int[] position = {0, 0, 0, 0, 0, 0, 0, 0, 0};

  // X == 13
  // O == 14;
  if(lastplayer == "playerA"){
  position[tmp] = 13;
  }
  else if (lastPlayer == "playerB") {
    position[tmp] = 14;
  }

  for (int i = 0; i<= 8; i++) {
    if (position[i] == 13) {
      drawX(i);
    } else if (position[i] == 14) {
      draw0(i);
    } else {
      //do nothing
    }
  }
}


void drawX(int index) {
  switch( index ) {
  case 0:
    {
      line(150+10, 150, 150 + 90, 150 + 90);
      line(150+10, 150+90, 150+90, 150+10);
      break;
    }
  case 1:
    {
      line(250+10, 150, 250 + 90, 150 + 90);
      line(250+10, 150+90, 250+90, 150+10);
      break;
    }
  case 2:
    {
      line(350+10, 150+10, 350 + 90, 150 + 90);
      line(350+10, 150+90, 350+90, 150+10);
      break;
    }
  case 3:
    {
      line(150+10, 250+10, 150 + 90, 250 + 90);
      line(150+10, 250+90, 150+90, 250+10);
      break;
    }
  case 4:
    {
      line(250+10, 250, 250 + 90, 250 + 90);
      line(250+10, 250+90, 250+90, 250+10);
      break;
    }
  case 5:
    {
      line(350+10, 250+10, 350 + 90, 250 + 90);
      line(350+10, 250+90, 350+90, 250+10);
      break;
    }
  case 6:
    {
      line(150+10, 350+10, 150 + 90, 350 + 90);
      line(150+10, 350+90, 150+90, 350+10);
      break;
    }
  case 7:
    {
      line(250+10, 350+10, 250 + 90, 350 + 90);
      line(250+10, 350+90, 250+90, 350+10);
      break;
    }
  case 8:
    {
      line(350+10, 350+10, 350 + 90, 350 + 90);
      line(350+10, 350+90, 350+90, 350+10);
      break;
    }
  }
}

void draw0(int index) {
  //  ellipse(tmp[0][0] +50,tmp[1][0]+50, 80,80);
  switch( index ) {
  case 0:
    {
      ellipse(150 +50, 150+50, 80, 80);
      break;
    }
  case 1:
    {
      ellipse(250 +50, 150+50, 80, 80);
      break;
    }
  case 2:
    {
      ellipse(350 +50, 150+50, 80, 80);
      break;
    }
  case 3:
    {
      ellipse(150 +50, 250+50, 80, 80);
      break;
    }
  case 4:
    {
      ellipse(250 +50, 250+50, 80, 80);
      break;
    }
  case 5:
    {
      ellipse(350 +50, 350+50, 80, 80);
      break;
    }
  case 6:
    {
      ellipse(150 +50, 350+50, 80, 80);
      break;
    }
  case 7:
    {
      ellipse(250 +50, 350+50, 80, 80);
      break;
    }
  case 8:
    {
      ellipse(350 +50, 350+50, 80, 80);
      break;
    }
  }
}

boolean matchWon( int[] arrayPos) {
  int counter=0;
  int x=0;
  for ( int shape =13; shape < 15; shape++) {
    while ( x < 3) {
      for (int i = 1 +x; i < 4 +x; i++) {
        if ( arrayPos[i] != shape)
          break;
        else counter++;
      }
      if (counter==3) return true;
      x = x+3;
    }

    x = 0;
    while ( x < 3) {
      for (int i = 1 + x; i < 10 + x; i=i+3) {
        if ( arrayPos[i] != shape)
          break;
        else counter++;
      }
      if (counter==3) return true;

      x = x++;
    }

    for (int i = 1 + x; i < 1 + x; i=i+4) {
      if ( arrayPos[i] != shape)
        break;
      else counter++;
    }
    if (counter==3) return true;

    for (int i = 3 + x; i < 8; i=i+2) {
      if ( arrayPos[i] != 14)
        break;
    }
  }
  return false;
}