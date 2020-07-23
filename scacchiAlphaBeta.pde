PImage T1;
PImage T2;
PImage C1;
PImage C2;
PImage A1;
PImage A2;
PImage K1;
PImage K2;
PImage Q1;
PImage Q2;
PImage P1;
PImage P2;
PFont Font1;


void setup() {
  size (720, 720);
  Font1 = createFont("P052-Bold", 20);
  textFont(Font1);
  T1 = loadImage("T1.jpg");
  T2 = loadImage("T2.jpg");
  C1 = loadImage("C1.jpg");
  C2 = loadImage("C2.jpg");
  A1 = loadImage("A1.png");
  A2 = loadImage("A2.png");
  K1 = loadImage("K1.png");
  K2 = loadImage("K2.png");
  Q1 = loadImage("Q1.png");
  Q2 = loadImage("Q2.png");
  P1 = loadImage("P1.png");
  P2 = loadImage("P2.png");
}

String[][] scacchiera = {
  {"T1", "C1", "A1", "Q1", "K1", "A1", "C1", "T1"}, 
  {"P1", "P1", "P1", "P1", "P1", "P1", "P1", "P1"}, 
  {"  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "}, 
  {"  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "}, 
  {"  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "}, 
  {"  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "}, 
  {"P2", "P2", "P2", "P2", "P2", "P2", "P2", "P2"}, 
  {"T2", "C2", "A2", "Q2", "K2", "A2", "C2", "T2"}, 

};

int p = 1;
int l;
int attualeX = -1;
int attualeY = -1;
int primax = -1;
int primay = -1;
int profondita = 6;
int dx = -1;
int dy = -1;
int mossaPrecY = -1;
int mossaPrecX = -1;
int conto = 0;
int delay = 20;
boolean flagConto = false;
boolean flagLoading = false;
boolean gameAlive = true;
boolean vinceBianco = false;
boolean vinceNero = false;
boolean maiMossaT1S = true;
boolean maiMossaT1D = true;
boolean maiMossoK1 = true;
boolean maiMossaT2S = true;
boolean maiMossaT2D = true;
boolean maiMossoK2 = true;

