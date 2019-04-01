SerialPort.closeAll; //comando sirve para serrar en SerialPort, en caso de revisar los registros en arduino
SerialPort.devices; //comando para ver la direccion USB y cambiarla abajo entre " "

/////////////////////////////////
//Iniciamos el registro de entrada de los datos desde arduino
(
~port= SerialPort.new("/dev/tty.usbmodem1421",115200);//se genera una variable global con el puerto y el la velocidad de registro de la señal que debe coincidir en arduino
~intArray=[];
Tdef(\readTemHum, {
	loop{
		~ascii = ~port.read;
		case
		{~ascii == nil} {nil}

		{~ascii.asAscii.isDecDigit}
		{~intArray = ~intArray.add(~ascii.asAscii.digit)}

		{~ascii.asAscii==$a} //etiqueta $a que se definió en arduino
		{
			~h0 = ~intArray.convertDigits;
			~intArray =[];
		}

		{~ascii.asAscii==$b}
		{
			~t0 = ~intArray.convertDigits;
			~intArray =[];
		}
		{~ascii.asAscii==$c}
		{
			~h1 = ~intArray.convertDigits;
			~intArray =[];
		}
		{~ascii.asAscii==$d}
		{
			~t1 = ~intArray.convertDigits;
			~intArray =[];
		}
		{~ascii.asAscii==$e}
		{
			~h2 = ~intArray.convertDigits;
			~intArray =[];
		}

		{~ascii.asAscii==$f}
		{
			~t2 = ~intArray.convertDigits;
			~intArray =[];
		}

		{true} {nil};
	};
}).play;
)
//////////////////////////////
//Evaluar la entrada:
(
Tdef(\postValue,{
	{
	~h0.postln; //cambiar variable global por ~h1 o ~h2 para ver los valores de los otros sensores
	~t0.postln;

	0.1.wait;
	}.loop;
}).play
)





