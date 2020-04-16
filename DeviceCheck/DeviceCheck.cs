// /*-------------------------------------------
// ---------------------------------------------
// Creation Date: 16/04/20
// Author: benmackinnon
// Description: DeviceCheck
// Soluis Technolgies ltd.
// ---------------------------------------------
// -------------------------------------------*/

using UnityEngine;
using System.Runtime.InteropServices;

public class DeviceCheck : MonoBehaviour 
{
#if UNITY_IPHONE && !UNITY_EDITOR
    [DllImport("__Internal")]
    private static extern bool _IsPad();
#endif

    public static bool IsPad()
    {
#if UNITY_IPHONE && !UNITY_EDITOR
        return _IsPad();
#else
        return false;
#endif
    }
}
