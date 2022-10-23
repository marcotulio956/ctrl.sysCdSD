 /* ----- Template de controlador digital implementado em Arduino ----- */
 
 
const int Referencia = 0; // O sinal de referencia sera lido a partir do pino de 
                          // entrada analogica A0
const int Sensor = 1; // O sensor sera conectado ao pino de entrada analogica A1
const int Atuador = 3; // O sinal de comando "analogico" (saida do controlador) 
                       // sera transmitido pelo pino de saida digital 5 (PWM)

double Valor_Referencia ; // Referencia vinda do gerador de sinais 
double Valor_Sensor; // Variavel que armazenara o valor da saida (tensao no capacitor)
double Valor_Atuador; // Variavel que armazenara o valor da 
                      // saida do controlador (acao de controle)

double Erro; // Variavel que armazenara o sinal de erro (Valor_referencia - Valor_Sensor)
double I = 0;
double P;
double integralError = 0;

const double Kp = 1; // Ganho proporcional do controlador. {1 5 10} 1 2 1000
const double Ki = 10;   // 2 - 20 Ganho integral do controlador. Tente aumentar esse ganho gradativamente
                      // ate conseguir um desempenho satisfatorio do sistema de controle,
                      // tanto em termos da resposta transitoria quanto da resposta em
                      // estado estacionario.
//KP - KI
// 1 - 2 Crescimento exponencial com erro no regime permanente tendendo a 0
// 1 - 10 Crescimento exponencial com erro no regime permanente tendendo a 0 com melhor tempo de resposta
// 20 - 10 Overshooting com tempo de resposta alto e erro variando

// Tempo morto 1 - 10
// Delay adiciona atraso na resposta ao erro

// Senoidal 1 - 10
///atraso de fase

//Senoidal 1-10 atrasado
// Diminuição no ganho

//Rampa 1-10
// tbm


const double T = 5; // Tempo de amostragem em milissegundos

double last_time;

void setup(){
    pinMode(Sensor, INPUT); // Define o pino do sensor como uma entrada
    pinMode(Referencia, INPUT); // Define o pino da referencia como uma entrada
    pinMode(Atuador, OUTPUT); // Define o pino do atuador como uma saida
  
    //Serial.begin(9600); // Especifique a velocidade da comunicacao serial
    last_time = millis();
}



void loop(){
    if ((millis() - last_time) > T){
        last_time = millis();
        Valor_Referencia = analogRead(Referencia); // Converte o valor de tensao de referencia
        // num numero binario de 10 bits (0V a 5V <---> 0 a 1023)
        
        Valor_Sensor = analogRead(Sensor); // Converte o valor de tensao do capacitor (saida)
        // num numero binario de 10 bits (0V a 5V <---> 0 a 1023)
        // Valor_Sensor = map(Valor_Sensor,0,1023,0,5); // Mapeia de 10 bits para um escala de 0 a 5 V
        
        Erro = Valor_Referencia - Valor_Sensor; // Erro pode assumir valores entre -5 e 5
        // Inverte-se o sinal de erro em virtude de 
        // o ganho em malha aberta ser negativo.
        Erro = Erro*255/1023; // Mapeia o intervalo [-1023, 1023] no intervalo
        // [-255, 255], visto que o saida do controlador, que e funcao so sinal de Erro, 
        //sera um sinal PWM de 8 bits
        //Erro = -Erro; // Troca-se o sinal do erro porque o sistema em malha aberta 
        // tem ganho negativo

        integralError += Erro;
        
        P = Kp*Erro;        // PROPORCIONAL DIGITAL 
        I = Ki*(T/1000)*integralError; // INTEGRAL DIGITAL 
        Valor_Atuador = constrain(P+I, 0, 255); // Restringe o valor do sinal de atuacao
        // a faixa de 0V a 5V (0 a 255)
        
        analogWrite(Atuador, Valor_Atuador); // Escreve no pino 5 (Atuador), que simulara
        // uma saida analogica via PWM 
        //Serial.println(Valor_Atuador);
        delay(100);
    }
}
    
    