String pedinaDaMuovere = "  ";
void draw() {

  if (gameAlive) {
    int grandTesto;
    l = width/8;
    vinceBianco = true;
    vinceNero = true;
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (i%2==j%2) {
          fill(0);
          if (j==attualeY&&i==attualeX&&!flag) fill(240, 230, 140);
          if ((j==mossaPrecY&&i==mossaPrecX)||(j==dy&&i==dx)) fill(135, 206, 250);
          rect(i*l, j*l, l, l);
          fill(255, 0, 0);
          if (scacchiera[j][i] == "P2") image(P2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "T2") image(T2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "C2") image(C2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "A2") image(A2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "K2") {
            image(K2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8); 
            vinceBianco = false;
          } else if (scacchiera[j][i] == "Q2") image(Q2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "P1") image(P1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "T1") image(T1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "C1") image(C1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "A1") image(A1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "K1") {
            image(K1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8); 
            vinceNero = false;
          } else if (scacchiera[j][i] == "Q1") image(Q1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          //text(scacchiera[j][i], i*l+l/2-grandTesto/2, j*l+l/2);
        } else {
          fill(255);
          if (j==attualeY&&i==attualeX&&!flag) fill(240, 230, 140);
          if ((j==mossaPrecY&&i==mossaPrecX)||(j==dy&&i==dx)) fill(135, 206, 250);
          rect(i*l, j*l, l, l);
          fill(255, 0, 0);  
          if (scacchiera[j][i] == "P2") image(P2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "T2") image(T2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "C2") image(C2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "A2") image(A2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "K2") {
            image(K2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8); 
            vinceBianco = false;
          } else if (scacchiera[j][i] == "Q2") image(Q2, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "P1") image(P1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "T1") image(T1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "C1") image(C1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "A1") image(A1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          else if (scacchiera[j][i] == "K1") {
            image(K1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8); 
            vinceNero = false;
          } else if (scacchiera[j][i] == "Q1") image(Q1, i*l+l*1.5/8, j*l+l/8, l*5/8, l*6/8);
          //text(scacchiera[j][i], i*l+l/2-grandTesto/2, j*l+l/2);
        }
      }
    }
    if (vinceBianco) {
      fill(255, 127, 80);
      grandTesto =70;
      textSize(grandTesto);
      text("WHITE WINS!", width/2-grandTesto*3.5, height/2+grandTesto/3);
      gameAlive = false;
    } else if (vinceNero) {
      fill(255, 127, 80);
      grandTesto = 70;
      textSize(grandTesto);
      text("BLACK WINS!", width/2-grandTesto*3.5, height/2+grandTesto/3);
      gameAlive = false;
    }
    if (flagLoading&&p==2) {
      fill(255, 0, 0);
      grandTesto=40;
      textSize(grandTesto);
      text("LOADING...", width/2-grandTesto*3, height/2-height/20);
    }
    if (flagConto) conto++;
    if (conto==delay) {
      conto = 0;
      flagConto = false;
      if (p == 2) {
        int depth=profondita;
        String[][] scacchieraAttuale = new String[8][8];
        for (int i = 0; i < 8; i++)
          for (int j = 0; j < 8; j++)
            scacchieraAttuale[i][j] = scacchiera[i][j];
        calcola(depth, scacchieraAttuale);
        flagLoading = false;
      }
    }
  }
}
int maxi(int max, int min, int depth, String[][] scacchieraA) {
  if ( depth == 0 ) return evaluate(scacchieraA);
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (scacchieraA[i][j] == "P2") {
        for (int m = -2; m<=2; m++) {
          for (int n = -2; n <=2; n++) {
            if (controllaP2(j+n, i+m, j, i, scacchieraA)) {
              String prec = scacchieraA[i+m][j+n];
              scacchieraA[i][j] = "  ";
              scacchieraA[i+m][j+n] = "P2";
              int score = mini(max, min, depth - 1, scacchieraA);

              if (score >= min) {
                scacchieraA[i][j] = "P2";
                scacchieraA[i+m][j+n] = prec;
                return min;
              }

              if ( score > max ) {
                max = score;
                if (depth == profondita) {
                  primax = j;
                  primay = i;
                  dx = j+n;
                  dy = i+m;
                  pedinaDaMuovere = "P2";
                }
              } 

              scacchieraA[i][j] = "P2";
              scacchieraA[i+m][j+n] = prec;
            }
          }
        }
      } else if (scacchieraA[i][j] == "T2") {
        for (int m = -7; m<=7; m++) {
          if (controllaT2(j, i+m, j, i, scacchieraA)) {
            String prec = scacchieraA[i+m][j];
            scacchieraA[i][j] = "  ";
            scacchieraA[i+m][j] = "T2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "T2";
              scacchieraA[i+m][j] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j;
                dy = i+m;
                pedinaDaMuovere = "T2";
              }
            }
            scacchieraA[i][j] = "T2";
            scacchieraA[i+m][j] = prec;
          }
          if (controllaT2(j+m, i, j, i, scacchieraA)) {
            String prec = scacchieraA[i][j+m];
            scacchieraA[i][j] = "  ";
            scacchieraA[i][j+m] = "T2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "T2";
              scacchieraA[i][j+m] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j+m;
                dy = i;
                pedinaDaMuovere = "T2";
              }
            }
            scacchieraA[i][j] = "T2";
            scacchieraA[i][j+m] = prec;
          }
        }
      } else if (scacchieraA[i][j] == "C2") {
        for (int m = -3; m<=3; m++) {
          for (int n = -3; n <=3; n++) {
            if (controllaC2(j+n, i+m, j, i, scacchieraA)) {
              String prec = scacchieraA[i+m][j+n];
              scacchieraA[i][j] = "  ";
              scacchieraA[i+m][j+n] = "C2";
              int score = mini(max, min, depth - 1, scacchieraA);
              if (score >= min) {
                scacchieraA[i][j] = "C2";
                scacchieraA[i+m][j+n] = prec;
                return min;
              }
              if ( score > max ) {
                max = score;
                if (depth == profondita) {

                  primax = j;
                  primay = i;
                  dx = j+n;
                  dy = i+m;
                  //println("a:", i, j);
                  pedinaDaMuovere = "C2";
                }
              }
              scacchieraA[i][j] = "C2";
              scacchieraA[i+m][j+n] = prec;
            }
          }
        }
      } else if (scacchieraA[i][j] == "A2") {
        for (int m = 1; m<=7; m++) {
          if (controllaA2(j+m, i+m, j, i, scacchieraA)) {
            String prec = scacchieraA[i+m][j+m];
            scacchieraA[i][j] = "  ";
            scacchieraA[i+m][j+m] = "A2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "A2";
              scacchieraA[i+m][j+m] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j+m;
                dy = i+m;
                pedinaDaMuovere = "A2";
              }
            }
            scacchieraA[i][j] = "A2";
            scacchieraA[i+m][j+m] = prec;
          }
          if (controllaA2(j+m, i-m, j, i, scacchieraA)) {
            String prec = scacchieraA[i-m][j+m];
            scacchieraA[i][j] = "  ";
            scacchieraA[i-m][j+m] = "A2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "A2";
              scacchieraA[i-m][j+m] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j+m;
                dy = i-m;
                pedinaDaMuovere = "A2";
              }
            }
            scacchieraA[i][j] = "A2";
            scacchieraA[i-m][j+m] = prec;
          }
          if (controllaA2(j-m, i+m, j, i, scacchieraA)) {
            String prec = scacchieraA[i+m][j-m];
            scacchieraA[i][j] = "  ";
            scacchieraA[i+m][j-m] = "A2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "A2";
              scacchieraA[i+m][j-m] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j-m;
                dy = i+m;
                pedinaDaMuovere = "A2";
              }
            }
            scacchieraA[i][j] = "A2";
            scacchieraA[i+m][j-m] = prec;
          }
          if (controllaA2(j-m, i-m, j, i, scacchieraA)) {
            String prec = scacchieraA[i-m][j-m];
            scacchieraA[i][j] = "  ";
            scacchieraA[i-m][j-m] = "A2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "A2";
              scacchieraA[i-m][j-m] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j-m;
                dy = i-m;
                pedinaDaMuovere = "A2";
              }
            }
            scacchieraA[i][j] = "A2";
            scacchieraA[i-m][j-m] = prec;
          }
        }
      } else if (scacchieraA[i][j] == "K2") {
        for (int m = -1; m<=1; m++) {
          for (int n = -1; n <=1; n++) {
            if (controllaK2(j+n, i+m, j, i, scacchieraA)) {
              String prec = scacchieraA[i+m][j+n];
              scacchieraA[i][j] = "  ";
              scacchieraA[i+m][j+n] = "K2";
              int score = mini(max, min, depth - 1, scacchieraA);
              if (score >= min) {
                scacchieraA[i][j] = "K2";
                scacchieraA[i+m][j+n] = prec;
                return min;
              }
              if ( score > max ) {
                max = score;
                if (depth == profondita) {
                  primax = j;
                  primay = i;
                  dx = j+n;
                  dy = i+m;
                  pedinaDaMuovere = "K2";
                }
              }
              scacchieraA[i][j] = "K2";
              scacchieraA[i+m][j+n] = prec;
            }
          }
        }
      } else if (scacchieraA[i][j] == "Q2") {
        for (int m = 1; m<=7; m++) {
          if (controllaQ2(j+m, i+m, j, i, scacchieraA)) {
            String prec = scacchieraA[i+m][j+m];
            scacchieraA[i][j] = "  ";
            scacchieraA[i+m][j+m] = "Q2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "Q2";
              scacchieraA[i+m][j+m] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j+m;
                dy = i+m;
                pedinaDaMuovere = "Q2";
              }
            }
            scacchieraA[i][j] = "Q2";
            scacchieraA[i+m][j+m] = prec;
          }
          if (controllaQ2(j-m, i+m, j, i, scacchieraA)) {
            String prec = scacchieraA[i+m][j-m];
            scacchieraA[i][j] = "  ";
            scacchieraA[i+m][j-m] = "Q2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "Q2";
              scacchieraA[i+m][j-m] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j-m;
                dy = i+m;
                pedinaDaMuovere = "Q2";
              }
            }
            scacchieraA[i][j] = "Q2";
            scacchieraA[i+m][j-m] = prec;
          }
          if (controllaQ2(j+m, i-m, j, i, scacchieraA)) {
            String prec = scacchieraA[i-m][j+m];
            scacchieraA[i][j] = "  ";
            scacchieraA[i-m][j+m] = "Q2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "Q2";
              scacchieraA[i-m][j+m] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j+m;
                dy = i-m;
                pedinaDaMuovere = "Q2";
              }
            }
            scacchieraA[i][j] = "Q2";
            scacchieraA[i-m][j+m] = prec;
          }
          if (controllaQ2(j-m, i-m, j, i, scacchieraA)) {
            String prec = scacchieraA[i-m][j-m];
            scacchieraA[i][j] = "  ";
            scacchieraA[i-m][j-m] = "Q2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "Q2";
              scacchieraA[i-m][j-m] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j-m;
                dy = i-m;
                pedinaDaMuovere = "Q2";
              }
            }
            scacchieraA[i][j] = "Q2";
            scacchieraA[i-m][j-m] = prec;
          }
        }
        for (int m = -7; m<=7; m++) {
          if (controllaQ2(j, i+m, j, i, scacchieraA)) {
            String prec = scacchieraA[i+m][j];
            scacchieraA[i][j] = "  ";
            scacchieraA[i+m][j] = "Q2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "Q2";
              scacchieraA[i+m][j] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j;
                dy = i+m;
                pedinaDaMuovere = "Q2";
              }
            }
            scacchieraA[i][j] = "Q2";
            scacchieraA[i+m][j] = prec;
          }
          if (controllaQ2(j+m, i, j, i, scacchieraA)) {
            String prec = scacchieraA[i][j+m];
            scacchieraA[i][j] = "  ";
            scacchieraA[i][j+m] = "Q2";
            int score = mini(max, min, depth - 1, scacchieraA);
            if (score >= min) {
              scacchieraA[i][j] = "Q2";
              scacchieraA[i][j+m] = prec;
              return min;
            }
            if ( score > max ) {
              max = score;
              if (depth == profondita) {
                primax = j;
                primay = i;
                dx = j+m;
                dy = i;
                pedinaDaMuovere = "Q2";
              }
            }
            scacchieraA[i][j] = "Q2";
            scacchieraA[i][j+m] = prec;
          }
        }
      }
    }
  }
  return max;
}

