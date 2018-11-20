// /*-------------------------------------------
// ---------------------------------------------
// Creation Date: 18/11/2018
// Author: Ben MacKinnon
// Description: Unity method to call Native PDF plugin. Pass in the string name of a file in Streaming assets (without extension)
// Soluis Technolgies ltd.
// ---------------------------------------------
// -------------------------------------------*/

using UnityEngine;
using System.Runtime.InteropServices;

public class OpenPDFCmd : MonoBehaviour 
{
    [DllImport ("__Internal")]
    private static extern void _OpenPDF(string pdfName);

    public void Trigger(string pdfName)
    {
        OpenPDF(pdfName);
    }

    public static void OpenPDF(string name)
    {
        if (Application.platform == RuntimePlatform.IPhonePlayer)
        {
            _OpenPDF(name);
        }
    }
}
