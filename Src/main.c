#include "gd32f3x0.h"
#include "rtthread.h"

/*!
    \brief      main function
    \param[in]  none
    \param[out] none
    \retval     none
*/
int main(void)
{
    //systick_config();

    /* enable the LED GPIO clock */
    rcu_periph_clock_enable(RCU_GPIOB);
    /* configure LED2 GPIO port */ 
    gpio_mode_set(GPIOB, GPIO_MODE_OUTPUT, GPIO_PUPD_PULLDOWN, GPIO_PIN_1);
    gpio_output_options_set(GPIOB, GPIO_OTYPE_PP, GPIO_OSPEED_2MHZ, GPIO_PIN_1);
    /* reset LED2 GPIO pin */
    gpio_bit_reset(GPIOB,GPIO_PIN_1);

    while(1) {
        gpio_bit_set(GPIOB, GPIO_PIN_1);
        rt_thread_mdelay(50);
        gpio_bit_reset(GPIOB, GPIO_PIN_1);
        rt_thread_mdelay(500);
    }
}
