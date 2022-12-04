-- ---------- JdtLS ---------- --
local WORKSPACE_PATH = os.getenv("HOME") .. "/.local/share/java/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. project_name

-- avoid creating some unnecesary folders on $HOME
return {
	vmargs = {
		"-data",
		workspace_dir,
	},
}
