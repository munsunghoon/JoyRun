using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationDelayScript : MonoBehaviour
{
    public float delayTime;
    private Animation ani;

    void Start()
    {
        ani = GetComponent<Animation>();
        StartCoroutine("DelayAnimation");
    }


    public IEnumerator DelayAnimation()
    {
        yield return new WaitForSeconds(delayTime);
        ani.Play();
    }
}
