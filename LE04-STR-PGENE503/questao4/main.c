#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include "keyboardEvent.h"

void modeSwitch();
void resetButton();
void removeBattery();

void handle_keypress() {
    char c;
    if (read(STDIN_FILENO, &c, 1) == 1) {
        if (c == 'q') {
            restore_terminal();
            printf("Exiting...\n");
            _exit(0);
        }
        if(c == 'm'){
            modeSwitch();
        }
        if(c == 'r'){
            resetButton();
        }
        if(c == 'b'){
            removeBattery();
        }
    }
}

float quilometragemAtual;
float velocidadeAtual;

float tempoTotal;
float quilometragemTotal;

enum Modes{
    VIAGEM,
    VELOCIDADE,
    TOTAL,
    TEMPO
};

char mode[11] = "Viagem";
float *currentInfo = &quilometragemAtual;

enum Modes currentMode = VIAGEM;

void* spinWheel(void* vargp)
{   
    float timeSpan = 0.001;

    while(1){
        quilometragemAtual += 0.0001;
        quilometragemTotal += 0.0001;
        velocidadeAtual = quilometragemAtual/tempoTotal;
        tempoTotal += timeSpan;
        usleep(1000);
    }
}

void* showInformation(void* vargp){
    while(1){
        printf("Modo: %s | Valor: %f\r", mode, *currentInfo);
        fflush(stdout);
        sleep(1);
    }
}

void modeSwitch(){
    switch (currentMode){
    case VIAGEM:
        currentMode = VELOCIDADE;
        strcpy(mode, "Velocidade");
        currentInfo = &velocidadeAtual;
        printf("Current mode = velocidade\n\r");
        break;
    case VELOCIDADE:    
        currentMode = TOTAL;
        strcpy(mode, "Total");
        currentInfo = &quilometragemTotal;
        printf("Current mode = total\n\r");
        break;
    case TOTAL:
        currentMode = TEMPO;
        strcpy(mode, "Tempo");
        currentInfo = &tempoTotal;
        printf("Current mode = tempo\n\r");
        break;
    case TEMPO:
        currentMode = VIAGEM;
        strcpy(mode, "Viagem");
        currentInfo = &quilometragemAtual;
        printf("Current mode = viagem\n\r");
        break;
    default:
        break;
    }
}

void resetButton(){
    switch (currentMode){
        case VIAGEM:
            printf("Reseting quilometragem atual\n\r");
            quilometragemAtual = 0;
            break;
        case VELOCIDADE:
            break;
        case TOTAL:
            break;
        case TEMPO:
            printf("Reseting tempo total\n\r");
            tempoTotal = 0;
            break;
        default:
            break;
    }
}

void removeBattery(){
    printf("Removing batteries\r\n");
    quilometragemTotal = 0;
}

int main()
{
    pthread_t wheelThread;
    pthread_create(&wheelThread, NULL, spinWheel, NULL);
    setup_terminal();

    pthread_t infoThread;
    pthread_create(&infoThread, NULL, showInformation, NULL);

    while (1) {
        handle_keypress(); 
        usleep(10000);
    }

    pthread_exit(NULL);
    return 0;
}
