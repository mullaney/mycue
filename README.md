# MyCue

MyCue is an actor's aid for learning lines.

## To Do
* Add new script without leaving index (using jQuery/Ajax)
* Add new scene on show script
* Add new character on show script
* Add new line on show scene
* Before save check if order of line (and scene) is null and change it to 0?
* Quiz mode for particular scene
* Quiz mode randomize the lines
* require jquery_ui?

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