int mini(int max, int min, int depth, String[][] scacchieraB) {
  if ( depth == 0 ) return evaluate(scacchieraB);
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (scacchieraB[i][j] == "P1") {
        for (int m = -2; m<=2; m++) {
          for (int n = -2; n <=2; n++) {
            if (controllaP(j+n, i+m, j, i, scacchieraB)) {
              String prec = scacchieraB[i+m][j+n];
              scacchieraB[i][j] = "  ";
              scacchieraB[i+m][j+n] = "P1";
              int score = maxi(max, min, depth - 1, scacchieraB);
              if (score <= max) {
                scacchieraB[i][j] = "P1";
                scacchieraB[i+m][j+n] = prec;
                return max;
              }
              if ( score < min ) {
                min = score;
              }
              scacchieraB[i][j] = "P1";
              scacchieraB[i+m][j+n] = prec;
            }
          }
        }
      } else if (scacchieraB[i][j] == "T1") {
        for (int m = -7; m<=7; m++) {
          if (controllaT(j, i+m, j, i, scacchieraB)) {
            String prec = scacchieraB[i+m][j];
            scacchieraB[i][j] = "  ";
            scacchieraB[i+m][j] = "T1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "T1";
              scacchieraB[i+m][j] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "T1";
            scacchieraB[i+m][j] = prec;
          }
          if (controllaT(j+m, i, j, i, scacchieraB)) {
            String prec = scacchieraB[i][j+m];
            scacchieraB[i][j] = "  ";
            scacchieraB[i][j+m] = "T1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "T1";
              scacchieraB[i][j+m] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "T1";
            scacchieraB[i][j+m] = prec;
          }
        }
      } else if (scacchieraB[i][j] == "C1") {
        for (int m = -3; m<=3; m++) {
          for (int n = -3; n <=3; n++) {
            if (controllaC(j+n, i+m, j, i, scacchieraB)) {
              String prec = scacchieraB[i+m][j+n];
              scacchieraB[i][j] = "  ";
              scacchieraB[i+m][j+n] = "C1";
              int score = maxi(max, min, depth - 1, scacchieraB);
              if (score <= max) {
                scacchieraB[i][j] = "C1";
                scacchieraB[i+m][j+n] = prec;
                return max;
              }
              if ( score < min ) {
                min = score;
              }
              scacchieraB[i][j] = "C1";
              scacchieraB[i+m][j+n] = prec;
            }
          }
        }
      } else if (scacchieraB[i][j] == "A1") {
        for (int m = 1; m<=7; m++) {
          if (controllaA(j+m, i+m, j, i, scacchieraB)) {
            String prec = scacchieraB[i+m][j+m];
            scacchieraB[i][j] = "  ";
            scacchieraB[i+m][j+m] = "A1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "A1";
              scacchieraB[i+m][j+m] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "A1";
            scacchieraB[i+m][j+m] = prec;
          }
          if (controllaA(j-m, i+m, j, i, scacchieraB)) {
            String prec = scacchieraB[i+m][j-m];
            scacchieraB[i][j] = "  ";
            scacchieraB[i+m][j-m] = "A1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "A1";
              scacchieraB[i+m][j-m] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "A1";
            scacchieraB[i+m][j-m] = prec;
          }
          if (controllaA(j+m, i-m, j, i, scacchieraB)) {
            String prec = scacchieraB[i-m][j+m];
            scacchieraB[i][j] = "  ";
            scacchieraB[i-m][j+m] = "A1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "A1";
              scacchieraB[i-m][j+m] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "A1";
            scacchieraB[i-m][j+m] = prec;
          }
          if (controllaA(j-m, i-m, j, i, scacchieraB)) {
            String prec = scacchieraB[i-m][j-m];
            scacchieraB[i][j] = "  ";
            scacchieraB[i-m][j-m] = "A1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "A1";
              scacchieraB[i-m][j-m] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "A1";
            scacchieraB[i-m][j-m] = prec;
          }
        }
      } else if (scacchieraB[i][j] == "K1") {
        for (int m = -1; m<=1; m++) {
          for (int n = -1; n <=1; n++) {
            if (controllaK(j+n, i+m, j, i, scacchieraB)) {
              String prec = scacchieraB[i+m][j+n];
              scacchieraB[i][j] = "  ";
              scacchieraB[i+m][j+n] = "K1";
              int score = maxi(max, min, depth - 1, scacchieraB);
              if (score <= max) {
                scacchieraB[i][j] = "K1";
                scacchieraB[i+m][j+n] = prec;
                return max;
              }
              if ( score < min ) {
                min = score;
              }
              scacchieraB[i][j] = "K1";
              scacchieraB[i+m][j+n] = prec;
            }
          }
        }
      } else if (scacchieraB[i][j] == "Q1") {
        for (int m = 1; m<=7; m++) {
          if (controllaA(j+m, i+m, j, i, scacchieraB)) {
            String prec = scacchieraB[i+m][j+m];
            scacchieraB[i][j] = "  ";
            scacchieraB[i+m][j+m] = "Q1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "Q1";
              scacchieraB[i+m][j+m] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "Q1";
            scacchieraB[i+m][j+m] = prec;
          }
          if (controllaA(j-m, i+m, j, i, scacchieraB)) {
            String prec = scacchieraB[i+m][j-m];
            scacchieraB[i][j] = "  ";
            scacchieraB[i+m][j-m] = "Q1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "Q1";
              scacchieraB[i+m][j-m] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "Q1";
            scacchieraB[i+m][j-m] = prec;
          }
          if (controllaA(j+m, i-m, j, i, scacchieraB)) {
            String prec = scacchieraB[i-m][j+m];
            scacchieraB[i][j] = "  ";
            scacchieraB[i-m][j+m] = "Q1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "Q1";
              scacchieraB[i-m][j+m] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "Q1";
            scacchieraB[i-m][j+m] = prec;
          }
          if (controllaA(j-m, i-m, j, i, scacchieraB)) {
            String prec = scacchieraB[i-m][j-m];
            scacchieraB[i][j] = "  ";
            scacchieraB[i-m][j-m] = "Q1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "Q1";
              scacchieraB[i-m][j-m] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "Q1";
            scacchieraB[i-m][j-m] = prec;
          }
        }
        for (int m = -7; m<=7; m++) {
          if (controllaT(j, i+m, j, i, scacchieraB)) {
            String prec = scacchieraB[i+m][j];
            scacchieraB[i][j] = "  ";
            scacchieraB[i+m][j] = "Q1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "Q1";
              scacchieraB[i+m][j] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "Q1";
            scacchieraB[i+m][j] = prec;
          }
          if (controllaT(j+m, i, j, i, scacchieraB)) {
            String prec = scacchieraB[i][j+m];
            scacchieraB[i][j] = "  ";
            scacchieraB[i][j+m] = "Q1";
            int score = maxi(max, min, depth - 1, scacchieraB);
            if (score <= max) {
              scacchieraB[i][j] = "Q1";
              scacchieraB[i][j+m] = prec;
              return max;
            }
            if ( score < min ) {
              min = score;
            }
            scacchieraB[i][j] = "Q1";
            scacchieraB[i][j+m] = prec;
          }
        }
      }
    }
  }
  return min;
}

