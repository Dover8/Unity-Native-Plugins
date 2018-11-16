// /*-------------------------------------------
// ---------------------------------------------
// Creation Date: 02/03/18
// Author: bmackinnon
// Description: Shows how to use the native Volume plugin. Needs to be on a GameObject named 'Video Player' to receive the volume update notifications (or update that in NativeVolume.mm)
// Soluis Technolgies ltd.
// ---------------------------------------------
// -------------------------------------------*/

using UnityEngine;
using UnityEngine.UI;
using System;
using System.Runtime.InteropServices;

public class VolumeController : MonoBehaviour {

    [DllImport ("__Internal")]
    private static extern void _SetVolume(float val);

    [DllImport ("__Internal")]
    private static extern float _GetVolume();

    //this is a UI Slider to represent the system volume
    public Slider volumeSlider;
    
    // needs to be set to true when the user is touching the above slide
    public bool isVolumeScrubbing {get; set;}

    /// <summary>
    /// This function is called when the object becomes enabled and active.
    /// </summary>
    void OnEnable()
    {
        #if !UNITY_EDITOR
        volumeSlider.value = _GetVolume();
        #endif
    }

    public void SystemVolumeUpdateNotification(string value)
    {
        //ignore updates that were caused by the user in unity
        if (isVolumeScrubbing) 
        {
            return;
        } 

        float volume = float.Parse(value);
        volumeSlider.value = volume;
    }

    public void SetSytemVolume(float val)
    {
        //volumeText.text = "Set system volume to: " + val;
        if (isVolumeScrubbing)
        {
            _SetVolume(val);
        }
    }
}
