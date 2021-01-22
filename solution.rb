# Code your solution here! 

 
def blue_aliens
   SELECT name, color FROM aliens WHERE color = 'blue';
end

def old_aliens
   SELECT name, age FROM aliens WHERE age > 100;
end

def dangerous_aliens
   SELECT name FROM aliens WHERE dangerous = true;
end


def fastest_spaceship
   SELECT * FROM spaceships ORDER BY speed DESC LIMIT 1;
end

def aliens_aboard_fastest_spaceship
   SELECT aliens.name FROM aliens
   JOIN spaceships
   ON aliens.spaceship_id = spaceships.id
   WHERE spaceships.speed = (SELECT MAX(spaceships.speed) FROM spaceships);
end


def aliens_and_spaceships
   SELECT aliens.name, spaceships.name AS spaceship FROM aliens
   JOIN spaceships
   ON aliens.spaceship_id = spaceships.id
end


def aliens_and_planets
   SELECT aliens.name, planets.name AS planet FROM aliens
   JOIN planets
   ON aliens.spaceship_id = planets.id  
end


def aliens_aboard_beebop
   SELECT aliens.name FROM aliens
   JOIN spaceships
   ON aliens.spaceship_id = spaceships.id
   WHERE spaceships.name = 'Beebop'
end


def aliens_from_gliese
   SELECT aliens.name, planets.name AS planet FROM aliens
   JOIN planets
   ON aliens.spaceship_id = planets.id  
   WHERE planets.name = "Gliese"
end

def spaceship_count_for_each_planet
   SELECT planets.name, COUNT(spaceships.id) AS spaceships FROM planets
   JOIN spaceships
   ON spaceships.planet_id = planets.id
   GROUP BY planets.name
end

def alien_count_for_spaceships
   SELECT spaceships.name, COUNT(aliens.id) AS num_of_aliens FROM spaceships
   JOIN aliens
   ON aliens.spaceship_id = spaceships.id
   GROUP BY spaceships.name  
end

def alien_count_for_planets
   SELECT planets.name, COUNT(aliens.id) AS num_of_aliens FROM planets
   JOIN spaceships ON spaceships.planet_id = planets.id
   JOIN aliens ON aliens.spaceship_id = spaceships.id
   GROUP BY planets.name  
end

def order_planets_by_aliens
   SELECT planets.name, COUNT(aliens.id) AS num_of_aliens FROM planets
   JOIN spaceships ON spaceships.planet_id = planets.id
   JOIN aliens ON aliens.spaceship_id = spaceships.id
   GROUP BY planets.name  
   ORDER BY num_of_aliens DESC
end

def spaceshisps_with_blue_aliens
   SELECT spaceships.name FROM spaceships
   JOIN aliens ON aliens.spaceship_id = spaceships.id
   WHERE aliens.color = 'blue'
   GROUP BY spaceships.name
end

def spaceship_and_alien_count
 
   SELECT planets.name, COUNT(spaceships.id) AS spaceships, (SELECT COUNT(spaceships.planet_id) AS aliens_per_ship 
   FROM planets
     JOIN spaceships ON planets.id = spaceships.planet_id 
       JOIN aliens ON spaceships.id = aliens.spaceship_id 
       GROUP BY planets.name) AS aliens_per_planet
    FROM planets
      JOIN spaceships
      ON spaceships.planet_id = planets.id
      GROUP BY planets.name

      ##Couldn't get the correct number of aliens per planet for this one
   
end

def order_planets_by_alien_count
   SELECT planets.name, COUNT(aliens.id) AS num_of_aliens FROM planets
   JOIN spaceships ON spaceships.planet_id = planets.id
   JOIN aliens ON aliens.spaceship_id = spaceships.id
   GROUP BY planets.name  
   ORDER BY num_of_aliens
end

def order_planets_by_old_alien_count
   SELECT planets.name, COUNT(aliens.id) AS num_of_aliens FROM planets
   JOIN spaceships ON spaceships.planet_id = planets.id
   JOIN aliens ON aliens.spaceship_id = spaceships.id
   WHERE aliens.age > 100
   GROUP BY planets.name  
   ORDER BY num_of_aliens 
end