void calcola(int depth, String[][] scacchieraC) {
  int cacca = maxi(-1000000000, 1000000000, depth, scacchieraC);
  //println(primay, primax, ": ", dy, dx, pedinaDaMuovere);
  scacchiera[primay][primax] = "  ";
  mossaPrecY=primay;
  mossaPrecX=primax;
  //println(pedinaDaMuovere+": dx"+dx+" "+"dy"+dy);
  scacchiera[dy][dx] = pedinaDaMuovere;
  //println(dy, dx);
  p = 1;
}

int evaluate(String[][] scacchieraD) {
  int ris = 0;
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (scacchieraD[i][j] == "P2") ris+=2;
      else if (scacchieraD[i][j] == "T2") ris+=5;
      else if (scacchieraD[i][j] == "C2") ris+=4;
      else if (scacchieraD[i][j] == "A2") ris+=4;
      else if (scacchieraD[i][j] == "K2") ris+=10000;
      else if (scacchieraD[i][j] == "Q2") ris+=10;
      else if (scacchieraD[i][j] == "P1") ris-=2;
      else if (scacchieraD[i][j] == "T1") ris-=5;
      else if (scacchieraD[i][j] == "C1") ris-=4;
      else if (scacchieraD[i][j] == "A1") ris-=4;
      else if (scacchieraD[i][j] == "K1") ris-=10000;
      else if (scacchieraD[i][j] == "Q1") ris-=10;
    }
  }
  return ris;
}
boolean controllaT(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (x==pX) {
    if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][x]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][x]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else return false;
  } else if (y == pY) {
    if (x < pX) {
      for (int i = x+1; i < pX; i++) {
        if (scacchieraE[y][i]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else if (x > pX) {
      for (int i = x-1; i > pX; i--) {
        if (scacchieraE[y][i]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else return false;
  } else return false;
}
boolean controllaT2(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (x==pX) {
    if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][x]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][x]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else return false;
  } else if (y == pY) {
    if (x < pX) {
      for (int i = x+1; i < pX; i++) {
        if (scacchieraE[y][i]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else if (x > pX) {
      for (int i = x-1; i > pX; i--) {
        if (scacchieraE[y][i]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else return false;
  } else return false;
}

boolean controllaC(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (abs(y-pY) == 2) {
    if (abs(x-pX) == 1) {
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      else return true;
    } else return false;
  } else if (abs(x-pX) == 2) {
    if (abs(y-pY) == 1) {
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      else return true;
    } else return false;
  } else return false;
}
boolean controllaC2(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (abs(y-pY) == 2) {
    if (abs(x-pX) == 1) {
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      else return true;
    } else return false;
  } else if (abs(x-pX) == 2) {
    if (abs(y-pY) == 1) {
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      else return true;
    } else return false;
  } else return false;
}
boolean controllaA2(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (pY-pX==y-x) {
    if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][i-(pY-pX)]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][i-(pY-pX)]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else return false;
  } else if (pY-y==x-pX) {
    if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][(pY+pX)-i]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][(pY+pX)-i]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else return false;
  } else return false;
}

boolean controllaK2(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (y==pY&&x==pX) return false;
  if (y-pY<=-1&&y-pY>=1&&x-pX<=-1&&x-pX>=1) {
    if (scacchieraE[y][x].charAt(1)!='2') {
      return true;
    } else return false;
  } else if (pX==4&&pY==7&&x==2&&y==7) {
    if (scacchieraE[7][0]=="T2"&&scacchieraE[7][1]=="  "&&scacchieraE[7][2]=="  "&&scacchieraE[7][3]=="  "&&maiMossaT2S&&maiMossoK2) return true;
    else return false;
  } else if (pX==4&&pY==7&&x==6&&y==7) {
    if (scacchieraE[7][7]=="T2"&&scacchieraE[7][6]=="  "&&scacchieraE[7][5]=="  "&&maiMossaT2D&&maiMossoK2) return true;
    else return false;
  } else return false;
}

boolean controllaQ2(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (x==pX) {
    if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][x]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][x]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else return false;
  } else if (y == pY) {
    if (x < pX) {
      for (int i = x+1; i < pX; i++) {
        if (scacchieraE[y][i]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else if (x > pX) {
      for (int i = x-1; i > pX; i--) {
        if (scacchieraE[y][i]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else return false;
  } else if (pY-pX==y-x) {
    if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][i-(pY-pX)]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][i-(pY-pX)]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else return false;
  } else if (pY-y==x-pX) {
    if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][(pY+pX)-i]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][(pY+pX)-i]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='2') return false;
      return true;
    } else return false;
  } else return false;
}

boolean controllaP2(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (x==pX) {
    if (y-pY==-2 && (pY == 6)) {
      if (scacchieraE[y][x] != "  ") return false;
      else return true;
    } else if (y-pY==-1) {
      if (scacchieraE[y][x] != "  ") return false;
      else return true;
    } else return false;
  } else if (x==pX+1) {
    if (y-pY == -1) {
      if (scacchieraE[y][x].charAt(1)=='1') return true;
      return false;
    } else return false;
  } else if (x==pX-1) {
    if (y-pY == -1) {
      if (scacchieraE[y][x].charAt(1)=='1') return true;
      return false;
    } else return false;
  }

  return false;
}
boolean controllaA(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (pY-pX==y-x) {
    if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][i-(pY-pX)]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][i-(pY-pX)]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else return false;
  } else if (pY-y==x-pX) {
    if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][(pY+pX)-i]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][(pY+pX)-i]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else return false;
  } else return false;
}

