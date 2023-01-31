using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundManager : MonoBehaviour
{
    public AudioSource normal;
    public AudioSource menu;

    // Start is called before the first frame update
    void Start()
    {
        menu.Play();
    }

    // Update is called once per frame
    void Update()
    {
        if (GameManager.instance.GetStateChanged())
        {
            ChangeBGM();
        }
    }

    void ChangeBGM()
    {
        if(GameManager.instance.GetGameState() == GameState.Game)
        {
            if (!normal.isPlaying)
            {
                normal.Play();
                menu.Stop();
            }

        }
        else
        {
            if (!menu.isPlaying)
            {
                normal.Stop();
                menu.Play();
            }
        }


    }
}
