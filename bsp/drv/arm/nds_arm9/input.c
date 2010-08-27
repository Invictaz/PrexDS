#include <driver.h>
#include <wscons.h>

#define PAD_IRQ		12

struct input_softc {
	device_t	dev;		/* device object */
	irq_t		irq;		/* irq handle */
	device_t	ipcdev;
};

static int	input_init(struct driver *);
static int input_devctl(device_t, u_long, void *);
static int input_ioctl(device_t, u_long, void *);
static int	input_getc(void *);
static void	input_set_poll(void *, int);

static struct devops input_devops = {
	/* open */	no_open,
	/* close */	no_close,
	/* read */	no_read,
	/* write */	no_write,
	/* ioctl */	input_ioctl,
	/* devctl */input_devctl,
};

struct driver input_driver = {
	/* name */	"keypad",
	/* devops */&input_devops,
	/* devsz */	sizeof(struct input_softc),
	/* flags */	0,
	/* probe */	NULL,
	/* init */	input_init,
	/* shutdown */	NULL,
};

static struct wscons_kbd_ops wscons_input_ops = {
	/* getc */	input_getc,
	/* set_poll */	input_set_poll,
};

#define REG_KEYCNT 		(*(volatile uint16_t *)0x4000132)
#define REG_KEYINPUT 	(*(volatile uint16_t *)0x4000130)

static char key_map[] = {'l', 'r', 'w', '\n', 'a', 'd', '\n', 'e', 'b', 'a', 'x', 'y'};

/*
 * Interrupt service routine
 */
static int
input_isr(void *arg)
{
	struct input_softc *sc = arg;
	uint16_t key_bitmap = ~REG_KEYINPUT;
	int bit_pos;
	
	/* TODO: Works, now rewrite it to make it look clean */
	
	for (bit_pos = 8; bit_pos >= 0; bit_pos--)
	{
		if (((key_bitmap) >> bit_pos)&1)
		{
			wscons_kbd_input('l');
			wscons_kbd_input('s');
			wscons_kbd_input(' ');
			wscons_kbd_input('/');
			wscons_kbd_input('\n');
		}
			/*wscons_kbd_input(key_map[bit_pos]);*/
	}
		
	return 0;
}

static int
input_getc(void *aux)
{
	struct input_softc *sc = aux;
	while (1);
	return 'a';
}

static void
input_set_poll(void *aux, int on)
{
	return;
}

static int
input_devctl (device_t dev, u_long cmd, void *arg)
{	
	return 0;
}

static int
input_ioctl (device_t dev, u_long cmd, void *arg)
{	
	return 0;
}

static int
input_init(struct driver *self)
{
	struct input_softc *sc;
	device_t dev;
	device_t ipcdev;

	dev = device_create(self, "kbd", D_CHR);

	sc = device_private(dev);
	sc->dev = dev;
	
	sc->irq = irq_attach(PAD_IRQ, IPL_INPUT, 0, input_isr, IST_NONE, sc);

	/* Trigger an IRQ for any key pressed */
	REG_KEYCNT = 0x43FF;

	wscons_attach_kbd(&wscons_input_ops, sc);
	
	return 0;
}

