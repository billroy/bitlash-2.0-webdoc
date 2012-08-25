a:309:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"Bitlash User Functions";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:35;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:215:"
While Bitlash functions are a handy and straightforward way to extend Bitlash, there are cases where you need native C code to get closer to the hardware, perhaps for speed or to interface with a custom peripheral.";}i:2;i:36;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:251;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:251;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:260:"Starting with version 1.1, Bitlash provides an easy way to call C functions from Bitlash code, just like the Bitlash built-in functions.  In effect, you add your functions to the Bitlash function library, and they become callable from the Bitlash command line.";}i:2;i:253;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:513;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:513;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"The work happens in a function named ";}i:2;i:515;}i:11;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:552;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"addBitlashFunction()";}i:2;i:554;}i:13;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:574;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:" that is exposed as part of the Bitlash ";}i:2;i:576;}i:15;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:616;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:".  You call ";}i:2;i:619;}i:17;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:631;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"addBitlashFunction()";}i:2;i:633;}i:19;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:653;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:187:" in your sketch to register your C function with Bitlash and associate it with a function name.  Then Bitlash calls your C function when it is invoked from the command line (or a function";}i:2;i:655;}i:21;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:842;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:").";}i:2;i:845;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:847;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:847;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:238:"Bitlash 2 introduces a new variable-argument scheme, using the getArg() function to fetch passed arguments from the interpreter core.  Users of earlier versions will want to carefully review the section on fetching passed arguments below.";}i:2;i:849;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1087;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1087;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:223:"If you follow a few rules for setting up your function, you can wrap it in Bitlash without having to write a line of parsing code.  You get all the parsing, functions, printing, and the rest of the runtime library for free.";}i:2;i:1089;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1312;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1312;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:122:"Which is why it is worth reading the next section to learn how to set up your C function so Bitlash can call it properly.
";}i:2;i:1314;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1436;}i:33;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:1436;}i:34;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1442;}i:35;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"Declaring the C function";i:1;i:3;i:2;i:1442;}i:2;i:1442;}i:36;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1442;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1476;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:"
Bitlash exposes the C variable type named ";}i:2;i:1477;}i:39;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1520;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"numvar";}i:2;i:1522;}i:41;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1528;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:" representing (in the Arduino version) the ";}i:2;i:1530;}i:43;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:1573;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"signed long";}i:2;i:1574;}i:45;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:1585;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:104:" integer data types.  All internal calculations are done using fixed-point arithmetic in this precision.";}i:2;i:1586;}i:47;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1690;}i:48;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1690;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:68:"So the first rule is that your function must return a value of type ";}i:2;i:1692;}i:50;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1760;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"numvar";}i:2;i:1762;}i:52;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1768;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:".";}i:2;i:1770;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1771;}i:55;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1771;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:179:"Here is a simple example to walk through the plumbing.  This example code is in the examples folder supplied with Bitlash, so you can open it in the Arduino IDE by selecting File ";}i:2;i:1773;}i:57;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:1952;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" Examples ";}i:2;i:1954;}i:59;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:1964;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" bitlash ";}i:2;i:1966;}i:61;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:1975;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:" userfunctions if you'd like to follow along.";}i:2;i:1977;}i:63;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2022;}i:64;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2022;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:126:"Suppose for some reason we need to be able to grab the count value from the AVR's internal Timer1 timer and use it in Bitlash.";}i:2;i:2024;}i:66;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2150;}i:67;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2150;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"In the Arduino sketch, we declare a user function named ";}i:2;i:2152;}i:69;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:2208;}i:70;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"timer1";}i:2;i:2209;}i:71;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:2215;}i:72;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:112:", taking no arguments, returning a numeric Bitlash value containing the timer count register value we're after:
";}i:2;i:2216;}i:73;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2333;}i:74;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:96:"
numvar timer1(void) { 
	return TCNT1; 	// return the value of Timer 1
}
...void setup(void)...
";i:1;N;i:2;N;}i:2;i:2333;}i:75;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2437;}i:76;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:77:"This completes the definition of the user function.  What remains is to call ";}i:2;i:2439;}i:77;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2516;}i:78;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"addBitlashFunction()";}i:2;i:2518;}i:79;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2538;}i:80;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:" to register this new handler.
";}i:2;i:2540;}i:81;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2571;}i:82;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:2571;}i:83;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2578;}i:84;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:48:"Registering a Function With addBitlashFunction()";i:1;i:2;i:2;i:2578;}i:2;i:2578;}i:85;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2578;}i:86;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2638;}i:87;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"
You call ";}i:2;i:2639;}i:88;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2649;}i:89;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"addBitlashFunction()";}i:2;i:2651;}i:90;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2671;}i:91;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:" from your C startup code to register your function with Bitlash.";}i:2;i:2673;}i:92;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2738;}i:93;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2738;}i:94;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2740;}i:95;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"addBitlashFunction()";}i:2;i:2742;}i:96;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2762;}i:97;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:" takes two arguments:";}i:2;i:2764;}i:98;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2785;}i:99;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2785;}i:100;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2785;}i:101;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2785;}i:102;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:" a name for the new function";}i:2;i:2789;}i:103;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2817;}i:104;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2817;}i:105;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2817;}i:106;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2817;}i:107;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:" the function handler to call with ";}i:2;i:2821;}i:108;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:2856;}i:109;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"(bitlash_function)";}i:2;i:2857;}i:110;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:2875;}i:111;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:" cast before it";}i:2;i:2876;}i:112;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2891;}i:113;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2891;}i:114;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2891;}i:115;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2891;}i:116;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"
While you can call ";}i:2;i:2892;}i:117;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2912;}i:118;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"addBitlashFunction()";}i:2;i:2914;}i:119;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2934;}i:120;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:100:" any time, one would normally call it from setup(), like this, to complete the code for the example:";}i:2;i:2936;}i:121;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3036;}i:122;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:355:"
void setup(void) {
	initBitlash(57600);		// must be first to initialize serial port

	// Register the extension function with Bitlash
	//		"timer1" is the Bitlash name for the function
	//		(bitlash_function) timer1 tells Bitlash where our handler lives
	//
	addBitlashFunction("timer1", (bitlash_function) timer1);
}

