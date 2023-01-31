using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Balloon : MonoBehaviour
{
    Animator animator;
    // Start is called before the first frame update
    void Start()
    {
        animator = transform.Find("balloon").gameObject.GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    // 펀치 당하면 날아가는 애니메이션
    public void GoAway()
    {
        animator.SetTrigger("isPunched");
    }
    public void Boom()
    {
        animator.SetTrigger("boom");
    }
}
