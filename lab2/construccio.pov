
/*{{{ credits */
/*Ryan C. had me thinking about this sort of thing with his planet post at p.b.i. so I figured I
might as well type up a pov script of what I had in mind too.  Not good up close, just a basic
concept.*/
// BEGIN
// Persistence of Vision Ray Tracer Scene Description File
// File: Jupiter0.pov
// Vers: 3.1
// Desc: Planet Jupiter look-alike, "black hole" warp pigment to simulate the Great Red Spot.
// Date: 2000.53
// Auth: Bob Hughes (no credit to me needed, you are welcome to this)
// Mail: persistenceofv@aol.com?Subject=Pov-Scene
// Note: this is by no means a representation of a realistic Jupiter, only example of such a planet.
//       the warp is placed (trial and error in this case) over a thin reddish line.
/*}}}*/
/*{{{ camera, llum, fons */

#include "colors"

light_source { <2000,100,25000>, 1.5}
camera {
  location  <0,0,9>
  right -4/3*x
  angle 45
  look_at   0
}
background{rgb .02}

/*}}}*/


/*{{{ Definim object {Jupiter} */

#declare Jupiter=
sphere {0,1
       texture {
        pigment {gradient y turbulence .05 frequency -1
                 color_map {
                [0 color rgb <.85,.8,.725>] // poles
                [.05 color rgb <.875,.875,.775>]
                [.15 color rgb <.925,.875,.825>]
                [.25 color rgb <.9,.875,.85>]
                [.275 color rgb <.825,.8,.775>]
                [.33 color rgb <.925,.85,.875>]
                [.45 color rgb <.975,.95,.925>]
                [.54 color rgb <.85,.6,.75>]
                [.55 color rgb <.95,.55,.4>] // Great Red Spot
                [.56 color rgb <.9,.95,.85>]
                [.6 color rgb <.85,.8,.875>]
                [.65 color rgb <.8,.45,.55>]
                [.725 color rgb <.725,.55,.4>] // dark bands
                [.8 color rgb <.725,.575,.425>]
                [.9 color rgb <.85,.7,.725>]
                [.95 color rgb <.75,.725,.775>]
                [1 color rgb <.95,.8,.75>] // equator
                            } scale <.2,1,.2> rotate 15*y translate -.05*y
 warp {black_hole <.5,-.5,-.8>,.25 falloff .3 strength 1.2 turbulence 0 inverse}
                 }
 finish {ambient .03 diffuse .55 phong .075 phong_size 1.5 specular .025 roughness .01}
       }
 scale <1,.91,1>  // still of 1 POV unit size
}
/*}}}*/
/*{{{ Definim object {Io} */
#declare Io = 
sphere {0,1
       texture {
        pigment {spotted turbulence .5 frequency -1
                 color_map {
                [0 color rgb <.8,.4,.5>]
                [.25 color rgb <.9,.6,.4>]
                [.33 color rgb <.8,.7,.6>]
                [.67 color rgb <.9,.8,.6>]
                [.9 color rgb <.8,.7,.7>]
                [1 color rgb <.9,.85,.8>]
                            } scale .25
 warp {black_hole <.25,.25,.5>,.125 falloff 2 strength 2 repeat <.1,.1,.1> turbulence .125 inverse}
                 }
 finish {ambient .06 diffuse .5 phong .05 phong_size 5 specular .025 roughness .025}
       }
   scale  1/3
}

/*}}}*/
/*{{{ Definicio de sistema de referencia*/
#declare SRef=

   union{
         cylinder{<0, 0, 0>, <1.50, 0, 0>, .02 texture { pigment { color Red   } } }
         cylinder{<0, 0, 0>, <0, 1.40, 0>, .02 texture { pigment { color Green } } }
         cylinder{<0, 0, 0>, <0, 0, 1.50>, .02 texture { pigment { color Blue  } } }
        }
        
/*}}}*/


// Dades moviments de Jupiter i Io:
/*
  Dades: R_Jup =  71 400 km   (  1       unitat de longitud )
         R_Io  =   1 818 km   (  0.02546    "               )
         R_orb = 422 000 km   (  5.91       "               )

         w_orb = 2 pi    ( una revolucio en 1 periode de temps) = 360 graus / unitat de temps
         w_Io  = w_orb  
         w_jup = 4 w_orb  

         Gamma = 112.2   ( en graus ) 
         Delta = 12.          "
*/

#declare W_orb = 360.;     // en graus per unitat de temps
#declare W_Io  = W_orb;
#declare W_Jup = 4*360;

#declare R_Jup = 1.;
#declare R_orb = 5.91/3;  // escala mes adequada per la visualització de la construccio de l'escena
#declare R_Io  = 0.02546;

#declare Delta = 12.0;
#declare Gamma = 112.8;

// Preparacio de la escena:

object {Jupiter 

            rotate clock*W_Jup*y }

object {Io 

// apliqueu les transformacions neccessaries.
// exemples (inventats) de sintaxi:


            translate (R_orb*x)                
            rotate clock*W_Io*y
            rotate Delta*z     
            rotate (Gamma-90)*y
   
            
       }

// Sistemes de referencia:

// S.R. fixat a Jupiter
object {SRef rotate clock*W_Jup*y} 


// S.R. fixat al satel.lit Io; l'escalem en un factor 1/2 
// per a distingir-los millor

object {SRef scale 1/2 // apliqueu les transformacions necessaries, 
// exactament les mateixes que per a Io, ja que esta fixat a ell:

            translate (R_orb*x)                
            rotate clock*W_Io*y
            rotate Delta*z     
            rotate (Gamma-90)*y
            

       }


// END
