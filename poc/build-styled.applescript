set bgPath to "/Users/adriengibaud/dev/presentation/poc/bg-dark-purple.png"
set outPath to "/Users/adriengibaud/dev/presentation/poc/styled-poc.key"

tell application "Keynote"
	activate
	set thisDoc to make new document with properties {document theme:theme "White", width:1920, height:1080}
	set W to width of thisDoc
	set H to height of thisDoc

	-- ===== Slide 1: Title =====
	tell slide 1 of thisDoc
		set base slide to slide layout "Blank" of thisDoc
		make new image with properties {file:POSIX file bgPath, position:{0, 0}, width:W, height:H}
		set t1 to make new text item with properties {object text:"How I actually work", position:{W * 0.1, H * 0.34}, width:W * 0.8}
		set size of object text of t1 to 92
		set color of object text of t1 to {65535, 65535, 65535}
		try
			set font of object text of t1 to "Helvetica Neue Bold"
		end try
		set s1 to make new text item with properties {object text:"The part that's still my job", position:{W * 0.1, H * 0.56}, width:W * 0.8}
		set size of object text of s1 to 40
		set color of object text of s1 to {48000, 42000, 60000}
		set presenter notes to "Punchline up front: almost none of this is about AI. It's engineering."
	end tell

	-- ===== Slide 2: Bullets =====
	set sl2 to make new slide at end of slides of thisDoc with properties {base slide:slide layout "Blank" of thisDoc}
	tell sl2
		make new image with properties {file:POSIX file bgPath, position:{0, 0}, width:W, height:H}
		set t2 to make new text item with properties {object text:"My workflow", position:{W * 0.08, H * 0.1}, width:W * 0.84}
		set size of object text of t2 to 72
		set color of object text of t2 to {65535, 65535, 65535}
		try
			set alignment of every paragraph of object text of t2 to left
		end try
		try
			set font of object text of t2 to "Helvetica Neue Bold"
		end try
		set bodyText to "•   Understand the requirements
•   Draw before I prompt
•   Iterate the design plan until it's exactly right
•   Let it execute, task by task
•   Review everything at the end"
		set b2 to make new text item with properties {object text:bodyText, position:{W * 0.08, H * 0.32}, width:W * 0.84}
		set size of object text of b2 to 40
		set color of object text of b2 to {62000, 60000, 65535}
		try
			set alignment of every paragraph of object text of b2 to left
		end try
		set presenter notes to "Tools mentioned by name only here. Mechanics come in Section 4."
	end tell

	save thisDoc in POSIX file outPath
end tell
