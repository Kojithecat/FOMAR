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
// Note: this is NOT a representation of a realistic Jupiter, only example of such a planet.
//       the warp is placed (trial and error in this case) over a thin reddish line.
light_source { <25000,100,-10000>, 1.5}
camera {
  location  <0,0,-10>
  angle 50
  look_at   0
}
background{rgb .1}
// jupiter
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
// io
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
 scale .018 translate <-.075,-.075,-9.5>
}
// END
// omniVerse http://users.aol.com/persistenceofv/all.htm