boolean controllaK(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (y==pY&&x==pX) return false;
  if (y-pY<=1&&y-pY>=-1&&x-pX<=1&&x-pX>=-1) {
    if (scacchieraE[y][x].charAt(1)!='1') {
      return true;
    } else return false;
  } else if (pX==4&&pY==0&&x==2&&y==0) {
    if (scacchieraE[0][0]=="T1"&&scacchieraE[0][1]=="  "&&scacchieraE[0][2]=="  "&&scacchieraE[0][3]=="  "&&maiMossaT1S&&maiMossoK1) return true;
    else return false;
  } else if (pX==4&&pY==0&&x==6&&y==0) {
    if (scacchieraE[0][7]=="T1"&&scacchieraE[0][6]=="  "&&scacchieraE[0][5]=="  "&&maiMossaT1D&&maiMossoK1) return true;
    else return false;
  } else return false;
}

boolean controllaQ(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (x==pX) {
    if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][x]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][x]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else return false;
  } else if (y == pY) {
    if (x < pX) {
      for (int i = x+1; i < pX; i++) {
        if (scacchieraE[y][i]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else if (x > pX) {
      for (int i = x-1; i > pX; i--) {
        if (scacchieraE[y][i]!="  ") return false;
      } 
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else return false;
  } else if (pY-pX==y-x) {
    if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][i-(pY-pX)]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][i-(pY-pX)]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else return false;
  } else if (pY-y==x-pX) {
    if (y > pY) {
      for (int i = y-1; i > pY; i--) {
        if (scacchieraE[i][(pY+pX)-i]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else if (y < pY) {
      for (int i = y+1; i < pY; i++) {
        if (scacchieraE[i][(pY+pX)-i]!="  ") return false;
      }
      if (scacchieraE[y][x].charAt(1)=='1') return false;
      return true;
    } else return false;
  } else return false;
}

boolean controllaP(int x, int y, int pX, int pY, String[][] scacchieraE) {
  if (x<0||x>7||y<0||y>7) return false;
  if (x==pX) {
    if (y-pY==2 && (pY == 1)) {
      if (scacchieraE[y][x] != "  ") return false;
      else return true;
    } else if (y-pY==1) {
      if (scacchieraE[y][x] != "  ") return false;
      else return true;
    } else return false;
  } else if (x==pX+1) {
    if (y-pY == 1) {
      if (scacchieraE[y][x].charAt(1)=='2') return true;
      return false;
    } else return false;
  } else if (x==pX-1) {
    if (y-pY == 1) {
      if (scacchieraE[y][x].charAt(1)=='2') return true;
      return false;
    } else return false;
  }

  return false;
}

boolean flag = true;
String pedina= "x";
int pX = -1;
int pY = -1;

void mouseClicked() {
  if (gameAlive) {
    if (p == 1) {
      if (flag) {   
        pX = mouseX/l;
        pY = mouseY/l;
        if (scacchiera[mouseY/l][mouseX/l].charAt(1)=='1') {
          attualeX = pX;
          attualeY = pY;
          pedina = scacchiera[mouseY/l][mouseX/l];
          flag = false;
        }
      } else {
        flagConto = true;

        flagLoading = true;
        if (mouseX/l == pX && mouseY/l == pY) {
          flag = true;
          flagLoading = false;
        } else {

          if (pedina=="T1") {
            if (controllaT(mouseX/l, mouseY/l, pX, pY, scacchiera)) {
              scacchiera[pY][pX] = "  ";
              scacchiera[mouseY/l][mouseX/l] = "T1";
              flag = true;
              p=2;
            }
          } else if (pedina=="C1") {
            if (controllaC(mouseX/l, mouseY/l, pX, pY, scacchiera)) {
              scacchiera[pY][pX] = "  ";
              scacchiera[mouseY/l][mouseX/l] = "C1";
              flag = true;

              p=2;
            }
          } else if (pedina=="A1") {
            if (controllaA(mouseX/l, mouseY/l, pX, pY, scacchiera)) {
              scacchiera[pY][pX] = "  ";
              scacchiera[mouseY/l][mouseX/l] = "A1";
              flag = true;

              p=2;
            }
          } else if (pedina=="K1") {
            if (controllaK(mouseX/l, mouseY/l, pX, pY, scacchiera)) {
              scacchiera[pY][pX] = "  ";
              scacchiera[mouseY/l][mouseX/l] = "K1";
              if (pX==4&&pY==0&&mouseX/l==2&&mouseY/l==0) {
                scacchiera[pY][pX] = "  ";
                scacchiera[mouseY/l][mouseX/l] = "K1";
                scacchiera[0][3] = "T1";
                scacchiera[0][0] = "  ";
              } else if (pX==4&&pY==0&&mouseX/l==6&&mouseY/l==0) {
                scacchiera[pY][pX] = "  ";
                scacchiera[mouseY/l][mouseX/l] = "K1";
                scacchiera[0][5] = "T1";
                scacchiera[0][7] = "  ";
              }
              flag = true;

              p=2;
            }
          } else if (pedina=="Q1") {
            if (controllaQ(mouseX/l, mouseY/l, pX, pY, scacchiera)) {
              scacchiera[pY][pX] = "  ";
              scacchiera[mouseY/l][mouseX/l] = "Q1";
              flag = true;

              p=2;
            }
          } else if (pedina=="P1") {
            if (controllaP(mouseX/l, mouseY/l, pX, pY, scacchiera)) {
              scacchiera[pY][pX] = "  ";
              scacchiera[mouseY/l][mouseX/l] = "P1";
              flag = true;
              p=2;
            }
          }
        }
      }
    }
  }
}
