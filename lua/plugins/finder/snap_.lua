local snap = require("snap")
snap.maps({
	{ "pp", snap.config.file({ producer = "ripgrep.file" }) },
})
