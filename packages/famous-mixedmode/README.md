1) Create a packages folder in the root of your meteor app folder.

2) Download the zip and unzip  this repo into the packages folder

edit the ./meteor/packages file and add the word famous to the end


meteor will pick it up and install it automatically when you launch your app.


All famous objects  are mapped  into a 'famous' windows namespace.


For example:

 famous.core.FamousEngine

 famous.domRenderables.DOMElement

 famous.components.Align

 famous.components.Camera

 famous.transitions.Curves
 
 
 to use in your code:
 
 var Camera = new famous.components.Camera;
 
 
Have Fun!


