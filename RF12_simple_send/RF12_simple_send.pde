#include <RF12.h>
#include <Ports.h>
#include <weather_data.h>

MilliTimer sendTimer;

void setup () {
    rf12_initialize(1, RF12_433MHZ, 212);
}

void loop () {
    pomiar.light = 200;
    pomiar.humi = 80.4;
    pomiar.temp = 123.4;
    pomiar.pressure = 1020.8;
    pomiar.wind = 500;
    pomiar.lobat = 1;

    rf12_recvDone();
    if (rf12_canSend() && sendTimer.poll(3000)) {
      rf12_sendStart(0, &pomiar, sizeof pomiar);
    }
}