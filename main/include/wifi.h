#include "esp_wifi_types.h"

#define EXAMPLE_ESP_WIFI_SSID "SSID"
#define EXAMPLE_ESP_WIFI_PASS "PASSWORD"
#define EXAMPLE_ESP_MAXIMUM_RETRY 3
#define ESP_WIFI_SCAN_AUTH_MODE_THRESHOLD WIFI_AUTH_WPA2_PSK

#define WIFI_CONNECTED_BIT BIT0
#define WIFI_FAIL_BIT BIT1

void init_wifi(void);