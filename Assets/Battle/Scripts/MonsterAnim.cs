using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterAnim : MonoBehaviour
{
    public static MonsterAnim instance;

    Animator animator;

    public float hp;
    public float playerHp;
    public int randomNumber;


    public float timer = 0;

    public static bool attack;


    void Awake() { instance = this; }
    // Start is called before the first frame update
    void Start()
    {
        animator = GetComponent<Animator>();
        attack = false;

    }

    // Update is called once per frame
    void Update()
    {
        timer += Time.deltaTime;

        playerHp = (float)PlayerHealthbarHandler.GetHealthBarValue() * 100;
        hp = (float)HealthBarHandler.GetHealthBarValue() * 100;

        if (hp == 0)
        {
            animator.SetBool("die", true);
            attack = false;

        }
        else if (playerHp == 0)
        {
            animator.SetBool("victory", true);
            attack = false;
        }
        else
        {
            if (timer > 3.5f)
                HandleGame(hp, playerHp);
        }




    }
    void HandleGame(float hp, float playerHp)
    {
        if (hp == 0)
        {
            animator.SetBool("die", true);
            attack = false;

        }
        else if (playerHp == 0)
        {
            animator.SetBool("victory", true);
            attack = false;
        }
        else
            HandleMonsterAction();
    }
    void HandleMonsterAction()
    {
        attack = true;
        int rn = Random.Range(1, 3);
        switch (rn)
        {
            case 1:
                animator.SetTrigger("kick");
                break;

            case 2:
                animator.SetTrigger("punch");
                break;
            default:
                break;
        }
        StartCoroutine(MonsterActionInitialize());
        timer = 0;
    }
    IEnumerator MonsterActionInitialize()
    {
        yield return new WaitForSeconds(1f);
        animator.ResetTrigger("kick");
        animator.ResetTrigger("punch");
        attack = false;
    }

    public static bool GetMonsterState()
    {
        if (attack == true)
        {
            return true;
        }
        else
            return false;

    }


}