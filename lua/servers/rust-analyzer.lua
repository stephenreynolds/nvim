return {
	cargo = {
		allFeatures = true,
	},
	checkOnSave = {
		allFeatures = true,
		command = "clippy",
	},
	procMacro = {
		ignored = {
			["async-trait"] = { "async_trait" },
			["napi-derive"] = { "napi" },
			["async-recursion"] = { "async_recursion" },
		},
	},
}
