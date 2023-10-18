#include "colors"
#include "textures_pedra"


/*{{{ camera, llum, fons */

#include "colors"

light_source { <-25000,100,2000>, 1.5}

light_source { <0,5000,2000>, 1.5}

camera {
  location  <20, 30 , 44>
  right -4/3*x
  angle 7.5
  look_at   <0,0.5,0>
}
background{rgb .02}

 plane { <0, 1, 0>, -0.5     // normal, displacement
    pigment {
      checker color White, color Gray
    }
  }


/*}}}*/

/*{{{ Definicio de sistema de referencia*/
#declare SRef=

   union{
         cylinder{<0, 0, 0>, <1.50, 0, 0>, .025 texture { pigment { color Red   } } }
   //    cylinder{<0, 0, 0>, <0, 1.40, 0>, .025 texture { pigment { color Green } } }
         cylinder{<0, 0, 0>, <0, 0, 1.50>, .025 texture { pigment { color Blue  } } }
        }
        
/*}}}*/




/*{{{ Taula Denavit-Hartenberg: */

//      alfa    a    |     d    fi      // 

#fopen Dades "taula-DH_a_anglemod" read //angles modificats son els de les taules anglemod

//  #while (defined(Dades))

#read (Dades, Alfa0, A0, D1, Fi1)
#read (Dades, Alfa1, A1, D2, Fi2)
#read (Dades, Alfa2, A2, D3, Fi3)



/*}}}*/



/*{{{ Definicio de l'element 1 */

#declare Gruix=0.08;

#declare Element1= 

   union{
         cylinder{  <  0, 0, 0>, <1.5, 0, 0>, Gruix texture { T_Stone1 } }

         cylinder{  <0, 0, -0.5>,   <0, 0, 0.5>, 1.2*Gruix texture { T_Stone1 } }
        }
        
/*}}}*/
/*{{{ Definicio de l'element 2 */

#declare Element2= 

   union{
         cylinder{  <  0, 0, 0>, <1.5, 0, 0>, Gruix texture { T_Stone1 } }

         cylinder{<0, 0, -Gruix>, <0, 0, Gruix>, 1.2*Gruix  texture { T_Stone1 } }
        }
        
/*}}}*/
/*{{{ Definicio de l'element 3 */

#declare Element3= 

   union{

         cylinder{ <  0, 0, 0>, <1.5, 0, 0>, Gruix  }
         cone    { < 1.5, 0, 0 >   , Gruix    // Center and radius of one end
                  <  1.5+0.75*Gruix,0,0> , 0  // Center and radius of other end
                 }                
         cylinder{<0, 0, -Gruix>, <0, 0, Gruix>, 1.2*Gruix }
         texture { T_Stone1 }

        }
        
/*}}}*/


/*{{{ Escena */
// Escena 

// Base:
object {SRef

        //rotate 90*x
        rotate -90*z
        rotate -90*x
       }



// Sistema 1:

object { SRef 

         rotate     clock* Fi1*z
         translate    D1*z
         rotate    clock*Alfa0*x
         translate    A0*x

         rotate -90*z
         rotate -90*x
       }

object { Element1

         rotate     clock* Fi1*z
         translate    D1*z
         rotate    clock*Alfa0*x
         translate    A0*x

         rotate -90*z
         rotate -90*x
       }

// Sistema 2:

object { SRef 
	 rotate    clock*  Fi2*z
         translate    D2*z
         rotate    Alfa1*x
         translate    A1*x

         rotate     clock* Fi1*z
         translate    D1*z
         rotate    clock*Alfa0*x
         translate    A0*x

         rotate -90*z
         rotate -90*x
	 
       }


object { Element2
	 rotate    clock*  Fi2*z
         translate    D2*z
         rotate    Alfa1*x
         translate    A1*x

         rotate     clock* Fi1*z
         translate    D1*z
         rotate    clock*Alfa0*x
         translate    A0*x

         rotate -90*z
         rotate -90*x
       }

// Sistema 3:

object { SRef  
	
	 rotate      clock*Fi3*z
         translate    D3*z
         rotate    clock*Alfa2*x
         translate    A2*x
        
	 rotate    clock*  Fi2*z
         translate    D2*z
         rotate    Alfa1*x
         translate    A1*x

         rotate     clock* Fi1*z
         translate    D1*z
         rotate    clock*Alfa0*x
         translate    A0*x

         rotate -90*z
         rotate -90*x
       }


object { Element3
	
	 rotate      clock*Fi3*z
         translate    D3*z
         rotate    clock*Alfa2*x
         translate    A2*x
        
	 rotate    clock*  Fi2*z
         translate    D2*z
         rotate    Alfa1*x
         translate    A1*x

         rotate     clock* Fi1*z
         translate    D1*z
         rotate    clock*Alfa0*x
         translate    A0*x

         rotate -90*z
         rotate -90*x
       }

       
// Objectiu:


#declare Px = 0.0;
#declare Py = 0.0;
#declare Pz = 0.0;

  sphere { <Px, Py, Pz>, 0.3 texture { T_Stone1 }


	 translate (1.5+0.3)*x
	 rotate      clock*Fi3*z
         translate    D3*z
         rotate    clock*Alfa2*x
         translate    A2*x
        
	 rotate    clock*  Fi2*z
         translate    D2*z
         rotate    Alfa1*x
         translate    A1*x

         rotate     clock* Fi1*z
         translate    D1*z
         rotate    clock*Alfa0*x
         translate    A0*x

         rotate -90*z
         rotate -90*x
         }




/*}}}*/

// END
