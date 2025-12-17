return {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    config = function()                     -- For the command not found error
        require("live-server").setup()
    end,
}

