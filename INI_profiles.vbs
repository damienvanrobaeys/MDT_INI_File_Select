Function Wizard_Display
	MyHeader.style.display = "none"
	RightWizardButtons.style.backgroundcolor = "#3373F2" 
End function

Function Listprofile	
	Dim oFolder, colINI, ObjOption, objIni, INI_folder, ProfileName
	INI_folder = oEnvironment.Item("DeployDrive") & "\INI_folder\" 
	If oFSO.FolderExists(INI_folder) Then
		Set oFolder = oFSO.GetFolder(INI_folder)
		Set colINI = oFolder.Files		
		If colINI.Count > 0 Then
			For Each objIni in colINI
				ProfileName = objIni.name
				test = objIni
				If UCase(oFSO.GetExtensionName(objIni.name)) = "INI" Then	
					Set ObjOption = document.createElement("OPTION")				
					ObjOption.Text = objIni.Name
					ObjOption.value = ProfileName												
					profile.Add(ObjOption)
				End If
			Next			
		Else 
			ProfileFolder_Error.innerhtml = "No profiles found !!!"
			ProfileFolder_Error.style.color = "red"	
			ProfileFolder_Error.style.fontWeight  = "bold"
			
		End if	
	Else
		ProfileFolder_Error.innerhtml = "No INI Profile folder found !!!"
		ProfileFolder_Error.style.color = "red"	
		ProfileFolder_Error.style.fontWeight  = "bold"	
	End if	
End function	

Function On_Select_Profile
	Dim objOption, My_Profile, INI_folder
    For Each objOption in profile.Options	
        If objOption.Selected Then
			My_Profile = oEnvironment.Item("DeployDrive") & "\INI_folder\" & ObjOption.value
			oEnvironment.Item("RulesFile") = My_Profile
        End If
    Next
End function 


