
v=['a' 'a' 'b' 'b' 'b' 'b' 'a' 'a' 'a' 'a' 'a' 'c' 'c' 'd' 'a' 'd' 'a'];
[y,dict]=LZ78Encoder(v, 0)
[x,dict]=LZ78Decoder(y,length(dict))

 
L=[76 76 76 255 255 255 255 255;
    255 76 255 255 255 255 255 255;
    255 76 255 150 150 255 255 255;
    255 76 255 150 255 150 255 255;
    255 255 255 150 255 150 29 29;
    255 255 255 150 255 150 29 255;
    255 255 255 255 255 255 29 255;
    255 255 255 255 255 255 29 29];
[n,dict]=LZ78Encoder(L,0);
[m,dict]=LZ78Decoder(n,length(dict))
