#define mascara   0x0000FFFF

// operandos de 16 bits, resultado de 32 bits
// base 2

unsigned int mult(unsigned int multiplicando, unsigned int multiplicador)
{
   unsigned int bit;
   unsigned int tmando, tmador, tmp;
   int i;

   tmando = multiplicando <<15;
   tmador = multiplicador & mascara;

  for (i=0; i < 16; i++){
     bit = tmador & 1;
     tmador = tmador >>1;

     tmp=0;
     if (bit == 1) tmp = tmando;
      tmador = tmador + tmp;
  }
  return tmador;
}

unsigned int multiplicando, multiplicador, resultado;


void main()
{

   multiplicando = 128;
   multiplicador = 2;

    resultado = mult(multiplicando, multiplicador);

}


