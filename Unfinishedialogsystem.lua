plr = game.Players.LocalPlayer

function Bert()
	local Di = require(game.Workspace.NPCS["Bert."].Body.Talk.Dialog)
	local Path = Di
	game.Workspace.NPCS["Bert."].Body.Talk.Enabled = false

	local function Leave()
		game.Workspace.NPCS["Bert."].Body.Talk.Enabled = true
		plr.PlayerGui.Dialogue.Frame.Visible = false
	end
	
	plr.PlayerGui.Dialogue.Frame.LO.MouseButton1Click:Connect(Leave)

	local function Write(text, ui)
		ui.Text = ""
		task.wait(0.05)
		for i = 1, #text do
			ui.Text = string.sub(text, 1,i)
			task.wait(0.05)
		end
		task.wait(1)
		if Path.ResponsesAmount == 0 then
			task.wait(2)
			game.Workspace.NPCS["Bert."].Body.Talk.Enabled = true
			plr.PlayerGui.Dialogue.Frame.Visible = false
		else
			local OldPath = Path
			if Path.Responses.Leave == "None" then
				plr.PlayerGui.Dialogue.Frame.LO.Visible = false
			else
				plr.PlayerGui.Dialogue.Frame.LO.Visible = true
			end
			plr.PlayerGui.Dialogue.Frame.LO.Text = Path.Responses.Leave
			for i = 1, Path.ResponsesAmount do
				plr.PlayerGui.Dialogue.Frame["O".. i].Visible = true
				plr.PlayerGui.Dialogue.Frame["O".. i].Text = Path.Responses["Response".. i].R
			end
			plr.PlayerGui.Dialogue.Frame.O1.MouseButton1Click:Connect(function()
				if OldPath == Path then
					plr.PlayerGui.Dialogue.Frame.LO.Visible = false
					for i = 1, 4 do
						plr.PlayerGui.Dialogue.Frame["O".. i].Visible = false
					end
					Path = Path.Responses["Response".. 1]
					Write(Path.Q, plr.PlayerGui.Dialogue.Frame.Dialogue)
				end
			end)
			plr.PlayerGui.Dialogue.Frame.O2.MouseButton1Click:Connect(function()
				if OldPath == Path then
					plr.PlayerGui.Dialogue.Frame.LO.Visible = false
					for i = 1, 4 do
						plr.PlayerGui.Dialogue.Frame["O".. i].Visible = false
					end
					Path = Path.Responses["Response".. 2]
					Write(Path.Q, plr.PlayerGui.Dialogue.Frame.Dialogue)
				end
			end)
			plr.PlayerGui.Dialogue.Frame.O3.MouseButton1Click:Connect(function()
				if OldPath == Path then
					plr.PlayerGui.Dialogue.Frame.LO.Visible = false
					for i = 1, 4 do
						plr.PlayerGui.Dialogue.Frame["O".. i].Visible = false
					end
					Path = Path.Responses["Response".. 3]
					Write(Path.Q, plr.PlayerGui.Dialogue.Frame.Dialogue)
				end
			end)
			plr.PlayerGui.Dialogue.Frame.O4.MouseButton1Click:Connect(function()
				if OldPath == Path then
					plr.PlayerGui.Dialogue.Frame.LO.Visible = false
					for i = 1, 4 do
						plr.PlayerGui.Dialogue.Frame["O".. i].Visible = false
					end
					Path = Di.Responses["Response".. 4]
					Write(Path.Q, plr.PlayerGui.Dialogue.Frame.Dialogue)
				end
			end)
		end
	end

	local function OK()
		plr.PlayerGui.InGame.TextButton.Visible = false
		plr.PlayerGui.Dialogue.Frame.Visible = true
		plr.PlayerGui.Dialogue.Frame.NName.Text = Di.Name
		Write(Di.Q, plr.PlayerGui.Dialogue.Frame.Dialogue)
	end
	
	OK()
end

game.Workspace.NPCS["Bert."].Body.Talk.Triggered:Connect(Bert) --Replace with a for with a table in a module full of the characters
