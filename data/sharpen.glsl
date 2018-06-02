#ifdef GL_ES
precision mediump float;
precision highp int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform vec2 texOffset;
uniform int numVecinos;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main(void) {
	
	int lado = numVecinos*2 + 1;
	
	vec4[100][100] thematrix;
	
	//leer pixeles alrededor en un radio cuadrado de numVecinos
	for(int i=0; i<lado; i++){
		for(int j=0; j<lado; j++){
			thematrix[i][j] = texture2D(texture,  vertTexCoord.st + vec2((j-numVecinos)*texOffset.s, (i-numVecinos)*texOffset.t));
		}
	}

 vec4 sum;
  vec4[100][100] kernel;
  
  
  	if(numVecinos == 0){

  		for(int i=0; i<lado; i++){
			for(int j=0; j<lado; j++){
				kernel[i][j] = vec4(0.0, 0.0, 0.0, 0.0); //identidad
				
			}

		kernel[numVecinos][numVecinos] = vec4(1, 1, 1, 0.0); //identidad
		  
		  sum = vec4(0.0, 0.0, 0.0, 0.0);
		  
		  //convolucion
		  for(int i=0; i<lado; i++){
				for(int j=0; j<lado; j++){
						sum += thematrix[i][j]*kernel[i][j];
				}
		  }
		  
		  gl_FragColor = vec4(sum.rgb, 1.0) * vertColor;
	}

	}
	else{

		//emboss
	    //kernel modificacion
	    /*for(int i = 0; i< lado; i++){
	    	for(int j = 0; j< lado; j++){
	    		if(i == (lado-1) || j == (lado-1)){
	    			kernel[i][j] = vec4(0.0, 0.0, 0.0, 0.0);
	    		}
	    		kernel[i][j] = vec4(1.0,1.0,1.0,0.0)*(-1);
	    	}
	    }*/
	    //kernel
	    for(int i=0; i < lado; i++){
	    	for(int j =0 ; j < lado; j++){
	    		if(i == numVecinos && j == numVecinos){
	    			kernel[i][j] = vec4(lado*lado,lado*lado,lado*lado,0.0);
	    		}
	    		else{
	    			kernel[i][j] = vec4(1.0,1.0,1.0,0.0)*(-1);
	    		}
	    	}
	    }
	  	

	  	sum = vec4(0.0, 0.0, 0.0, 0.0);
	  
	  	//convolucion
	  	for(int i=0; i<lado; i++){
	  		for(int j=0; j<lado; j++){
	  			sum += thematrix[i][j]*kernel[i][j];
	  			}
	  		}
	  
	  	gl_FragColor = vec4(sum.rgb, 1.0) * vertColor;
		}
     
}
