class Particle {
 
  PVector location=new PVector(0,0);
  PVector velocity=new PVector(0,0);
  PVector acceleration;
  float mass=1;
 
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
      if(location.x>width+1){
        location.x=width-1;
      }
      if(location.x<-1){
        location.x=1;
      }
      velocity.set(-velocity.x,velocity.y);
    }
    if(location.y>height||location.y<1){
      if(location.y>height+1){
        location.y=height-1;
      }
      if(location.y<-1){
        location.y=1;
      }
      velocity.set(velocity.x,-velocity.y);
    }
  }
  
  void checkParticleCollision(Particle other){
    
    Float dist = location.dist(other.location);
    
    if(dist<15){
      if(location.x<other.location.x){
        float temp=velocity.x;
        
        velocity.x=-other.velocity.x;
        other.velocity.x=-temp;
        println("bounce");    
        location.x-=1;
      }
      else if(location.x>other.location.x){
        float temp=velocity.x;
        
        velocity.x=other.velocity.x;
        other.velocity.x=-temp;
        println("bounce3");
        location.x+=1;
      }
      if(location.y<other.location.y){
        float temp=velocity.y;
        
        velocity.y=-other.velocity.y;
        other.velocity.y=temp;
        location.y-=1;
        println("bounce2");
      }
      else if(location.y>other.location.y){
        float temp=velocity.y;
        
        velocity.y=other.velocity.y;
        other.velocity.y=-temp;
        println("bounce1");
        location.y+=1;
      }
 
    }
  }
}
