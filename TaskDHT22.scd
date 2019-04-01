////Evento que nunca se apaga hasta que se indique
(
a = Task({
    loop {
      Ndef(\a, {
	var sig;
	sig=PinkNoise.ar(0.2!4);
			2.do{sig=BPF.ar(sig,([~t0.linlin(0,100,30,100),~t0.linlin(0,100,30,100)+10]).midicps,0.05,5
	)};
	sig=Splay.ar(sig.scramble);
}).play.fadeTime_(5);
        5.wait;
    }
}).play;
);
////Evento que tiene un tiempo de vida, incia en un tiempo x y finaliza en un tiempo y
(
a = Task(
	{
    2.do{
      Ndef(\a, {
	var sig;
	sig=PinkNoise.ar(0.2!4);
			2.do{sig=BPF.ar(sig,([~t0.linlin(0,100,30,100),~t0.linlin(0,100,30,100)+10]).midicps,0.05,5
	)};
	sig=Splay.ar(sig.scramble);
}).play.fadeTime_(5);
        5.wait;
    }
}).start(quant:2);//inicia a los x segundos
a.resume(quant:30); //se apaga el Task a los x segundos
h=Task({1.do{Ndef(\a).clear(5)}}).start(quant:31); //se debe eliminar el Ndef
h.resume(quant:32); //y apagar la Task de limpiar Ndef
)






