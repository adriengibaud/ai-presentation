-- Proof-of-concept: build a few Section 3 slides natively in Keynote
set outPath to "/Users/adriengibaud/dev/presentation/poc/section3-poc.key"

tell application "Keynote"
	activate
	set thisDoc to make new document with properties {document theme:theme "White"}

	-- Slide 1: Title (centre)
	tell slide 1 of thisDoc
		set base slide to slide layout "Title - Centre" of thisDoc
		set object text of default title item to "How I Actually Work"
		try
			set object text of default body item to "Planning and review are the real work now"
		end try
		set presenter notes to "Open the body here. Remind the room of the thesis before walking the workflow."
	end tell

	-- Slide 2: Bullets
	set s2 to make new slide at end of slides of thisDoc with properties {base slide:slide layout "Title & Bullets" of thisDoc}
	tell s2
		set object text of default title item to "My workflow"
		set object text of default body item to "Understand the requirements
Draw before I prompt (Excalidraw)
Iterate the design plan until it is exactly right
Let it execute task by task
Review everything at the end"
		set presenter notes to "Tools mentioned by name only here. Mechanics come in Section 4."
	end tell

	-- Slide 3: Big-idea slide with speaker notes
	set s3 to make new slide at end of slides of thisDoc with properties {base slide:slide layout "Title - Centre" of thisDoc}
	tell s3
		set object text of default title item to "Make the feedback loop fast"
		try
			set object text of default body item to "It is the agent's senses"
		end try
		set presenter notes to "ESLint to oxlint: 15s to 400ms. Prettier to oxfmt: 400ms. Tests: 70-80s to 16s. Joke: AI basically forced us to recreate CI, but fast and local."
	end tell

	save thisDoc in POSIX file outPath
end tell
