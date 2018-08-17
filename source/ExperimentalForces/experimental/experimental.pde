ArrayList<Particle> particles=new ArrayList<Particle>();

 // short and quick definition


 


void setup() {
  size(500,500);
  background(111);
  particles.add( new Particle (100, 50));
  particles.get(0).setVelocity(1,1.5);
  particles.get(0).mass=2;
  particles.get(0).radius=20;
  
  particles.add( new Particle (100, 100));
  particles.get(1).setVelocity(1,-1.5);
  particles.get(1).mass=5;
  particles.get(1).radius=25;
  
  particles.add( new Particle (150, 100));
  particles.get(2).setVelocity(1,1);
  particles.get(2).radius=15;
  strokeWeight(1);
}
 
 
void draw() {
  background(111);
  for(int i=0;i<particles.size();i++){
    particles.get(i).display() ;
    particles.get(i).addForce(World.gravity);
    //println(particles.get(i).velocity);
    for(int j=0;j<particles.size();j++){
      if(i!=j){
        particles.get(i).checkParticleCollision(particles.get(j));
        
      }
    }
  }
  
}
