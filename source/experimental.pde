ArrayList<Particle> particles=new ArrayList<Particle>();

 // short and quick definition


 
class Particle {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
 
  Particle(float x, float y) {  
    // values 

    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  void display() {
    
    point(location.x,location.y);
    checkCollision();
    location.add(velocity);
  }
  void setVelocity(float xVelocity , float yVelocity){
    velocity.set(xVelocity,yVelocity);
  }
  void checkCollision(){

    
    
    if(location.x>width||location.x<1){
      
      velocity.set(-velocity.x,velocity.y);
    }
    if(location.y>height||location.y<1){
    
      velocity.set(velocity.x,-velocity.y);
    }
  }
  
  void checkParticleCollision(Particle other){
    
    Float dist = location.dist(other.location);
   
    if(dist<10||dist-velocity.dist(other.velocity)<10){
      if(location.x<other.location.x){
        float temp=velocity.x;
        velocity.x=-other.velocity.x;
        other.velocity.x=-temp;
        println("bounce");    
      }
      else if(location.x>other.location.x){
        float temp=velocity.x;
        velocity.x=other.velocity.x;
        other.velocity.x=-temp;
        println("bounce3");
      }
      if(location.y<other.location.y){
        float temp=velocity.y;
        velocity.y=-other.velocity.y;
        other.velocity.y=temp;
        println("bounce2");
      }
      else if(location.y>other.location.y){
        float temp=velocity.y;
        velocity.y=other.velocity.y;
        other.velocity.y=-temp;
        println("bounce1");
      }
      
    }
  }
}

void setup() {
  size(200,200);
  background(111);
  particles.add( new Particle (100, 11));
  particles.get(0).setVelocity(1,3.5);
  
  particles.add( new Particle (100, 100));
  particles.get(1).setVelocity(1,-1.5); 
  strokeWeight(15);
}
 
 
void draw() {
  background(111);
  //background(111);
  for(int i=0;i<particles.size();i++){
    particles.get(i).display() ;
    
    for(int j=0;j<particles.size();j++){
      particles.get(i).checkParticleCollision(particles.get(j));
    }
    
  }
}
