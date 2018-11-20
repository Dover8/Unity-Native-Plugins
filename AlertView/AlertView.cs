// /*-------------------------------------------
// ---------------------------------------------
// Creation Date: 6/16/2017
// Author: Ben MacKinnon
// Description: Plugin for native alert views.
// Soluis Technolgies ltd.
// ---------------------------------------------
// -------------------------------------------*/

using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class AlertView {

	/* Interface to native implementation */

	[DllImport ("__Internal")]
	private static extern void _ShowAlert (string title, string message);

	/* Public interface for use inside Unity */

	public static void ShowAlert(string title, string message)
	{
		if (Application.platform == RuntimePlatform.IPhonePlayer) 
		{
			_ShowAlert (title, message);
		}
	}

}
