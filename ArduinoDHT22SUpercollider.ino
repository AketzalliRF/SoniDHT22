// Incluimos librería
#include <DHT.h>
// Definimos el sensor
#define DHTTYPE DHT22
// Definimos el pin digital donde se conectan los sensores
//los pines son: 2,7 y 8 porque son tres sensores conectados
// Inicializamos los sensores DHT22
DHT dht(2, DHTTYPE);
DHT dht1(7, DHTTYPE);
DHT dht2(8, DHTTYPE);

int h,t,u,e,m,p; //etiquetas con las que vamos a llamar en SuperCollider

void setup() { 
 // Comenzamos los sensor DHT
  dht.begin();
  dht1.begin();
  dht2.begin();
 // dht3.begin();

  
 // Inicializamos comunicación serie
  Serial.begin(115200);
}
//leemos los datos de H y T
void loop() {
  h = dht.readHumidity();
  t= dht.readTemperature();
    
  u = dht1.readHumidity();
  e= dht1.readTemperature();
    
  m=dht2.readHumidity();
  p= dht2.readTemperature();
  //imprimimos los valores registrados
  Serial.print(h);
  Serial.print('a');
  Serial.print(t);
  Serial.print('b');

  Serial.print(u);
  Serial.print('c');
  Serial.print(e);
  Serial.print('d');

  Serial.print(m);
  Serial.print('e');
  Serial.print(p);
  Serial.print('f');
    
  delay(1);
}



