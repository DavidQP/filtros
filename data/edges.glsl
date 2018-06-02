#ifdef GL_ES
precision mediump float;
precision mediump int;
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
	//edge
	else{
		for(int i=0; i<lado; i++){
			for(int j=0; j<lado; j++){
				kernel[i][j] = vec4(-1.0, -1.0, -1.0, 0.0); //edge
			}
		}
 

	  kernel[numVecinos][numVecinos] = vec4(8, 8, 8, 0.0); //edge
	  
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
