ArrayList<Particle> particles=new ArrayList<Particle>();

 // short and quick definition


 


void setup() {
  size(200,200);
  background(111);
  particles.add( new Particle (100, 11));
  particles.get(0).setVelocity(1,3.5);
  
  particles.add( new Particle (100, 100));
  particles.get(1).setVelocity(1,-3.5);
  
  
  particles.add( new Particle (150, 100));
  particles.get(2).setVelocity(1,2);
  
  strokeWeight(15);
}
 
 
void draw() {
  background(111);
  for(int i=0;i<particles.size();i++){
    particles.get(i).display() ;
    
    for(int j=0;j<particles.size();j++){
      particles.get(i).checkParticleCollision(particles.get(j));
    }
    
  }
}
