# MyCue

MyCue is an actor's aid for learning lines.

This application is not finished. It has a working model for users and the other models and forms are all there in some fashion, but it is not currently ready for use in any sense of the word. However, I expect it will be useable in some fashion within a few weeks.

## To Do
* Get Script add -> takes you to the Script page with the ability to add on scenes.
* Associations between users scenes and lines
* Model testing for scenes
* Model testing for lines
* Quiz mode for particular scene
* Quiz mode randomize the lines
* Streamline require jquery_ui?

## Models

### Script
A script that the user is learning (a play, a film)
* :title, :string
* has_many :scenes
* has_many :lines, through: scene

### Scene
* has_many :lines
* belongs_to :scene
* :name, :string (may be number or titleish thing)
* :script_id, :integer
* :order, :integer - number for the order of scenes within a script

### Lines
* belongs_to :scene
* belongs_to :script, through: :scene
* :scene_id, :integer
* :character_id, :integer
* :cue, :string
* :line, :string
* :first_letter - first letter only from line 
* :order, :integer - number for the order of lines within a scene