void loop(void) {
	runBitlash();
}
";i:1;N;i:2;N;}i:2;i:3043;}i:123;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3406;}i:124;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"The setup() function initializes Bitlash and then calls ";}i:2;i:3408;}i:125;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3464;}i:126;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"addBitlashFunction()";}i:2;i:3466;}i:127;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3486;}i:128;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:" to install timer1().  The loop() function runs Bitlash as usual.";}i:2;i:3488;}i:129;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3553;}i:130;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3553;}i:131;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"Now when Bitlash starts up it knows a new word:
";}i:2;i:3555;}i:132;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3608;}i:133;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:66:"
bitlash here! ...
> print timer1(), timer1(), timer1()
22 194 67
";i:1;N;i:2;N;}i:2;i:3608;}i:134;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:3683;}i:135;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3689;}i:136;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"The Function Name";i:1;i:3;i:2;i:3689;}i:2;i:3689;}i:137;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3689;}i:138;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3716;}i:139;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:"
A function name is a string constant of up to IDLEN (11) characters, like ";}i:2;i:3717;}i:140;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:3792;}i:141;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"timer1";}i:2;i:3793;}i:142;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:3799;}i:143;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:115:".  It must start with a letter, and may contain letters, numbers, and the underscore '_' and period '.' characters.";}i:2;i:3800;}i:144;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3915;}i:145;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3915;}i:146;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:160:"Overriding the built-in function names is not supported; the user functions are searched last so if you use a built-in name your function will never be called.
";}i:2;i:3917;}i:147;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4077;}i:148;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:4077;}i:149;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4083;}i:150;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:39:"Fetching Passed Arguments with getArg()";i:1;i:3;i:2;i:4083;}i:2;i:4083;}i:151;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4083;}i:152;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4132;}i:153;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:89:"
Your bitlash_function is declared (void).  How does it get argument values from Bitlash?";}i:2;i:4133;}i:154;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4222;}i:155;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4222;}i:156;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:195:"Starting with Bitlash 2.0, a function does not need to accept any particular number of arguments.  The arguments being passed to your macro are available to your code as via the Bitlash function ";}i:2;i:4224;}i:157;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:4419;}i:158;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:" point getArg().";}i:2;i:4422;}i:159;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4438;}i:160;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4438;}i:161;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:154:"The value returned by getArg(0) is the count of arguments passed to your function.  You can fetch the value of those arguments using getArg(1), getArg(2),";}i:2;i:4440;}i:162;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:4594;}i:163;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:32:" and so on to getArg(getArg(0)).";}i:2;i:4597;}i:164;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4629;}i:165;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4629;}i:166;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:150:"See the file examples/tonedemo.pde for an example of how to use getArg(0) to control how your function processes a variable number of input arguments.";}i:2;i:4631;}i:167;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4781;}i:168;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:4783;}i:169;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4790;}i:170;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"The Function Handler Argument";i:1;i:3;i:2;i:4790;}i:2;i:4790;}i:171;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4790;}i:172;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4829;}i:173;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"
The function argument to ";}i:2;i:4830;}i:174;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4856;}i:175;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"addBitlashFunction()";}i:2;i:4858;}i:176;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4878;}i:177;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:178:" provides Bitlash with the name of the C function handler you wrote to handle your user function.  A small syntactic complexity: It is required to cast your function to the type ";}i:2;i:4880;}i:178;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5058;}i:179;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"(bitlash_function)";}i:2;i:5059;}i:180;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5077;}i:181;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:" to pass it to Bitlash, which is why the mantatory text ";}i:2;i:5078;}i:182;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5134;}i:183;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"(bitlash_function)";}i:2;i:5135;}i:184;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5153;}i:185;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:" appears before the function name in the example:";}i:2;i:5154;}i:186;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5203;}i:187;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:67:"
...
	addBitlashFunction("timer1", (bitlash_function) timer1);
