
#define mascara   0x0000FFFF

// operandos de 16 bits, resultado de 32 bits
// base 4

unsigned int mult(unsigned int multiplicando,unsigned int multiplicador)
{
   int bit, bit1;
   unsigned int tmando, tmador, tmp;
   int i;

   tmando = multiplicando & mascara;
   tmando = tmando <<14;
   tmador = multiplicador & mascara;
 
  for (i=0; i < 8; i++){
     bit = tmador & 1;
     bit1 = (tmador >>1) & 1;
     tmador = tmador >> 2;

     tmp=0;
     if (bit == 1) tmp = tmando;
     if (bit1 == 1) tmp = tmp + (tmando<<1);
     tmador = tmador + tmp;
  }
  return tmador;
}
// operandos de 16 bits, resultado de 32 bits
// base 4

unsigned int multiplicando, multiplicador, resultado;


void main()
{

   multiplicando = 128;
   multiplicador = 2;

    resultado = mult(multiplicando, multiplicador);
//	printf("%d\n",resultado);

}


