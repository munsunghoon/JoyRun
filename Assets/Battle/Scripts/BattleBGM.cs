using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BattleBGM : MonoBehaviour
{
    public AudioSource bgm;
    public AudioSource subtitle;

    // Start is called before the first frame update
    void Start()
    {
        bgm.Play();
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
        if (GameManager.instance.GetGameState() == GameState.Battle)
        {
            if (!bgm.isPlaying)
            {
                bgm.Play();
                subtitle.Stop();

            }
        }
        else
        {
            if (!subtitle.isPlaying)
            {
                bgm.Stop();
                subtitle.Play();
            }

        }

        GameManager.instance.SetStateChanged(false);
    }
}