...
";i:1;N;i:2;N;}i:2;i:5210;}i:188;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5285;}i:189;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:79:"If you omit the cast the compiler will complain about function type mismatches.";}i:2;i:5287;}i:190;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5366;}i:191;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:5368;}i:192;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5374;}i:193;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:38:"NOTE: Maximum Number of User Functions";i:1;i:3;i:2;i:5374;}i:2;i:5374;}i:194;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5374;}i:195;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5422;}i:196;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:103:"
Bitlash ships with MAX_USER_FUNCTIONS set to 6 and will throw an exception if you try to install more.";}i:2;i:5423;}i:197;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5526;}i:198;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5526;}i:199;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:96:"If you need more functions, adjust the definition of MAX_USER_FUNCTIONS in bitlash-functions.c.
";}i:2;i:5528;}i:200;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5624;}i:201;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:5624;}i:202;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5630;}i:203;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"Coding User Functions";i:1;i:2;i:2;i:5630;}i:2;i:5630;}i:204;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:5630;}i:205;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5663;}i:206;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:100:"
Here are some notes on limitations and issues you may need to address when coding a user function.
";}i:2;i:5664;}i:207;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5764;}i:208;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:5764;}i:209;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5770;}i:210;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Sharing the CPU";i:1;i:3;i:2;i:5770;}i:2;i:5770;}i:211;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5770;}i:212;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5795;}i:213;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:118:"
Calling delay() from a user function is generally to be avoided, since delay() blocks everything else from happening.";}i:2;i:5796;}i:214;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5914;}i:215;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5914;}i:216;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:158:"Bitlash background functions don't (well, can't) run while your function is running, since they get time on a poll from loop().  This may affect your design.
";}i:2;i:5916;}i:217;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6074;}i:218;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:6074;}i:219;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6080;}i:220;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:34:"Calling Internal Bitlash Functions";i:1;i:3;i:2;i:6080;}i:2;i:6080;}i:221;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6080;}i:222;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6124;}i:223;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:243:"
Generally it's fair game to call any internal Bitlash functions you want from your user function; you're inside the interpreter, after all.  But there are  things you should be cautious about in addition to the CPU time issue discussed above.";}i:2;i:6125;}i:224;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6368;}i:225;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6368;}i:226;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:174:"The interpreter is not re-entrant, and is halfway through parsing and executing a command line when it encounters your function reference.  Don't re-enter Bitlash by calling ";}i:2;i:6370;}i:227;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:6544;}i:228;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"doCommand";}i:2;i:6546;}i:229;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:6555;}i:230;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" or ";}i:2;i:6557;}i:231;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:6561;}i:232;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"runBitlash";}i:2;i:6563;}i:233;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:6573;}i:234;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:" from your user function.";}i:2;i:6575;}i:235;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6600;}i:236;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6600;}i:237;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:330:"Avoid recursion and stack-local storage where possible in user functions.  Bear in mind that your function is executing inside the parser and is competing with the parser for stack space.  Deeply nested recursion from a user function can cause a stack overflow, and local variables in your function only make this happen faster.  ";}i:2;i:6602;}i:238;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6932;}i:239;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6932;}i:240;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:153:"You can call the get_free_memory() function (which handles the Bitlash free() function) to see how much stack space is available when your function runs.";}i:2;i:6934;}i:241;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7087;}i:242;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7087;}i:243;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:284:"Unfortunately, it is very difficult to provide hard and fast rules about how much stack will be required for your application; experimentation is the best way to be sure.  Personally, I get uncomfortable when free() goes below 200 but I have seen applications that require much more.
";}i:2;i:7089;}i:244;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7373;}i:245;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:7373;}i:246;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7379;}i:247;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:49:"Printing From User Functions: Console Redirection";i:1;i:3;i:2;i:7379;}i:2;i:7379;}i:248;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7379;}i:249;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7438;}i:250;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:132:"
Printing from a user function using the Arduino Serial.print() function works as usual: it goes to the console as you would expect.";}i:2;i:7439;}i:251;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7571;}i:252;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7571;}i:253;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:457:"You can also print through Bitlash using the Bitlash printing primitives: sp(), spb(), and speol(), about which you will find more in bitlash-serial.c.  If you use the Bitlash printing primitives, you will gain the benefit that any serial output redirection that is in effect when your function is called will be applied to your printed output.  In other words, your function can automatically print to whatever pin Bitlash has selected as the output pin.  ";}i:2;i:7573;}i:254;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8030;}i:255;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8030;}i:256;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:"Here's an example to clarify.  Suppose we have these two user functions wired up as ";}i:2;i:8032;}i:257;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:8116;}i:258;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"sayhi1";}i:2;i:8118;}i:259;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:8124;}i:260;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" and ";}i:2;i:8126;}i:261;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:8131;}i:262;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"sayhi2";}i:2;i:8133;}i:263;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:8139;}i:264;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:":";}i:2;i:8141;}i:265;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8142;}i:266;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:78:"
void sayhi1(void) { Serial.print("Hello"); }
void sayhi2(void) { sp("Hi"); }
";i:1;N;i:2;N;}i:2;i:8149;}i:267;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8235;}i:268;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"Consider this bitlash code:
";}i:2;i:8237;}i:269;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8270;}i:270;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
print #3: sayhi1()
print #3: sayhi2()
print #4: sayhi2()
";i:1;N;i:2;N;}i:2;i:8270;}i:271;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8336;}i:272;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"The first line will print ";}i:2;i:8338;}i:273;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:8364;}i:274;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"Hello";}i:2;i:8365;}i:275;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8370;}i:276;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:" to the serial console.  Serial.print() output always goes there.";}i:2;i:8371;}i:277;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8436;}i:278;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8436;}i:279;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"The second Bitlash command will print ";}i:2;i:8438;}i:280;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:8476;}i:281;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"Hi";}i:2;i:8477;}i:282;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8479;}i:283;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:" to the device on pin 3, since ";}i:2;i:8480;}i:284;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:8511;}i:285;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"redirection to pin 3";}i:2;i:8512;}i:286;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8532;}i:287;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:" is in effect when the function is called.";}i:2;i:8533;}i:288;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8575;}i:289;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8575;}i:290;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:"Likewise, the third command will print ";}i:2;i:8577;}i:291;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:8616;}i:292;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"Hi";}i:2;i:8617;}i:293;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8619;}i:294;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:103:" on pin 4; thus a single user function can drive multiple output streams without needing special code.
";}i:2;i:8620;}i:295;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8723;}i:296;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:8723;}i:297;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8729;}i:298;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"Examples";i:1;i:2;i:2;i:8729;}i:2;i:8729;}i:299;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:8729;}i:300;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8749;}i:301;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:120:"
See the examples folder in the Bitlash distribution for more.  You can load examples in the Arduino IDE using the File ";}i:2;i:8750;}i:302;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:8870;}i:303;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" Examples ";}i:2;i:8872;}i:304;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:8882;}i:305;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:" bitlash menu.
";}i:2;i:8884;}i:306;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8898;}i:307;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8898;}i:308;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:8898;}}