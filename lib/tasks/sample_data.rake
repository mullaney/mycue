namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		# Scripts
		3.times do |n|
			# Scripts
			script = Script.create!(title: "Script Example - #{n+1}")
			# Characters
			char = Character.create!(name: "Character #{n+1}", script_id: script.id)
			# Scenes
			2.times do |s|
				scene = Scene.create!(name: "Scene #{n+1}.#{s+1}", script_id: script.id, order: s)
				# Lines
				7.times do |l|
					line = Line.create!(cue: Faker::Lorem.sentences(1).join(" "), 
						                  line: Faker::Lorem.sentences(2).join(" "), 
						                  scene_id: scene.id, character_id: char.id, order: l)
				end
			end
		end
	end
end

#line: Faker::Lorem.sentences(2).to_s.gsub(/-/, '').join(" "),