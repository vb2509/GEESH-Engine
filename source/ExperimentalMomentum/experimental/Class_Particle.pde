class Particle {
  float radius=6f;
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
    
    ellipse(location.x,location.y,radius*2,radius*2);
    checkCollision();
    location.add(velocity);
  }
  void setVelocity(float xVelocity , float yVelocity){
    velocity.set(xVelocity,yVelocity);
  }
  void checkCollision(){

    
    
    if(location.x+radius>width||location.x-radius<1){
      if(location.x+radius>width+1){
        location.x=width-radius;
      }
      if(location.x-radius<-1){
        location.x=radius;
      }
      velocity.set(-velocity.x,velocity.y);
    }
    if(location.y+radius>height||location.y-radius<1){
      if(location.y+radius>height+1){
        location.y=height-radius;
      }
      if(location.y<-1){
        location.y=radius;
      }
      velocity.set(velocity.x,-velocity.y);
    }
  }
  
  void checkParticleCollision(Particle other){
    
    Float dist = location.dist(other.location);
    
    if(dist<radius+other.radius){
      
      Float v1x=(((this.mass-other.mass)/(this.mass+other.mass))*velocity.x);
      
      Float v1y=(((this.mass-other.mass)/(this.mass+other.mass))*velocity.y);
      
      Float v2x=2*mass/(mass+other.mass)*velocity.x;
      Float v2y=2*mass/(mass+other.mass)*velocity.y;
      
      this.setVelocity(v1x,v1y);
      other.setVelocity(v2x,v2y);
      
      
      if(location.x<other.location.x){
        location.x-=1;
      }
      else if(location.x>other.location.x){
        location.x+=1;
      }
      if(location.y<other.location.y){
        location.y-=1;
      }
      else if(location.y>other.location.y){
        location.y+=1;
      }
     
    }
  }
}
