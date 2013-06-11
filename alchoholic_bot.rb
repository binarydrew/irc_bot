class AlchoholicBot

	ARCHITECT_RESP = ["So what d'you do for a living?", "Yeah, erecting monuments just makes one feel like a god", 
		              "There's really no other profession worth discussing.", 
		              "Designing a building is like creating a painting, it's very erotic.", 
		              "Another Bourbon!(to bartender) not drinking tonight?", 
		              "I Have an extensive resume, most of the buildings downtown were my work",
	                  "Good evening, My name is Ian Jacobs. I'm an architect."]
	DOCTOR_RESP = ["There's great satisfaction in knowing you've made the world better", 
		           "I don't believe I have divine power, but people's fate does lay in my hands", 
		           "Last week one of my patients sent me a box of Cuban cigars, it's their love that keeps me going.",
	               "I'm a Cardiac Surgeon, in case you were wondering.", 
		           "I can't imagine going a day wothout helping people.", 
		           "So where are you from?", "Good evening, I'm Dr. Tremblay."]
	ENTREPENUER_RESP = ["Oh I'm an entrepenuer.", "Hi, I'm Vaine Carter", 
		                "Yes, I'm working on a lot of interesting start-ups right now.", 
		                "Oh I'd kill myself before I work for an employer!", 
		                "I can't understand people who're willing to slave for someone else", 
		                "I'm telling you, the future is in self-employment."]

	RESPONSES = [ARCHITECT_RESP, DOCTOR_RESP, ENTREPENUER_RESP]

	LITTLE_DRUNK = ["where did you say you were from again?", "wait, what was your name again?",
	                "who the Hell took my drink!?", "where did life go so wrong!!?", 
	                "HAhahah......I'm usually not this drunk.", "can you pass me that lime over"\
	                " there? BARTENDER! TEQUILA SHOT!!", "my wife left me for Quentin Tarantino!"\
	                " and I will Never blame her for that", "Could you not make that Noise!", 
	                "The waters don't run deep with you do they?"]
	PISS_DRUNK = ["AAARGH I HATE YOU GOD!", "Nobody likes me!!", "I Shoul've nevver bbought those drugs....", 
				   "WHY IS LIFE SO UNFAIR!!", "Thank YOU! You're my FRiend! YOU'RE MY BOY!!", 
				   "ZZZZZzzzzzzzzzzZZZ...Urgh Who Woke Me Up!?", "OOH....(hic)trust I'm, me not(hic) drunk...",
				   "......I'll level with you(hic), I have no money", "(sob) I actually work at burgger king....(hic)"]
	BREAK_RESP = ["Would you mind your language!", "I don't appreciate your demeanor.", "That's uncalled for!", 
		          "Have some respect for people superior to you."]

	def initialize
		@resp_type = RESPONSES.sample
		@resp_count = 0
	end

	def talk(input)
		if @resp_count == 0
			resp = @resp_type.pop
			@resp_count += 1
		elsif @resp_count < 4
			resp = @resp_type.sample
			@resp_count += 1
		elsif @resp_count < 9 and ["fuck", "godamnit", "godamnitt", "motherfucker", 
				                   "cock", "asshole", "cunt", "prick"].include? input
			resp = BREAK_RESP.sample
		elsif @resp_count < 9
			resp = LITTLE_DRUNK.sample
			@resp_count += 1
		else
			resp = PISS_DRUNK.sample
		end
		resp
	end
end